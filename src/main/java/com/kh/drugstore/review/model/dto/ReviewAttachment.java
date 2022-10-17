package com.kh.drugstore.review.model.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ReviewAttachment {
	
	private int attachNo;
	private int reviewNo;
	private String originalFilename;
	private String renamedFilename;
	private LocalDate createdAt;
}
