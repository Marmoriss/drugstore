package com.kh.drugstore.subscription.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.subscription.model.dao.SubscriptionDao;
import com.kh.drugstore.subscription.model.dto.Subscription;

@Service
public class SubscriptionServiceImpl implements SubscriptionService {

	@Autowired
	private SubscriptionDao subscriptionDao;
	
	
}
