package com.kh.drugstore.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/header.do")
	public void toAdmin() {
		
	}
	
	@GetMapping("/product/productEnroll.do")
	public void toProductEnroll() {
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
