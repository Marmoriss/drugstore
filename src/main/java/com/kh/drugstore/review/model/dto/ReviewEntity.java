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
public class ReviewEntity {

	private int no;
	private String memberId;
	private int pcode;
	private String content;
	private int star;
	private LocalDate regDate;
}
