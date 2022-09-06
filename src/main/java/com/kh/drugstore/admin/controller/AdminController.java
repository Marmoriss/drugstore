package com.kh.drugstore.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.drugstore.admin.model.service.AdminService;
import com.kh.drugstore.common.DrugstoreUtils;
import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.product.model.dto.Category;
import com.kh.drugstore.product.model.dto.Product;
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

	@GetMapping("/header.do")
	public void toAdmin() {
		
	}

// 주희코드 시작	
	@GetMapping("/product/productList.do")
	public void productList(
			@RequestParam(defaultValue = "1") int cPage, 
			HttpServletRequest request, 
			Model model) {
		
		// 콘텐츠
		Map<String, Integer> param = new HashMap<>();
		
		int limit = 20;
		param.put("cPage", cPage);
		param.put("limit", limit);
		
		List<Product> list = productService.findAllProduct(param);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		// 페이지바
		int totalContent = productService.getTotalContent();
		log.debug("totalContent = {}", totalContent);
		String url = request.getRequestURI();
		String pagebar = DrugstoreUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);
		model.addAttribute("totalContent", totalContent);
	}
	
	@GetMapping("/product/productEnroll.do")
	public void productEnroll() {}
	
	@GetMapping("/product/category.do")
	public ResponseEntity<?> categorySelect(@RequestParam int categoryId) {
		List<Category> categoryList = adminService.selectCategoryList(categoryId);
		log.debug("categoryList= {}", categoryList);
		
		return ResponseEntity.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.body(categoryList);
	}
	
// 주희코드 끝	

	
// 태연코드 시작	
	@GetMapping("member/memberList.do")
	public void memberList(Model model) {
		List<Member> list = adminService.memberList();
		model.addAttribute("list", list);
	}
// 태연코드 끝
	
	
	
	
	
	
	
	
	
	
	
}
