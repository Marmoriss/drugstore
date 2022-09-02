package com.kh.inquiry.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Inquiry {

	private int no; // 번호
	private int comment_ref; // 대댓
	private String writer; // 작성자
	private Answered answered; // 답변상태 Y,N
	private LocalDateTime reg_date; // 작성일
	private String content; // 내용
	private String title; // 제목
	private int comment_level; // 코멘트레벨
	private Category category; // 문의 종류
}





