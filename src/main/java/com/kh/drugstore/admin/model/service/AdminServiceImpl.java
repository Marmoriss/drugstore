package com.kh.drugstore.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.admin.model.dao.AdminDao;
import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.member.model.dto.User;
import com.kh.drugstore.product.model.dto.Category;
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
	
	@Override
	public List<Category> selectCategoryList(int categoryId) {
		return adminDao.selectCategoryList(categoryId);
	}
	
	
// 주희코드 끝
	
//	태연코드 시작
	@Override
	public List<User> userList(Map<String, Integer> param,String searchType, String keyword) {
		int limit = param.get("limit");
		int offset = (param.get("cPage") - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return adminDao.userList(rowBounds,searchType,keyword);
	}
	
	@Override
	public int getTotalContent() {
		return adminDao.getTotalContent();
	}
	
	
// 태연코드 끝
}
	
	
	
	
	
