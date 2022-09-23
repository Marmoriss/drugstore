package com.kh.drugstore.orders.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.orders.model.dao.OrdersDao;

@Service
public class OrderServiceImpl implements OrdersService {

	@Autowired
	OrdersDao ordersDao;
}
