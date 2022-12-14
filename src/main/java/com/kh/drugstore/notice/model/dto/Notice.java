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
	private String writer;
	private String title;
	private String content;
	private LocalDateTime regDate;
	private int next;
	private int last;
	private String nexttitle;
	private String lasttitle;
}