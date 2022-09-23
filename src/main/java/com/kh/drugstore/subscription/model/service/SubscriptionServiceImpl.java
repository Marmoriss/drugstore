package com.kh.drugstore.subscription.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.subscription.model.dao.SubscriptionDao;
import com.kh.drugstore.subscription.model.dto.Subscription;
import com.kh.drugstore.subscription.model.dto.SubscriptionProduct;

@Service
public class SubscriptionServiceImpl implements SubscriptionService {

	@Autowired
	private SubscriptionDao subscriptionDao;
	
	@Override
	public int insertInfo(Subscription subscription) {
		return subscriptionDao.insertInfo(subscription);
	}
	
	@Override
	public SubscriptionProduct getSubscription(String memberId) {
		return subscriptionDao.getSubscription(memberId);
	}
	
	@Override
	public int insertInfoToProduct(SubscriptionProduct subscription) {
		return subscriptionDao.insertIntoProduct(subscription);
	}
	
	@Override
	public int selectAllSubNoById(String memberId) {
		return subscriptionDao.selectAllSubNoById(memberId);
	}
	
	@Override
	public int getPcodeBySubNo(int subNo) {
		return subscriptionDao.getPcodeBySubNo(subNo);
	}
	
	@Override
	public SubscriptionProduct subscriptionCheck(String memberId) {
		return subscriptionDao.subscriptionCheck(memberId);
	}
}
