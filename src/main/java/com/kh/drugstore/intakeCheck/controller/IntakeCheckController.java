package com.kh.drugstore.intakeCheck.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.drugstore.intakeCheck.model.dto.IntakeCheck;
import com.kh.drugstore.intakeCheck.model.service.IntakeService;
import com.kh.drugstore.product.model.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller  
@Slf4j
@RequestMapping("/intakeCheck")
public class IntakeCheckController {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private IntakeService intakeService;
	
	@GetMapping("/intakeCheck.do")
	public void intakeCheck(Authentication authentication, Model model) {
		// 사용자 권한 정보
		String memberId = authentication.getName();
		
		
		// 사용자 정기 구독 정보 받아오기(사용자 아이디 + 구독-상품 테이블 + 상품 테이블 조회 후 상품 리스트 받아오기)
		
		// 사용자가 섭취 알림 설정한 상품 정보 받아오기
		List<IntakeCheck> intakeList = intakeService.findByMemberId(memberId);
		log.debug("intakeList = {}", intakeList);
		
		model.addAttribute("intakeList", intakeList);
		
	}
	
	@PostMapping("/addIntakeList.do")
	public String addIntakeList(
				@RequestParam String pname,
				IntakeCheck intakeCheck,
				Authentication authentication,
				RedirectAttributes rediAttributes){
		
		log.debug("pname = {}", pname);
		
		int pcode = productService.selectPcodeByPname(pname);
		log.debug("pcode = {}", pcode);
		if(pcode == 0) {
			rediAttributes.addFlashAttribute("msg", "섭취 알림 설정 실패😥");
		} else {
		
			String memberId = authentication.getName();
			log.debug("memberID = {}", memberId);
			intakeCheck.setMemberId(memberId);
			intakeCheck.setPcode(pcode);
			log.debug("intakeCheck = {}", intakeCheck);
			
			int result = intakeService.addIntakeList(intakeCheck);
			rediAttributes.addFlashAttribute("msg", "섭취 알림 설정 성공🎉");
			
			if(result < 1)
				rediAttributes.addFlashAttribute("msg", "섭취 알림 설정 실패😥");
			
		}
		
		return "redirect:/intakeCheck/intakeCheck.do";
	}
	
	
	
	
	
	
}
