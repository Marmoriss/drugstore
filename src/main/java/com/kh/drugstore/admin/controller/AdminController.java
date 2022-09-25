package com.kh.drugstore.admin.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.drugstore.admin.model.service.AdminService;
import com.kh.drugstore.chat.model.dto.ChatLog;
import com.kh.drugstore.chat.model.service.ChatService;
import com.kh.drugstore.common.DrugstoreUtils;
import com.kh.drugstore.member.model.dto.User;
import com.kh.drugstore.orders.model.dto.Orders;
import com.kh.drugstore.product.model.dto.Category;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;
import com.kh.drugstore.product.model.dto.ProductEntity;
import com.kh.drugstore.product.model.dto.SaleStatus;
import com.kh.drugstore.product.model.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ChatService chatService;

	HttpSession session;
	
	@GetMapping("/header.do")
	public void toAdmin() {
		
	}

// 주희코드 시작	
	@GetMapping("/product/productList.do")
	public void productList(Model model) {
		
		// 전체 상품 조회
		List<Product> allList = productService.selectProductList();
		log.debug("allList = {}", allList);
		model.addAttribute("allList", allList);
		
		int y = 0;
		int n = 0;
		int s = 0;
		for(Product product : allList) {
			if(SaleStatus.Y == product.getSaleStatus()) {
				y++;
			} else if(SaleStatus.N == product.getSaleStatus()) {
				n++;
			} else {
				s++;
			}
		}
		
		model.addAttribute("y", y);
		model.addAttribute("n", n);
		model.addAttribute("s", s);
		
	}
	
	@GetMapping("/product/productEnroll.do")
	public void productEnrollForm() {}
	
	@GetMapping("product/productUpdate.do")
	public void productUpdate(@RequestParam int pcode, Model model) {
		Product product = productService.selectOneProductCollection(pcode);
		log.debug("product = {}", product);
		model.addAttribute("product", product);
	}
	
	@GetMapping("/product/category.do")
	public ResponseEntity<?> categorySelect(@RequestParam int categoryId) {
		List<Category> categoryList = adminService.selectCategoryList(categoryId);
		log.debug("categoryList= {}", categoryList);
		
		return ResponseEntity.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.body(categoryList);
	}
	
	
	@GetMapping("/autocompleteManu.do")
	public ResponseEntity<?> autocompleteManu(@RequestParam String term){
		List<String> resultList = adminService.autocompleteManu(term);
		log.debug("resultList = {}", resultList);
		
		return ResponseEntity.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.body(resultList);
	}
	
	@GetMapping("/product/findByValues.do")
	public String findByValues(
							ProductEntity product,
							@RequestParam String toDate,
							@RequestParam String fromDate,
							@RequestParam String enrollOrUpdate,
							Model model){
		
		// 전체 상품 조회
		List<Product> allList = productService.selectProductList();
		
		int y = 0;
		int n = 0;
		int s = 0;
		for(Product p : allList) {
			if(SaleStatus.Y == p.getSaleStatus()) {
				y++;
			} else if(SaleStatus.N == p.getSaleStatus()) {
				n++;
			} else {
				s++;
			}
		}
		
		model.addAttribute("y", y);
		model.addAttribute("n", n);
		model.addAttribute("s", s);
		model.addAttribute("allList", allList);
		
		List<ProductEntity> productList = productService.findByValues(product);
		List<ProductEntity> list = new ArrayList<>();
		
		if("".equals(toDate) || "".equals(fromDate)){
			toDate = "1111-01-01";
			fromDate = "9999-12-31";
			log.debug("LocalDate.parse(toDate) = {}", LocalDate.parse(toDate));
			log.debug("LocalDate.parse(fromDate) = {}", LocalDate.parse(fromDate));
		}
		
		for(ProductEntity _product : productList) {
			// 검색 조건이 생성일이고, 시작일보다 생성일이 크고, 종료일보다 생성일이 작을 때
			if("createdAt".equals(enrollOrUpdate)
					&& (_product.getCreatedAt().compareTo(LocalDate.parse(toDate)) >= 0) 
					&& (_product.getCreatedAt().compareTo(LocalDate.parse(fromDate)) <= 0)
					){
				list.add(_product);
				log.debug("통과");
			// 검색 조건이 수정일이고, 수정일이 null이 아니고, 수정일보다 생성일이 크고, 종료일보다 생성일이 작을 때
			} else if("updatedAt".equals(enrollOrUpdate) && product.getUpdatedAt() != null
					&& (_product.getCreatedAt().compareTo(LocalDate.parse(toDate)) >= 0) 
					&& (_product.getCreatedAt().compareTo(LocalDate.parse(fromDate)) <= 0)
					) {
				list.add(_product);
				log.debug("수정일 통과");
			}
		}
		
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		return "/admin/product/productList";
	}
	
	@PostMapping("/product/productEnroll.do")
	public String productEnroll(
					Product product,
					@RequestParam(name = "upFile") List<MultipartFile> upFileList,
					RedirectAttributes redirectAttr) 
							throws IllegalStateException, IOException {
		
		log.debug("product = {}", product);
		
		for(MultipartFile upFile : upFileList) {
			log.debug("upFile = {}", upFile);
			log.debug("upFile#name = {}", upFile.getName()); // upFile
			log.debug("upFile#name = {}", upFile.getOriginalFilename());
			log.debug("upFile#size = {}", upFile.getSize());
			
			if(!upFile.isEmpty()) {
				// a. 서버 컴퓨터에 저장
				String saveDirectory = application.getRealPath("/resources/upload/product");
				String renamedFilename = DrugstoreUtils.getRenamedFilename(upFile.getOriginalFilename());
				File destFilt = new File(saveDirectory, renamedFilename);
				upFile.transferTo(destFilt);
				
				// b. DB저장을 위해 Attachment 객체 생성
				ProductAttachment attach = new ProductAttachment(upFile.getOriginalFilename(), renamedFilename);
				product.add(attach);
			}
		}
		log.debug("product = {}", product);
		
		// db 저장
		int result = adminService.insertProduct(product);
		redirectAttr.addFlashAttribute("msg", "상품을 성공적으로 등록했습니다.");
		return "redirect:/admin/product/productEnroll.do";
	}
	
	@GetMapping("getCategoryParentLevel.do")
	public ResponseEntity<?> getCategoryParentLevel(@RequestParam int categoryId) {
		log.debug("categoryId = {}", categoryId);
		Category category = adminService.getCategoryParentLevel(categoryId);
		log.debug("category={}", category);
		
		return ResponseEntity.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.body(category);
	}
	
	@PostMapping("/product/productUpdate.do")
	public String productUpdate(
			Product product,
			@RequestParam(name = "upFile") List<MultipartFile> upFileList,
			@RequestParam(name = "delFile", required = false) int[] delFiles,
			RedirectAttributes redirectAttr) throws IllegalStateException, IOException {
		
		log.debug("product = {}", product);
		String saveDirectory = application.getRealPath("resources/upload/product");
		int result = 0;
		log.debug("delFiles = {}", delFiles);
		
		// 첨부파일 삭제
		if(delFiles != null) {
			for(int attachNo : delFiles) {
				
				// 파일 삭제
				ProductAttachment attach = adminService.selectOneAttachment(attachNo);
				File delFile = new File(saveDirectory, attach.getRenamedFilename());
				boolean deleted = delFile.delete();
				log.debug("{} 파일 삭제 : {}", attach.getRenamedFilename(), deleted);
				
				// product_attachment row제거
				result = adminService.deleteAttachment(attachNo);
				log.debug("{}번 attachment record 삭제 완료!", attachNo);
			}
		}
			
		// 첨부파일 추가
		for(MultipartFile upFile : upFileList) {
			log.debug("upFile = {}", upFile);
			log.debug("upFile#name = {}", upFile.getName()); // upFile
			log.debug("upFile#name = {}", upFile.getOriginalFilename());
			log.debug("upFile#size = {}", upFile.getSize());
			
			if(!upFile.isEmpty()) {
				// a. 서버 컴퓨터에 저장
				String renamedFilename = DrugstoreUtils.getRenamedFilename(upFile.getOriginalFilename());
				File destFile = new File(saveDirectory, renamedFilename);
				upFile.transferTo(destFile);
				
				// b. DB저장을 위해 Attachment 객체 생성
				ProductAttachment attach = new ProductAttachment(upFile.getOriginalFilename(), renamedFilename);
				attach.setPcode(product.getPcode());
				product.add(attach);
			}
		}
		log.debug("product#after = {}", product);
		result = adminService.updateProduct(product);
		
		redirectAttr.addFlashAttribute("msg", "상품을 성공적으로 수정하였습니다.");
			
		
		return "redirect:/admin/product/productUpdate.do?pcode=" + product.getPcode();
	}
	
	
// 주희코드 끝	

	
// 태연코드 시작	
	@GetMapping("user/userList.do")
	public void userList(
			@RequestParam(defaultValue = "1") int cPage, 
			Model model, 
			HttpServletRequest request) {
		
		// 1. content영역
		Map<String, Integer> param = new HashMap<>();
		int limit = 10;
		param.put("cPage", cPage);
		param.put("limit", limit);
		List<User> list = adminService.userList(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		
		// 2. pagebar영역
		int totalContent =adminService.getTotalContent();
		log.debug("totalContent = {}", totalContent);
		String url = request.getRequestURI(); 
		String pagebar = DrugstoreUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);
	}
	
	@GetMapping("user/userFinder.do")
	public String userFinder(	
			@RequestParam(defaultValue = "1") int cPage, 
			Model model, 
			HttpServletRequest request,
			@RequestParam(value = "searchType",required = false,defaultValue="") String searchType,
			@RequestParam(value = "keyword",required = false,defaultValue="") String keyword) {
	
		// 1. content영역
		Map<String, Object> param = new HashMap<>();
		int limit = 10;
		
		param.put("cPage", cPage);
		param.put("limit", limit);
		param.put("searchType", searchType); 
		param.put("keyword", keyword);
		
		
		List<User> list = adminService.userFinder(param);
		log.debug("list = {}", list);
		
		model.addAttribute("list", list);
		model.addAttribute("searchType",searchType);
		model.addAttribute("keyword",keyword);
		
		// 2. pagebar영역
		int totalContent = adminService.getTotalContentLike(param);
		log.debug("totalContent = {}", totalContent);
		String url = request.getRequestURI() + "?searchType=" + searchType + "&keyword=" + keyword;
		String pagebar = DrugstoreUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);
		return "admin/user/userList";
	}
	
	@GetMapping("/statis/enrollStatis.do")
	public void enrollStatis(Model model) {
			model.addAttribute("memMinus1", adminService.getMinus1Mem());
			model.addAttribute("memMinus2", adminService.getMinus2Mem());
			model.addAttribute("memMinus3", adminService.getMinus3Mem());
			model.addAttribute("memMinus4", adminService.getMinus4Mem());
			model.addAttribute("memMinus5", adminService.getMinus5Mem());
			model.addAttribute("memMinus6", adminService.getMinus6Mem());
			model.addAttribute("memMinus7", adminService.getMinus7Mem());
			model.addAttribute("memToday", adminService.getMemToday());
			
			model.addAttribute("serveyFcount", adminService.serveyFcount());
			model.addAttribute("serveyMcount", adminService.serveyMcount());
	}
	
	@GetMapping("/statis/visitStatis.do")
	public String visitStatis(Model model) {
		model.addAttribute("todayCount", adminService.getVisitTodayCount());
		model.addAttribute("totalCount", adminService.getVisitTotalCount());
		
		return "admin/statis/visitStatis";
	}
	
	@GetMapping("/orders/ordersList.do")
	public void orderList(Model model) {
		List<Orders> list = adminService.selectOrders();
		model.addAttribute("list", list);
	}

	@PostMapping("/orders/statusUpdate.do")
	public String statusUpdate(
			Orders orders, 
			HttpServletRequest request,
			@RequestParam(value = "merchantUid",required = false) int merchantUid) {

		int result = adminService.statusUpdate(merchantUid);

		return "redirect:/admin/orders/ordersList.do";
	}
	
	@GetMapping("/orders/findOrders.do")
	public String findOrders(
			@RequestParam String toDate,
			@RequestParam String fromDate,
			Model model) {
			
		Map<String, Object> param = new HashMap<>();
		
		param.put("toDate", toDate);
		param.put("fromDate", fromDate);
		
		List<Orders> list = adminService.findOrders(param);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		return "/admin/orders/ordersList";
	}
	
	@GetMapping("/chat/chatList.do")
	public void chatList(Model model) {
		// 채팅방별로 최근 1건 조회
		List<ChatLog> list = chatService.findRecentChatLogs();
		log.debug("list = {}", list);
		model.addAttribute("list", list);
	}
	
	@GetMapping("/chat/chat.do")
	public void chat(@RequestParam String chatroomId, Model model) {
		// 채팅로그목록 조회
		List<ChatLog> chatLogs = chatService.findChatLogByChatroomId(chatroomId);
		model.addAttribute("chatLogs", chatLogs);
		
	}
	
// 태연코드 끝
	
}	
