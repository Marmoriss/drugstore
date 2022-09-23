package com.kh.drugstore.admin.model.dto;

import com.kh.drugstore.orders.model.dto.Orders;
import com.kh.drugstore.orders.model.dto.ProductOrders;
import com.kh.drugstore.product.model.dto.ProductEntity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
//	private MemberEntity member;
	private ProductEntity product;
	private Orders orders;
	private ProductOrders porders;
}
