package com.kh.drugstore.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.drugstore.admin.model.service.AdminService;
import com.kh.drugstore.common.DrugstoreUtils;
import com.kh.drugstore.member.model.dto.User;

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
	
	
	@GetMapping("user/userList.do")
	public void userList(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		Map<String, Integer> param = new HashMap<>();
		int limit = 10;
		param.put("cPage", cPage);
		param.put("limit", limit);
		
		List<User> list = adminService.userList(param);
		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		// 2. pagebar영역
		int totalContent =adminService.getTotalContent();
		log.debug("totalContent = {}", totalContent);
		String url = request.getRequestURI(); 
		String pagebar = DrugstoreUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);
	}
// 태연코드 끝
	
	
	
	
	
	
	
	
	
	
	
}
