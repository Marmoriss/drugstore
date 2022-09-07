package com.kh.drugstore.servey.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.drugstore.servey.model.service.ServeyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/servey")
@Slf4j
public class ServeyController {
	
	@Autowired
	private ServeyService serveyService;
	
	@GetMapping("/servey.do")
	public void viewServey() {
		
	}
	
}
