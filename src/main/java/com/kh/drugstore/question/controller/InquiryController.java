package com.kh.drugstore.question.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.drugstore.question.model.service.InquiryService;

import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;

	static final Logger log = LoggerFactory.getLogger(InquiryController.class);
	
	@RequestMapping(value = "/inquiryList.do", method = RequestMethod.GET)
	public void getList(Model model){
		
	}
	
}

