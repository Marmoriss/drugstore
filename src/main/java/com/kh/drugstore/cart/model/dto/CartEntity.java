package com.kh.drugstore.cart.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartEntity {
	protected int cartNo;
	protected String memberId;
	protected int pcode;
	protected int amount;
}
