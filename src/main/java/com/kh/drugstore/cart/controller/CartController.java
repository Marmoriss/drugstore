package com.kh.drugstore.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.drugstore.cart.model.dto.Cart;
import com.kh.drugstore.cart.model.dto.CartOrder;
import com.kh.drugstore.cart.model.service.CartService;
import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.orders.model.dto.Orders;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@GetMapping("/cartList.do")
	public void cartList(Authentication authentication, Model model) {
		
		Member member = (Member) authentication.getPrincipal();
		log.debug("member = {}", member);
		String memberId = member.getMemberId();
		log.debug("memberId = {}", memberId);
		
		List<Cart> list = cartService.findCartListByMemberId(memberId);	
		
		
		log.debug("list = {}", list);
		model.addAttribute("list", list);
//		Map<String, List> cartMap = cartService.findCartListByMemberId(memberId);
//		
//		model.addAttribute("cartMap", cartMap);
	}
	
	@PostMapping("/cartDelete.do") 
	public ResponseEntity<?> cartDelete(@RequestParam int[] delCartNo) {
		log.debug("delCartNo = {}",delCartNo);
		cartService.cartDelete(delCartNo);
		return ResponseEntity.ok(null);
	}
	
	@PostMapping("/updateCart.do")
	public ResponseEntity<?> updateCart(@RequestParam(value = "amount" , required = false) int amount,
			   @RequestParam(value = "cartNo" , required = false) int cartNo){
		log.debug("amount = {}", amount);	
		log.debug("cartNo = {}", cartNo);	
		Map<String, Object> param = new HashMap<>();
		param.put("amount", amount);
		param.put("cartNo", cartNo);
		
		int result = cartService.updateCart(param);
		return ResponseEntity.ok(result);
	}
	
	@GetMapping("/cartOrder.do")
	public String cartOrder(@RequestParam int[] checkbox, Model model) {
		log.debug("checkbox = {}", checkbox);
		
		List<Cart> order = cartService.findOrderListByCartNo(checkbox);
		
		log.debug("order = {}", order);
		model.addAttribute("order", order);
		return "/cart/orderList";
	}
	/**
	@PostMapping("/pay.do")
	public ResponseEntity<?> pay(@RequestParam int[] productCode, @RequestParam String finalPayment, @RequestParam int finalPrice, @RequestParam String finalmemberId, @RequestParam int[] cartAmount, @RequestParam int[] cartNo){
		
		log.debug("productCode = {}", productCode);
		log.debug("finalPayment = {}", finalPayment);
		log.debug("finalPrice = {}", finalPrice);
		log.debug("finalmemberId = {}", finalmemberId);
		log.debug("cartAmount = {}", cartAmount);
		log.debug("cartNo = {}", cartNo);
		
		Map<String, Object> param = new HashMap<>();
		param.put("productCode", productCode);
		param.put("finalPayment", finalPayment);
		param.put("finalPrice", finalPrice);
		param.put("finalmemberId", finalmemberId);
		param.put("cartAmount", cartAmount);
		param.put("cartNo", cartNo);
		int result = cartService.insertOrder(param);
		return ResponseEntity.ok(result);
	}
	**/
	
	@PostMapping("/insertOrder.do")
	public ResponseEntity<?> insertOrder(@RequestBody Map<String, Object> cartOrder){
		log.debug("cartOrder = {}", cartOrder);
		int result = cartService.insertOrder(cartOrder);
		return ResponseEntity.ok(result);
	}
	
	
}	

