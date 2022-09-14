package com.kh.drugstore.intakeCheck.model.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class IntakeCheck {

	private int no;
	private String memberId;
	private int pcode;
	private String intakeDay;
	private int alarmTime;
	private IntakeYn intakeYn;
	private LocalDate createdAt;
	private LocalDate deletedAt;
}
