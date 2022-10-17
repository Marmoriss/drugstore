package com.kh.drugstore.product.controller;

import java.util.List;

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
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.service.ProductService;
import com.kh.drugstore.qna.model.dto.Qna;
import com.kh.drugstore.qna.model.service.QnaService;
import com.kh.drugstore.review.model.dto.Review;
import com.kh.drugstore.review.model.service.ReviewService;

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
	
	@Autowired
	ReviewService reviewService;
	
	@GetMapping("/productList.do")
	public void productList(Model model) {
		List<Product> list = productService.selectAllProduct();
		model.addAttribute("list", list);
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
		if(authentication != null) {
			String memberId = authentication.getName();
			model.addAttribute("memberId", memberId);
		}
		
		List<Review> reviewList = reviewService.selectReviewListByPcode(pcode);
		log.debug("reviewList = {}", reviewList);
		
		// 리뷰 별점 평균 구하기
		int starPoint = 0;
		int index = 0;
		for(Review review : reviewList) {
			starPoint += review.getStar();
			index++;
		}
		double avgStar = (double) starPoint / index;
		log.debug("avgStar = {}", avgStar);
		
		// 리뷰 작성자 ID 끝 3자리 *로 가리기
		for(Review review : reviewList) {
			String reMemberId = review.getMemberId();
			int length = reMemberId.length();
			String first = reMemberId.substring(0, length - 3);
			log.debug(first + "***");
			review.setMemberId(first + "***");
		}
		
		model.addAttribute("product", product);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("avgStar", avgStar);
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
