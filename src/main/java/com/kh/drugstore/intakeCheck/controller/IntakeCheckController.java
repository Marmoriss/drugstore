package com.kh.drugstore.intakeCheck.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/intakeCheck")
public class IntakeCheckController {
	
	@GetMapping("/intakeCheck.do")
	public void intakeCheck(Authentication authentication, Model model) {
		// 사용자 정기 구독 정보 
		
	}
	
	
	
	
	
	
	
	
}
