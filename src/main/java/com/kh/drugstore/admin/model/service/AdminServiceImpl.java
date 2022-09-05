package com.kh.drugstore.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.admin.model.dao.AdminDao;
import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.product.model.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;
	
// 주희코드 시작	
	@Override
	public List<Product> selectProductList() {
		return adminDao.selectProductList();
	}
// 주희코드 끝
	
//	태연코드 시작
	@Override
	public List<Member> memberList() {
		return adminDao.memberList();
	}
// 태연코드 끝
	
	
	
	
	
	
	
	
	
	
	
}
