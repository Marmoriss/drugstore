package com.kh.drugstore.subscription.model.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Subscription {
	private int subNo;
	private String memberId;
	private LocalDate startDate;
	private LocalDate endDate;
	private LocalDate sendDate;
	private int totalPrice;
	private int productPrice;
	private int deliveryPrice;
	private int discount;
}
