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
		int result = serveyService.symptomEnroll(servey);
		double height = Double.parseDouble(servey.getHeight());
		double weight = Double.parseDouble(servey.getWeight());
		
		double bmiOrigin = (weight / (height * height)) * 10000;
		double bmi = Math.round(bmiOrigin * 100) / 100;
		
		
		List<Product> serveyProductList = productService.findServeyProduct(servey.getBody());
		
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
		
		List<Product> serveyProductList = productService.findServeyProduct(servey.getBody());
		
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
