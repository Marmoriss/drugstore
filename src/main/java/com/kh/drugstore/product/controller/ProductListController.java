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
	
	// 카테고리 id로 상품 리스트 조회
	@GetMapping("/productList.do")
	public void productListByCategory(@RequestParam(defaultValue = "1") int cPage,
								HttpServletRequest request,
								@RequestParam(value="categoryId", required=false) 
								int categoryId, 
								Model model) {
		
		Map<String, Integer> param = new HashMap<>();
		
		int limit = 20;
		param.put("cPage", cPage);
		param.put("limit", limit);
		
		List<Product> list = productService.findAllProduct(param);
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
		//소분류 카테고리 리스트 
		List<Product> smallList = productService.selectProductBysmallCategoryId(categoryId);
		log.debug("smallList = {}", smallList);
		model.addAttribute("smallList", smallList);
		
		//대분류 카테고리 리스트
		List<Product> bigList = productService.selectProductByBigCategoryId(categoryId);
		log.debug("bigList = {}", bigList);
		model.addAttribute("bigList", bigList);		

	}
	
	//최신순/낮은 가격순/높은가격순
	@GetMapping("/recentList")
	//최신등록순 
	public void recentList(@RequestParam int pcode, Model model) {
		List<Product> recentList = productService.sortProductByRecent(pcode);
		log.debug("recentList = {}", recentList);
		model.addAttribute("recentList", recentList);
	}
	@GetMapping("/priceList")
	//낮은 가격순
	public void priceList(@RequestParam int price, Model model) {
		List<Product> priceList = productService.sortProductByPrice(price);
		log.debug("priceList = {}", priceList);
		model.addAttribute("priceList", priceList);
	}
	
	//높은 가격순 
	@GetMapping("/priceListDesc")
	public void priceListDesc(@RequestParam int price, Model model) {
		List<Product> priceListDesc = productService.sortProductByPriceDesc(price);
		log.debug("priceListDesc = {}", priceListDesc);
		model.addAttribute("priceListDesc = {}", priceListDesc);
		
	}
	
	// 주희 코드 시작
	// 상품 코드로 상세페이지 조회
	@GetMapping("/productDetail.do")
	public void productDetail(@RequestParam int pcode, Model model) {
		log.debug("pcode = {}", pcode);
		Product product = productService.selectOneProductCollection(pcode);
		log.debug("product = {}", product);
		
		List<Qna> qnaList = qnaService.selectQnaListByPcode(pcode);
		log.debug("qnaList = {}", qnaList);
		
//		List<Review> reviewList = reviewService.selectReviewListByPcode(pcode);
		model.addAttribute("product", product);
		model.addAttribute("qnaList", qnaList);
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
