package com.kh.drugstore.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.drugstore.data.model.service.DataService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/data")
public class DataController {

	@Autowired
	DataService dataService;
	
	@GetMapping("/data.do")
	public ResponseEntity<?> getXmlOpenApi() {
		return ResponseEntity.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
				.body(dataService.getXmlOpenApi());
		
	}
	
	
}
