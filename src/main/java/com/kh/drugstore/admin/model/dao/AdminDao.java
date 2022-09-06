package com.kh.drugstore.admin.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.product.model.dto.Product;

@Mapper
public interface AdminDao {

// 주희코드 시작
	@Select("select * from product order by pcode")
	List<Product> selectProductList();
// 주희코드 끝
	
// 태연코드 시작
	@Select("select m.member_id, name, phone, created_at, gender, body from member m join servey s on (m.member_id = s.member_id)")
	List<Member> memberList();
// 태연코드 끝
}
