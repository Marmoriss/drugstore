package com.kh.drugstore.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.drugstore.common.DrugstoreUtils;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.service.ProductService;
import com.kh.drugstore.review.model.dto.Review;
import com.kh.drugstore.review.model.dto.ReviewAttachment;
import com.kh.drugstore.review.model.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ServletContext application;
	
	@GetMapping("/reviewEnrollPage.do")
	public void reviewEnrollPage(@RequestParam int pcode, Authentication authentication, Model model) {
		
		String memberId = authentication.getName();
		
		log.debug("pcode = {}", pcode);
		log.debug("memberId = {}", memberId);
		
		Product product = productService.selectOneProductCollection(pcode);
		String renamedFilename = product.getAttachments().get(0).getRenamedFilename();
		
		log.debug("renamedFilename = {}", renamedFilename);
		
		model.addAttribute("product", product);
		model.addAttribute("renamedFilename", renamedFilename);
		model.addAttribute("memberId", memberId);
	}
	
	@PostMapping("/reviewEnroll.do")
	public String reviewEnroll(Review review,
								@RequestParam(name = "upFile") List<MultipartFile> upFileList,
								RedirectAttributes redirectAttr) 
										throws IllegalStateException, IOException {
		log.debug("review = {}", review);
		
		for(MultipartFile upFile : upFileList) {
			log.debug("upFile name = {}", upFile.getOriginalFilename());
			
			if(!upFile.isEmpty()) {
				// a. 서버 컴퓨터에 저장
				String saveDirectory = application.getRealPath("/resources/upload/review");
				String renamedFilename = DrugstoreUtils.getRenamedFilename(upFile.getOriginalFilename());
				File destFile = new File(saveDirectory, renamedFilename);
				upFile.transferTo(destFile);
				
				// b. DB저장을 위한 Attachment 객체 생성
				ReviewAttachment attach = new ReviewAttachment(saveDirectory, renamedFilename);
				review.add(attach);
			}
		}
		log.debug("review + attach = {}", review);
		
		// db 저장
		int result = reviewService.insertReview(review);
		redirectAttr.addFlashAttribute("msg", "리뷰를 성공적으로 등록했습니다.");
		return "redirect:/product/productDetail.do?pcode=" + review.getPcode();
	}
	
}
