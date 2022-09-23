package com.kh.drugstore.cart.model.dto;

import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.product.model.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class Cart extends CartEntity {
	private Product product;
	private Member member;
}
