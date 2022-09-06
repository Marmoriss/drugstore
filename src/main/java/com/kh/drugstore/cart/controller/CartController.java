package com.kh.drugstore.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.drugstore.cart.model.dto.CartMemberProduct;
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
		String memberId = member.getMemberId();
		List<CartMemberProduct> list = cartService.findCartListByMemberId(memberId);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		model.addAttribute("memberId", memberId);
		
		
		
	}
	
	@PostMapping("/cartDelete.do")
	public void cartDelete() {
		
	}
	
}
