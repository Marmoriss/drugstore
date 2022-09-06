package com.kh.drugstore.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.drugstore.admin.model.service.AdminService;
import com.kh.drugstore.member.model.dto.Member;

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

// 주희코드 시작	
	@GetMapping("/product/productList.do")
	public void productList() {
	}
	
	@GetMapping("/product/productEnroll.do")
	public void productEnroll() {}
	
// 주희코드 끝	

	
// 태연코드 시작	
	@GetMapping("member/memberList.do")
	public void memberList(Model model) {
		List<Member> list = adminService.memberList();
		model.addAttribute("list", list);
	}
// 태연코드 끝
	
	
	
	
	
	
	
	
	
	
	
}
