package com.kh.drugstore.question.model.dto;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

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
public class Question {

	private int no; // 번호
	private int commentRef; // 대댓
	private String writer; // 작성자
	private Answered answered; // 답변상태 Y,N
	private LocalDateTime regDate; // 작성일
	private String content; // 내용
	private String title; // 제목
	private int commentLevel; // 코멘트레벨
	private QuestionCategory questionCategory; // 문의 종류
	private int secret;
}





