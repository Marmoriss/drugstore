package com.kh.drugstore.product.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.drugstore.common.DrugstoreUtils;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductListController {
	
	@Autowired
	ProductService productService;
	
	// 페이징 메소드
	public void pageInit(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		//페이징 시작. 콘텐츠 영역
		Map<String, Integer> param = new HashMap<>();
		
		int limit = 15;
		param.put("cPage", cPage);
		param.put("limit", limit);
		
		List<Product> list = productService.findAllProduct(param); //모든 제품찾기 
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		//2. 페이지바
		int totalContent = productService.getTotalContent();
		log.debug("totalContent = {}", totalContent);
		String url = request.getRequestURI();
		String pagebar = DrugstoreUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);
		
		log.debug("list = {}", list);
		
	}
	
	// 카테고리 id로 상품 리스트 조회
	@GetMapping("/productList.do")
	public void productListByCategory(@RequestParam int categoryId, Model model) {
		log.debug("categoryId = {}", categoryId);
		List<Product> list = productService.selectProductByCategoryId(categoryId);
		
		log.debug("list = {}", list);
		model.addAttribute("list", list);
	}
	
	// 주희 코드 시작
	// 상품 코드로 상세페이지 조회
	@GetMapping("/productDetail.do")
	public void productDetail(@RequestParam int pcode, Model model) {
		log.debug("pcode = {}", pcode);
		Product product = productService.selectOneProductCollection(pcode);
		log.debug("product = {}", product);
		model.addAttribute("product", product);
		
	}
	
	
	@GetMapping("/autocompletePname.do")
	public ResponseEntity<?> autocompletePname(@RequestParam String term){
		List<String> resultList = productService.autocompletePname(term);
		log.debug("resultList = {}", resultList);
		
		return ResponseEntity.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.body(resultList);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
