package com.kh.drugstore.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.drugstore.cart.model.dto.Cart;
import com.kh.drugstore.cart.model.service.CartService;
import com.kh.drugstore.member.model.dto.Member;

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
			   @RequestParam(value = "pcode" , required = false) int pcode){
		log.debug("amount = {}", amount);	
		log.debug("pcode = {}", pcode);	
		
		int result = cartService.updateCart(amount, pcode);
		return ResponseEntity.ok(result);
	}
	
	@GetMapping("/cartOrder.do")
	public void cartOrder(@RequestParam int[] checkbox, Model model) {
		log.debug("checkbox = {}", checkbox);
		
		List<Cart> order = cartService.findOrderListByCartNo(checkbox);
	}
	
}	

