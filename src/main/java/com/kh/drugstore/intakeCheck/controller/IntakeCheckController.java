package com.kh.drugstore.intakeCheck.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
import com.kh.drugstore.intakeCheck.model.dto.IntakeCheckExtend;
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
		List<IntakeCheckExtend> intakeList = intakeService.findByMemberId(memberId);
		log.debug("intakeList = {}", intakeList);
		
		model.addAttribute("intakeList", intakeList);
		
	}
	
	@PostMapping("/addIntakeList.do")
	public String addIntakeList(
				@RequestParam String pname,
				IntakeCheck intakeCheck,
				Authentication authentication,
				RedirectAttributes redirectAttributes){
		
		log.debug("pname = {}", pname);
		
		int pcode = productService.selectPcodeByPname(pname);
		log.debug("pcode = {}", pcode);
		if(pcode == 0) {
			redirectAttributes.addFlashAttribute("msg", "섭취 알림 설정 실패😥");
		} else {
		
			String memberId = authentication.getName();
			log.debug("memberId = {}", memberId);
			intakeCheck.setMemberId(memberId);
			intakeCheck.setPcode(pcode);
			log.debug("intakeCheck = {}", intakeCheck);
			
			int result = intakeService.addIntakeList(intakeCheck);
			redirectAttributes.addFlashAttribute("msg", "섭취 알림 설정 성공🎉");
			
			if(result < 1)
				redirectAttributes.addFlashAttribute("msg", "섭취 알림 설정 실패😥");
			
		}
		
		return "redirect:/intakeCheck/intakeCheck.do";
	}
	
	@PostMapping("/deleteIntakeList.do")
	public String deleteIntakeList(
					Authentication authentication,
					@RequestParam int pcode,
					RedirectAttributes redirectAttributes) {
		String memberId = authentication.getName();
		log.debug("pcode = {}", pcode);
		log.debug("memberId = {}", memberId);
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("pcode", pcode);
		
		int result = intakeService.deleteIntakeList(param);
		redirectAttributes.addFlashAttribute("msg", "섭취 리스트 삭제 완료!");
		
		return "redirect:/intakeCheck/intakeCheck.do";
	}
	
	@PostMapping("/updateIntakeYn.do")
	public ResponseEntity<?> updateIntakeYn(
						@RequestParam int pcode,
						@RequestParam String intakeYn,
						Authentication authentication){
		
		String memberId = authentication.getName();
		log.debug("memberId = {}", memberId);
		log.debug("pcode = {}", pcode);
		log.debug("intakeYn = {}", intakeYn);
		
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("pcode", pcode);
		param.put("intakeYn", intakeYn);
		
		int result = intakeService.updateIntakeYn(param);
		
		Map<String, Object> map = new HashMap<>();
		map.put("result", "success");
		if("Y".equals(intakeYn))
			map.put("resultMessage", "섭취 체크 완료!🎉");
		else
			map.put("resultMessage", "내일은 꼭 드실꺼죠?😉");
		return ResponseEntity.ok().body(map);
	}
	
	
}
