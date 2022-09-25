package com.kh.drugstore.faq.model.dto;

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
public class Faq {

	private int no; // 번호
	private String question; // 제목 
	private String answer; // 답변
	
}
