package com.kh.drugstore.subscription.model.service;

import com.kh.drugstore.subscription.model.dto.Subscription;
import com.kh.drugstore.subscription.model.dto.SubscriptionProduct;

public interface SubscriptionService {

	int insertInfo(Subscription subscription);

	Subscription getSubscription(String memberId);

	int insertInfoToProduct(SubscriptionProduct subscription);

	

}
