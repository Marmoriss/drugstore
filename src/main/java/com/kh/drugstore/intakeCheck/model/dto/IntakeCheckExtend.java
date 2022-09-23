package com.kh.drugstore.intakeCheck.model.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IntakeCheckExtend extends IntakeCheck{

	private String pname;
	

	public IntakeCheckExtend(int no, String memberId, int pcode, String intakeDay, int alarmTime, int amount,
			IntakeYn intakeYn, LocalDate createdAt, LocalDate deletedAt) {
		super(no, memberId, pcode, intakeDay, alarmTime, amount, intakeYn, createdAt, deletedAt);
	}


	
}
