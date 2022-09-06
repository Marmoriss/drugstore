package com.kh.drugstore.servey.model.dto;

import java.time.LocalDateTime;

import com.kh.drugstore.notice.model.dto.Notice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Servey {
	private int no;
	private String memberId;
	private Gender gender;
	private String height;
	private String weight;
	private String body;
	private String symptom;
}
