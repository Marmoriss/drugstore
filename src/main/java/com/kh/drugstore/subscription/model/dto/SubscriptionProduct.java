package com.kh.drugstore.subscription.model.dto;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;

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
