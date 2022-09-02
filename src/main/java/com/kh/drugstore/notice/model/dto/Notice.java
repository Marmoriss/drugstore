package com.kh.drugstore.notice.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Notice {
	private int no;
	private String title;
	private String content;
	private String writer;
	private LocalDateTime regDate;
	
}