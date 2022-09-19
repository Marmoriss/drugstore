package com.kh.drugstore.subscription.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.service.ProductService;
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
	
	/**
	 * 구독 상품 페이지
	 * 
	 */
	@GetMapping("/product.do")
	public void subscription(Model model) {
		List<Product> productList = productService.selectSubscriptionAllProduct();
		model.addAttribute("productList", productList);
	}
	
}
