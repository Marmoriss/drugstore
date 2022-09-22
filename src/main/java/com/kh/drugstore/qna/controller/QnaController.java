package com.kh.drugstore.qna.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.drugstore.common.DrugstoreUtils;
import com.kh.drugstore.member.model.service.MemberService;
import com.kh.drugstore.qna.model.dto.Qna;
import com.kh.drugstore.qna.model.service.QnaService;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Slf4j
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	QnaService qnaService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	MemberService memberService;
	
	//전체조회, 비밀글상태(비밀번호입력 숫자4자리), 대댓글, qna 작성(등록)
	//qna 전체조회
	@GetMapping("/qnaList.do")
	public void qnaList(@RequestParam(defaultValue = "1") int cPage, Model model, HttpServletRequest request) {
		Map<String, Integer> param = new HashMap<>();
		int limit = 10;
		param.put("cPage", cPage);
		param.put("limit", limit);
		List<Qna> list = qnaService.selectQnaList(param);
//		log.debug("list = {}", list);
		model.addAttribute("list", list);
		
		int totalContent = qnaService.getTotalContent();
//		log.debug("totalContent = {}", totalContent);
		String url = request.getRequestURI(); 
		String pagebar = DrugstoreUtils.getPagebar(cPage, limit, totalContent, url);
		model.addAttribute("pagebar", pagebar);
	}
	
	//글 작성폼 화면
	@GetMapping("/qnaForm.do")
	public void qnaForm() {
		
	}
	
	//등록
	@PostMapping("/qnaEnroll.do")
	public String qnaEnroll(Qna qna, RedirectAttributes redirectAttr) {
//		log.debug("qna = {}", qna);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String writer = ((UserDetails) principal).getUsername();
		int result = qnaService.insertQna(qna);
		redirectAttr.addFlashAttribute("msg", "게시글을 성공적으로 저장했습니다.");
		return "redirect:/qna/qnaList.do";
	}
	
	//상세조회
	@GetMapping("/qnaDetail.do")
	public void qnaDetail(@RequestParam int pcode, Model model) {
		Qna qna = qnaService.oneQna(pcode);
//		log.debug("qna = {}", qna);
		model.addAttribute("qna", qna);
	}
	
	//답글쓰기화면
	@GetMapping("/qnaReplay.do")
	public String replay(int pcode, Model model) {
		//원글 정보 불러오기
		model.addAttribute("qna", qnaService.oneQna(pcode));
		
		return "redirect:/qna/qnaReplay.do";
	}
	
	//답글저장처리 요청
	@PostMapping("/qnaRepEnroll.do") 
		public String repEnroll(Qna qna, HttpSession session) {
		int result = qnaService.insertQnaComment(qna);
		return "redirect:/qna/qnaList.do";
	}
	
	
	// 주희 코드 시작
	
	// update페이지 연결
	@GetMapping("/qnaUpdateForm.do")
	public void qnaUpdateForm(@RequestParam int qnaId, Model model) {
		log.debug("qnaId = {}", qnaId);
		Qna qna = qnaService.selectOneQna(qnaId);
		
		log.debug("qna = {}", qna);
		model.addAttribute("qna", qna);
	}
	
	@PostMapping("/qnaUpdate.do")
	public String qnaUpdate(RedirectAttributes redirectAttr, Qna qna) {
		log.debug("=================");
		log.debug("qna = {}", qna);
		
		int result = qnaService.updateQna(qna);
		redirectAttr.addFlashAttribute("msg", "성공적으로 수정되었습니다.");
		return "redirect:/product/productDetail.do?pcode=" + qna.getPcode();
	}
	
	@PostMapping("/deleteQna.do")
	public String qnaDelete(
					RedirectAttributes redirectAttr,
					@RequestParam int qnaId,
					@RequestParam int pcode) {
		log.debug("qnaId = {}", qnaId);
		log.debug("pcode = {}", pcode);
		
		int result = qnaService.deleteQna(qnaId);
		redirectAttr.addFlashAttribute("msg", "성공적으로 삭제되었습니다.");
		
		return "redirect:/product/productDetail.do?pcode=" + pcode;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

