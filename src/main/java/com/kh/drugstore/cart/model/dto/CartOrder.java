package com.kh.drugstore.cart.model.dto;

import com.kh.drugstore.orders.model.dto.Orders;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class CartOrder extends CartEntity{
	private Orders orders;
}
