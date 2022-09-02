package com.kh.drugstore.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.drugstore.admin.model.service.AdminService;
import com.kh.drugstore.product.model.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@GetMapping("/header.do")
	public void toAdmin() {
		
	}
	
	@GetMapping("/product/productList.do")
	public void productList() {
	}
	
	@GetMapping("/product/productEnroll.do")
	public void productEnroll() {}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
