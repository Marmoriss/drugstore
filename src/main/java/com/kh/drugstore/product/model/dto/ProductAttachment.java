package com.kh.drugstore.product.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
public class ProductAttachment {
/**
 * 상품 첨부파일 클래스 
 */
	private int attachNo; //첨부파일 번호
	private int pcode; //상품코드
	@NonNull 
	private String originalFilename; //업로드 이미지
	@NonNull
	private String renamedFilename; //서버 저장 이미지
	private LocalDateTime createdAt; //생성일
	
}
