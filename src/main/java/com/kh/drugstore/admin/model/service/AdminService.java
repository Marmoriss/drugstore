package com.kh.drugstore.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.drugstore.member.model.dto.Member;
<<<<<<< HEAD
import com.kh.drugstore.member.model.dto.User;
=======
import com.kh.drugstore.product.model.dto.Category;
>>>>>>> branch 'master' of https://github.com/Marmoriss/drugstore.git
import com.kh.drugstore.product.model.dto.Product;

public interface AdminService {
// 주희코드 시작
	List<Product> selectProductList();
	
	List<Category> selectCategoryList(int categoryId);
// 주희코드 끝

// 태연코드 시작
	List<User> userList(Map<String, Integer> param);
	int getTotalContent();
// 태연코드 끝

}
