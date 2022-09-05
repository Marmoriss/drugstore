package com.kh.drugstore.cart.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	private int CartNo;
	private String memberId;
	private String pcode;
	private int amount;
}
