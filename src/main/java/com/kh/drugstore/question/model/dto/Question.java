package com.kh.drugstore.question.model.dto;

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
public class Question {

	private int no; // 
	private int comment_ref;
	private String writer;
	private Answered answered;
	private LocalDateTime reg_date;
	private String content;
	private String title;
	private int comment_level;
	private Category category;
	
}
