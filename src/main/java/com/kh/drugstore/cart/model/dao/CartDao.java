package com.kh.drugstore.cart.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.drugstore.cart.model.dto.CartMemberProduct;

@Mapper
public interface CartDao {

	@Select("select c.*, p.*, m.* from cart c, product p, member m where c.pcode = p.pcode and c.member_id = #{memberId} and m.member_id = #{memberId}")
	List<CartMemberProduct> findCartListByMemberId(String memberId);

	
}
