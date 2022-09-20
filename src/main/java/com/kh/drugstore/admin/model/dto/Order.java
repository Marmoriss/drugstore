package com.kh.drugstore.admin.model.dto;

import com.kh.drugstore.member.model.dto.MemberEntity;
import com.kh.drugstore.orders.model.dto.Orders;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	private MemberEntity member;
	private Orders orders;
}
