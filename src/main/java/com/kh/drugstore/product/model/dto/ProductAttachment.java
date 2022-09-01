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
	private int no;
	private int pcode;
	@NonNull
	private String originalFilename;
	@NonNull
	private String renamedFilename;
	@NonNull
	private LocalDateTime createdAt;
	
}
