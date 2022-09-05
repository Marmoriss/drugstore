package com.kh.drugstore.intakeCheck.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/intakeCheck")
public class IntakeCheckController {
	
	@GetMapping("/intakeCheck.do")
	public void intakeCheck() {}
	
	
	
	
	
	
	
	
}
