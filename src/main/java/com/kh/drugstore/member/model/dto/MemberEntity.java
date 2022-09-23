package com.kh.drugstore.member.model.dto;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberEntity {
	// db 테이블과 실제로 상응하는 애들
	@NonNull
	protected String memberId;
	@NonNull
	protected String name;
	@NonNull
	protected String password;
	@NonNull
	protected String phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	protected LocalDate createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	protected LocalDate updatedAt;
	protected boolean enabled;
	protected String recipient; // 수령인
	protected String postCode;
	protected String address;
	protected String detailAddress;
	protected String memo;
}
