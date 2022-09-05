package com.kh.drugstore.cart.model.dto;

import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.product.model.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartMemberProduct {
	private Member member = new Member();
	private Cart cart = new Cart();
	private Product product = new Product();
	
	
}
