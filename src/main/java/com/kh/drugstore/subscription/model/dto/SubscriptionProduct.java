package com.kh.drugstore.subscription.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString(callSuper = true)
public class SubscriptionProduct extends Subscription {
	private int subNo;
	private int pcode;
	private int amount;
}
