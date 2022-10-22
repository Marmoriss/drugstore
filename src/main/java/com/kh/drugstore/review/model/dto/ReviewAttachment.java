package com.kh.drugstore.review.model.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@ToString
public class ReviewAttachment {
	
	private int attachNo;
	private int reviewNo;
	@NonNull
	private String originalFilename;
	@NonNull
	private String renamedFilename;
	private LocalDate createdAt;
}
