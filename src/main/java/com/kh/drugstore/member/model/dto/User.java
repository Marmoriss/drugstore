package com.kh.drugstore.member.model.dto;

import com.kh.drugstore.servey.model.dto.Servey;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private MemberEntity member;
	private Servey servey;
}
