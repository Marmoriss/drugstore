package com.kh.drugstore.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.drugstore.common.DrugstoreUtils;
import com.kh.drugstore.member.model.dto.User;
import com.kh.drugstore.notice.model.dao.NoticeDao;
import com.kh.drugstore.notice.model.dto.Notice;
import com.kh.drugstore.notice.model.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	// 공지사항 전체조회
	@GetMapping("/noticeList.do")
	public void noticeList(
			@RequestParam(defaultValue = "1") int cPage, 
			Model model, 
			HttpServletRequest request) {
		
			Map<String, Integer> param = new HashMap<>();
			int limit = 5;
			param.put("cPage", cPage);
			param.put("limit", limit);
			List<Notice> list = noticeService.selectNoticeList(param);
			log.debug("list = {}", list);
		
			model.addAttribute("list", list);
		
			// 2. pagebar영역
			int totalContent =noticeService.getTotalContent();
			log.debug("totalContent = {}", totalContent);
			String url = request.getRequestURI(); 
			String pagebar = DrugstoreUtils.getPagebar(cPage, limit, totalContent, url);
			model.addAttribute("pagebar", pagebar);
	}

	@GetMapping("/noticeForm.do")
	public void noticeForm() {
		
	}
	
	// 등록
	@PostMapping("/noticeEnroll.do")
	public String noticeEnroll(Notice notice, RedirectAttributes redirectAttr) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String writer = ((UserDetails) principal).getUsername();
		notice.setWriter(writer);
		int result = noticeService.insertNotice(notice);
		redirectAttr.addFlashAttribute("msg", "게시글을 등록하였습니다.");
		log.debug("principal = {}", principal);
		return "redirect:/notice/noticeList.do";
	}
	
	// 상세조회
	@GetMapping("noticeDetail.do")
	public void noticeDetail(@RequestParam int no, Notice notice, Model model) {
		model.addAttribute("notice", noticeService.oneNotice(no));
		model.addAttribute("page", noticeService.movePage(no));
	}
	
	
	@GetMapping("noticeUpdate.do")
	public void noticeUpdate(@RequestParam int no, Model model) {
		Notice notice = noticeService.oneNotice(no);
		model.addAttribute("notice", notice);
	}
	
	// 수정
	@PostMapping("noticeUpdate.do")
	public String noticeUpdate(Notice notice, RedirectAttributes redirectAttr) {
		int result = noticeService.updateNotice(notice);
		redirectAttr.addFlashAttribute("msg", "게시글을 성공적으로 수정했습니다.");
		return "redirect:/notice/noticeDetail.do?no=" + notice.getNo();
	}

	// 삭제
	@GetMapping("noticeDelete.do")
	public String noticeDelete(@RequestParam int no) {
		int result = noticeService.deleteNotice(no);
		return "redirect:/notice/noticeList.do";
		
	}
	
}