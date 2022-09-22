package com.kh.drugstore.subscription.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.drugstore.cart.model.service.CartService;
import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.service.ProductService;
import com.kh.drugstore.subscription.model.dto.Subscription;
import com.kh.drugstore.subscription.model.dto.SubscriptionProduct;
import com.kh.drugstore.subscription.model.service.SubscriptionService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/subscription")
public class SubscriptionController {
	
	@Autowired
	private SubscriptionService subscriptionService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CartService cartService;
	/**
	 * 구독 상품 페이지
	 * 
	 */
	@GetMapping("/product.do")
	public void subscription(Model model) {
		List<Product> productList = productService.selectSubscriptionAllProduct();
		model.addAttribute("productList", productList);
	}
	
	@PostMapping("/subscriptionEnroll.do")
	public String subscriptionEnroll(ModelAndView mav,Authentication authentication, @RequestParam int pcode) {
		Member member = (Member) authentication.getPrincipal();
		String memberId = member.getMemberId();
		
		// 장바구니에 담기
		
		Map<String,Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("pcode", pcode);
		
		int result = cartService.insertCart(map);
		
		return "redirect:/cart/cartList.do";
	}
	
	@GetMapping("/enrollInfo.do")
	public void enrollInfo(@RequestParam int productCode,@RequestParam int checkbox, Model model) {
		model.addAttribute("pcode", productCode);
		model.addAttribute("cartNo", checkbox);
	}
	
	@PostMapping("/enrollSubscriptionInfo.do")
	public String enrollSubscriptionInfo(Authentication authentication,@RequestParam String toDate, @RequestParam String fromDate,@RequestParam int pcode,@RequestParam int cartNo,Model model) {
		Member member = (Member) authentication.getPrincipal();
		String memberId = member.getMemberId();
		SubscriptionProduct subscription = new SubscriptionProduct();
		
		log.debug("타입 = {}",toDate.getClass().getName());
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate toDateFormat = LocalDate.parse(toDate, formatter);
        LocalDate fromDateFormat = LocalDate.parse(fromDate, formatter);
        
		subscription.setMemberId(memberId);
		subscription.setStartDate(toDateFormat);
		subscription.setSendDate(fromDateFormat);
		subscription.setPcode(pcode);
		
		
		log.debug("구독 정보 = {}",subscription);
		int result = subscriptionService.insertInfo(subscription);
		// subNo가져오기
		int subNo = subscriptionService.selectAllSubNoById(memberId);
		subscription.setSubNo(subNo);
		result = subscriptionService.insertInfoToProduct(subscription);
		
		
		model.addAttribute("subscription", subscription);
		return "redirect:/cart/cartOrder.do?checkbox="+ cartNo;
	
	}
	
	@PostMapping("/subscriptionCheck.do")
	public ResponseEntity<?> subscriptionCheck(Authentication authentication){
		Member member = (Member) authentication.getPrincipal();
		String memberId = member.getMemberId();
		
		SubscriptionProduct subscription = subscriptionService.subscriptionCheck(memberId);
		boolean isEmpty = subscription == null;
		
		return ResponseEntity.status(HttpStatus.OK).body(isEmpty);
	}
}
