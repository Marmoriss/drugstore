package com.kh.drugstore.servey.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.service.ProductService;
import com.kh.drugstore.servey.model.dto.Servey;
import com.kh.drugstore.servey.model.service.ServeyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/servey")
@Slf4j
public class ServeyController {

	@Autowired
	private ServeyService serveyService;
	
	@Autowired
	ProductService productService;

	@GetMapping("/servey.do")
	public void viewServey() {

	}
	
	@PostMapping("/symptomEnroll.do")
	public String symptomEnroll(Servey servey, RedirectAttributes redirectAttr, Principal principal, Model model) {

		
		String memberId = principal.getName();
		
		
		servey.setMemberId(memberId);
		
		
		String body = servey.getBody();
		
		switch(body) {
		case "350013": servey.setBody("장"); break;
		case "350012": servey.setBody("눈"); break;
		case "350014": servey.setBody("피로감"); break;
		case "350015": servey.setBody("면역"); break;
		case "350016": servey.setBody("심혈관계"); break;
		}
		
		
		int result = serveyService.symptomEnroll(servey);
		
		
		double height = Double.parseDouble(servey.getHeight());
		double weight = Double.parseDouble(servey.getWeight());
		
		double bmiOrigin = (weight / (height * height)) * 10000;
		double bmi = Math.round(bmiOrigin * 100) / 100;
		
		switch(servey.getBody()) {
		case "장": servey.setBody("350013"); break;
		case "눈": servey.setBody("350012"); break;
		case "피로감": servey.setBody("350014"); break;
		case "면역": servey.setBody("350015"); break;
		case "심혈관계": servey.setBody("350016"); break;
		}
		
		int category = Integer.parseInt(servey.getBody());
		List<Product> serveyProductList = productService.selectProductBysmallCategoryId(category);
		
		model.addAttribute("servey", servey);
		model.addAttribute("bmi", bmi);
		model.addAttribute("serveyProductList", serveyProductList);
		
		
		
		return "redirect:/servey/serveyResult.do";

		
	}

	@GetMapping("/serveyResult.do")
	public void serveyResult(Principal principal, Model model) {
		log.debug("principal#getName={}",principal.getName());
		Servey servey = serveyService.selectOneServey(principal.getName());
		double height = Double.parseDouble(servey.getHeight());
		double weight = Double.parseDouble(servey.getWeight());
		
		double bmiOrigin = (weight / (height * height)) * 10000;
		double bmi = Math.round(bmiOrigin * 100) / 100;
		
		switch(servey.getBody()) {
		case "장": servey.setBody("350013"); break;
		case "눈": servey.setBody("350012"); break;
		case "피로감": servey.setBody("350014"); break;
		case "면역": servey.setBody("350015"); break;
		case "심혈관계": servey.setBody("350016"); break;
		}
		
		int category = Integer.parseInt(servey.getBody());
		List<Product> serveyProductList = productService.selectProductBysmallCategoryId(category);
		
		model.addAttribute("servey",servey);
		model.addAttribute("bmi", bmi);
		model.addAttribute("serveyProductList", serveyProductList);
	}

	@PostMapping("/serveyCheck.do")
	public ResponseEntity<?> serveyCheck(Principal principal) {
		Servey servey = serveyService.selectOneServey(principal.getName());
		boolean available = servey != null;
		
		log.debug("available = {}",available);
		Map<String,Object> serveyMap = new HashMap<>();
		serveyMap.put("available", available);
		
		
		return ResponseEntity.status(HttpStatus.OK).body(serveyMap);
	}

	@PostMapping("/serveyDel.do")
	public ResponseEntity<?> serveyDel(Principal princiapl){
		int result = serveyService.deleteServey(princiapl.getName());
		
		
		return ResponseEntity.status(HttpStatus.OK).body(result);
	}
}
