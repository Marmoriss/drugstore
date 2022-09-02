package com.kh.drugstore.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.drugstore.notice.model.dto.Notice;
import com.kh.drugstore.notice.model.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/noticeList.do")
	public void noticeList(Model model) {
		List<Notice> list = noticeService.selectNoticeList();
		log.debug("list = {}", list);
		model.addAttribute("list", list);
	}

	@PostMapping("/noticeEnroll.do")
	public String noticeEnroll(Notice notice, RedirectAttributes redirectAttr) {
		int result = noticeService.insertNotice(notice);
		redirectAttr.addFlashAttribute("msg", "게시글을 등록하였습니다.");
		return "redirect:/notice/noticeList.do";
	}
	

	@GetMapping("noticeDetail.do")
	public void noticeDetail(@RequestParam int no, Model model) {
		Notice notice = noticeService.oneNotice(no);
		log.debug("notice = {}", notice);
		model.addAttribute("notice", notice);
		
	}
	

	@GetMapping("noticeUpdate.do")
	public void noticeUpdate(@RequestParam int no, Model model) {
		Notice notice = noticeService.oneNotice(no);
		model.addAttribute("notice", notice);
	}
	
	@PostMapping("noticeUpdate.do")
	public String noticeUpdate(Notice notice, RedirectAttributes redirectAttr) {
		int result = noticeService.updateNotice(notice);
		redirectAttr.addFlashAttribute("msg", "게시글을 성공적으로 수정했습니다.");
		return "redirect:/notice/noticeDetail.do?no=" + notice.getNo();
	}
	
	@PostMapping("noticeDelete.do")
	public String noticeDelete(@RequestParam int no) {
		int result = noticeService.deleteNotice(no);
		return "redirect:/notice/noticeList.do";
		
	}
	
	
}