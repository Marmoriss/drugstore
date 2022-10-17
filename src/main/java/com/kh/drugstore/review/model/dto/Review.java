package com.kh.drugstore.review.model.dto;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class Review extends ReviewEntity{

	private List<ReviewAttachment> attachments = new ArrayList<>();

	public Review(int no, String memberId, int pcode, String content, int star, LocalDate regDate) {
		super(no, memberId, pcode, content, star, regDate);
	}
	
	public void add(ReviewAttachment attach) {
		this.attachments.add(attach);
	}

}
