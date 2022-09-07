package com.kh.drugstore.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.drugstore.qna.model.dto.Qna;
import com.kh.drugstore.qna.model.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	QnaService qnaService;
	
	//전체조회, 비밀글상태(비밀번호입력 숫자4자리), 대댓글, qna 작성(등록)
	//qna 전체조회
	@GetMapping("/qnaList.do")
	public void qnaList(Model model) {
		List<Qna> list = qnaService.selectQnaList();
		model.addAttribute("list", list);
	}
}
