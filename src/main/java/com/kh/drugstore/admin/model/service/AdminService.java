package com.kh.drugstore.admin.model.service;

import java.util.List;

import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.product.model.dto.Product;

public interface AdminService {
// 주희코드 시작
	List<Product> selectProductList();
// 주희코드 끝

// 태연코드 시작
	List<Member> memberList();
// 태연코드 끝
}
