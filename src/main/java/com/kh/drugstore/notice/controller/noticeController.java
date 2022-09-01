package com.kh.drugstore.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.drugstore.notice.model.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

//@Controller
@Slf4j
@RequestMapping("/notice")
public class noticeController {
	
	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/noticeList.do")
	public ModelAndView noticeList(ModelAndView mav) {
//		List<Notice> noticeList = noticeService.selectNoticeList();
		mav.setViewName("notice/noticeList");
		return mav;
	}
	
}
