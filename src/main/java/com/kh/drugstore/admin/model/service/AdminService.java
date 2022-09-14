package com.kh.drugstore.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.drugstore.member.model.dto.User;
import com.kh.drugstore.product.model.dto.Category;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;

public interface AdminService {
// 주희코드 시작
	List<Product> selectProductList();
	
	List<Category> selectCategoryList(int categoryId);
	
	List<String> autocompletePname(String pname);
	
	List<String> autocompleteManu(String manu);

	int insertProduct(Product product);
	
	Category getCategoryParentLevel(int categoryId);
	
	ProductAttachment selectOneAttachment(int attachNo);
	
	int deleteAttachment(int attachNo);
	
	int updateProduct(Product product);
	
	
// 주희코드 끝

// 태연코드 시작
	List<User> userList(Map<String, Integer> param, String searchType, String keyword);
	int getTotalContent();
	int getMinus1Mem();
	int getMinus2Mem();	
	int getMinus3Mem();
	int getMinus4Mem();
	int getMinus5Mem();
	int getMinus6Mem();
	int getMinus7Mem();
	int getMemToday();
	
	


	
	
	
	
	
	
	
// 태연코드 끝

}
