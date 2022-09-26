package com.kh.drugstore.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.drugstore.cart.model.dto.Cart;
import com.kh.drugstore.cart.model.service.CartService;
import com.kh.drugstore.common.DrugstoreUtils;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.service.ProductService;
import com.kh.drugstore.qna.model.dto.Qna;
import com.kh.drugstore.qna.model.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductListController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	QnaService qnaService;
	
//	@Autowired
//	ReviewService reviewService;
	
	// 전체 조회
	@GetMapping("/productList.do")
	public void productListByCategory(@RequestParam(defaultValue = "1") int cPage,
								HttpServletRequest request,
								Model model) {
		
		Map<String, Integer> param = new HashMap<>();
		
		int limit = 12;
		param.put("cPage", cPage);
		param.put("limit", limit);
		
		List<Product> list = productService.selectAllProduct();
//		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		// 페이지바
		int totalContent = productService.getTotalContent();
//		log.debug("totalContent = {}", totalContent);
		String url = request.getRequestURI();
		String pagebar = DrugstoreUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);
		
		//카테고리 리스트 시작
//		log.debug("categoryId = {}", categoryId);	
		
	}
	
	// 카테고리 아이디별 상품 조회
	@GetMapping("/productListByCategoryId.do")
	public void selectListByCategoryId(@RequestParam int categoryId, Model model) {
		log.debug("categoryId = {}", categoryId);
		
		List<Product> listByCategoryId = productService.selectListByCategoryId(categoryId);
		log.debug("listByCategoryId = {}", listByCategoryId);
		
		model.addAttribute("listByCategoryId", listByCategoryId);
		
	}
	
	// 비동기 전체보기
	@GetMapping("/totalList.do")
	public ResponseEntity<?> totalList(){
		
		List<Product> list = productService.selectAllProduct();
		
		return ResponseEntity.ok(list);
	}
	
	//최신순/낮은 가격순/높은가격순
	@GetMapping("/recentList.do")
	//최신등록순 
	public ResponseEntity<?> recentList(@RequestParam int categoryId) {
		List<Product> recentList = productService.sortProductByRecent(categoryId);
		log.debug("recentList = {}", recentList);
		return ResponseEntity.ok(recentList);
	}
	@GetMapping("/priceList.do")
	//낮은 가격순
	public ResponseEntity<?> priceList(@RequestParam int categoryId) {
		List<Product> priceList = productService.sortProductByPrice(categoryId);
		log.debug("priceList = {}", priceList);
		return ResponseEntity.ok(priceList);
	}
	
	//높은 가격순 
	@GetMapping("/priceListDesc.do")
	public ResponseEntity<?> priceListDesc(@RequestParam int categoryId) {
		List<Product> priceListDesc = productService.sortProductByPriceDesc(categoryId);
		log.debug("priceListDesc = {}", priceListDesc);
		return ResponseEntity.ok(priceListDesc);
		
	}
	
	// 주희 코드 시작
	// 상품 코드로 상세페이지 조회
	@GetMapping("/productDetail.do")
	public void productDetail(@RequestParam int pcode, Model model, Authentication authentication) {
		log.debug("pcode = {}", pcode);
		Product product = productService.selectOneProductCollection(pcode);
		log.debug("product = {}", product);
		
		List<Qna> qnaList = qnaService.selectQnaListByPcode(pcode);
		log.debug("qnaList = {}", qnaList);
		
		String memberId = authentication.getName();
		
//		List<Review> reviewList = reviewService.selectReviewListByPcode(pcode);
		model.addAttribute("product", product);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("memberId", memberId);
	}

	@GetMapping("/autocompletePname.do")
	public ResponseEntity<?> autocompletePname(@RequestParam String term){
		List<String> resultList = productService.autocompletePname(term);
		log.debug("resultList = {}", resultList);
		
		return ResponseEntity.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.body(resultList);
	}
	
	@PostMapping("/checkCategory.do")
	public ResponseEntity<?> checkCategory(@RequestParam int[] checkCategoryByCartNo){
		// 카트 번호로 pcode가져오기
		List<Cart> carts = cartService.getPcode(checkCategoryByCartNo);
		log.debug("result = {}",carts);
		return ResponseEntity.status(HttpStatus.OK).body(carts);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
