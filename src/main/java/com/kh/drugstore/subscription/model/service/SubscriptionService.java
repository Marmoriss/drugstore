package com.kh.drugstore.subscription.model.service;

import java.util.List;

import com.kh.drugstore.subscription.model.dto.Subscription;
import com.kh.drugstore.subscription.model.dto.SubscriptionProduct;

public interface SubscriptionService {

	int insertInfo(Subscription subscription);

	SubscriptionProduct getSubscription(String memberId);

	int insertInfoToProduct(SubscriptionProduct subscription);

	int selectAllSubNoById(String memberId);

	int getPcodeBySubNo(int subNo);

	

}
