package com.kh.drugstore.subscription.model.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Subscription {
	private int subNo;
	private String memberId;
	private LocalDateTime startDate;
	private LocalDateTime endDate;
	private LocalDateTime sendDate;
	private String pay;
	private int totalPrice;
	private int productPrice;
	private int deliveryPrice;
	private int discount;
}
