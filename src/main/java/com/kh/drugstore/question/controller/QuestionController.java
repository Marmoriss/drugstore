package com.kh.drugstore.question.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.question.model.dto.Question;
import com.kh.drugstore.question.model.service.QuestionService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/question")
public class QuestionController {

	@Autowired
	QuestionService questionService;
	
	// 1:1문의 List 
	@GetMapping(path = "/questionList.do")
	public String questionList(Model model) {
		List<Question> list = questionService.selectQuestionList();
		log.info("list = " + list);
		model.addAttribute("list", list);
		return "question/questionList";
	}
	
	// 1:1문의 등록Form
	@GetMapping(path = "/questionForm.do")
	public void questionForm(Authentication authentication, Model model) {
		
		Member member = (Member) authentication.getPrincipal();
		log.debug("member = {}", member);
		String memberId = member.getMemberId();
		log.debug("memberId = {}", memberId);
		model.addAttribute("memberId", memberId);
	}
	
	// 1:1문의 등록하기
	@PostMapping("/questionInsert.do")
	public String questionInsert(Question question, RedirectAttributes redirectAttr) {
		int result = questionService.insertQuestion(question);
		redirectAttr.addFlashAttribute("msg", "문의글을 등록하였습니다.");
		return "question/questionList";
	}
	
	// 1:1문의 게시글보기 -> 비밀번호 입력 후 본인 확인 거치기 -> 주말에 구현해야하남?
	@GetMapping("/questionUpdate.do")
	public void questionUpdate(@RequestParam int no, Model model) {
		Question question = questionService.oneQuestion(no);
		model.addAttribute("question", question);
	}
	
	
	// 1:1문의 수정하기
	@PostMapping("/questionUpdate.do")
	public String questionUpdate(Question question, RedirectAttributes redirectAttr) {
		int result = questionService.updateQuestion(question);
		redirectAttr.addFlashAttribute("msg", "문의글을 수정하였습니다.");
		return "redirect:/question/questionList.do";
		
	}
	
	// 1:1문의 삭제하기
	@PostMapping("/questionDelete.do")
	public String questionDelete(@RequestParam int no) {
		int result = questionService.deleteQuestion(no);
		return "redirect:/question/questionList.do";
	}
	

	
}
