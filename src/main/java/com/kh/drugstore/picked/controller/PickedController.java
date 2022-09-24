package com.kh.drugstore.picked.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.drugstore.picked.model.dto.PickedExtends;
import com.kh.drugstore.picked.model.service.PickedService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/wish")
public class PickedController {

	@Autowired
	PickedService pickedService;
	
	@GetMapping("/wishList.do")
	public void wishList(Authentication authentication, Model model) {
		String memberId = authentication.getName();
		log.debug("memberId = {}", memberId);
		
		List<PickedExtends> list = pickedService.selectPickedList(memberId);
		log.debug("pickedList = {}", list);
		
		model.addAttribute("list", list);
	}
	
	@PostMapping("/deletePickedList.do")
	public String deletePickedList(
						RedirectAttributes redirectAttr,
						Authentication authentication,
						@RequestParam int[] pcode) {
		
		log.debug("pcode = {}", pcode);
		String memberId = authentication.getName();
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("pcode", pcode);
		
		int result = pickedService.deletePickedList(map);
		redirectAttr.addFlashAttribute("msg", "성공적으로 삭제되었습니다.");
		
		return "redirect:/wish/wishList.do";
	}
	
	@PostMapping("/insertPickedList.do")
	public ResponseEntity<?> insertPickedList(
					RedirectAttributes redirectAttr,
					@RequestParam int pcode,
					Authentication authentication) {
		
		log.debug("pcode = {}", pcode);
		String memberId = authentication.getName();
		
		Map<String, Object> param = new HashMap<>();
		
		List<PickedExtends> list = pickedService.selectPickedList(memberId);
		for(PickedExtends product : list) {
			if(product.getPcode() == pcode) {
				param.put("msg", "이미 찜리스트에 추가하였습니다.");
				return ResponseEntity.ok(param);
			}
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("pcode", pcode);
		
		int result = pickedService.insertPickedList(map);
		
		param.put("msg", "찜 추가 완료!");
		
		
		return ResponseEntity.ok(param);
	}
	
	
	
	
	
	
}
