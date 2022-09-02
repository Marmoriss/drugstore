package com.kh.drugstore.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.admin.model.dao.AdminDao;
import com.kh.drugstore.product.model.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;
	
	@Override
	public List<Product> findProduct() {
		return adminDao.findProduct();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
