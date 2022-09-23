package com.kh.drugstore.faq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.drugstore.faq.model.dto.Faq;
import com.kh.drugstore.faq.model.service.FaqService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class FaqController {
	
	
	@Autowired
	private FaqService faqService;
	
	// 고객센터 -> FAQ 조회
	@GetMapping("/faq/faqList.do")
	public void faqList(Model model) {
		List<Faq> list = faqService.selectFaqList();
		log.info("list = {}", list);
		model.addAttribute("list", list);
	}
	
	//관리자 페이지에서 버튼3개 불러오기
	@RequestMapping(path = "/admin/faq/faqForm.do", method = RequestMethod.GET)
	public void faqForm() {
		
	}
	
	//관리자 페이지 -> 버튼 누르면 -> insertForm
	@RequestMapping(path = "/admin/faq/faqInsertForm.do", method = RequestMethod.GET)
	public void faqInsertForm(Faq faq, RedirectAttributes redirectAttr) {
		
	}
	
	// FAQ Insert
	@PostMapping("/admin/faq/faqInsert.do")
	public String faqInsert(Faq faq, RedirectAttributes redirectAttr) {
		int result = faqService.insertFaq(faq);
		redirectAttr.addFlashAttribute("msg", "FAQ를 등록하였습니다.");
		return "redirect:/faq/faqList";
	}
	
	// 관리자 페이지 -> 버튼 누르면 -> deleteForm
	@RequestMapping(path = "/admin/faq/faqDeleteForm.do", method = RequestMethod.GET)
	public void faqDeleteForm(Faq faq, RedirectAttributes redirectAttr) {
		
	}
	
	// FAQ Delete
	@PostMapping("/admin/faq/faqDelete.do")
	public String faqDelete(@RequestParam int no) {
		int result = faqService.deleteFaq(no);
		return "redirect:/faq/faqList.do";
			
		}

	// 관리자페이지 -> FAQ 조회
	@GetMapping("/admin/faq/faqListAdmin.do")
	public void faqListAdmin(Model model) {
		List<Faq> list = faqService.selectFaqList();
		log.info("list = {}", list);
		model.addAttribute("list", list);
		}
	
	
}

