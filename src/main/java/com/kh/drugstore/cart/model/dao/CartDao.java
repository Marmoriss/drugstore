package com.kh.drugstore.cart.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.drugstore.cart.model.dto.Cart;
import com.kh.drugstore.product.model.dto.Product;

@Mapper
public interface CartDao {

	//@Select("select * from cart where member_id = #{memberId}")
	List<Cart> findCartListByMemberId(String memberId);

	@Select("select * from product where pcode = #{pcode}")
	List<Product> findProductByPcode(String pcode);

	
	int deleteCart(int[] cartNo);

	int cartDelete(int[] cartNo);

	
	int updateCart(int amount, int pcode);

	List<Cart> findOrderListByCartNo(int[] checkbox);
	
	
//	List<Cart> findCartListByMemberId(String memberId);
//	
//	List<Product> findProductByCartList(List<Cart> cartList);



	
}
