package com.kh.drugstore.qna.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Qna {

	private int qnaId; //번호
	private int commentRef; //댓글 null, 대댓글인 경우 참조댓글 no
	private int pCode; //상품코드
	private String writer; //작성자
	private String answered; //답변상태
	private LocalDateTime regDate; //작성일
	private String content; //내용
	private int secretPassword; //비밀번호
	private int commentLevel; //코멘트레벨 댓글 1, 대댓글 2 
	
	
}
