package com.kh.drugstore.cart.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.drugstore.cart.model.dto.Cart;
import com.kh.drugstore.cart.model.dto.CartOrder;
import com.kh.drugstore.product.model.dto.Product;

@Mapper
public interface CartDao {

	//@Select("select * from cart where member_id = #{memberId}")
	List<Cart> findCartListByMemberId(String memberId);

	@Select("select * from product where pcode = #{pcode}")
	List<Product> findProductByPcode(String pcode);

	
	int deleteCart(int[] cartNo);

	int cartDelete(int[] cartNo);

	
	int updateCart(Map<String, Object> param);

	List<Cart> findOrderListByCartNo(int[] checkbox);
/**
	@Insert("insert into orders value(#{merchantUid}, #{memberId}, #{impUid}"
			+ ", #{receiptId}, #{method}, #{name}, null, #{paidAt}"
			+ ", null, null, null, null, #{totalPrice}"
			+ ", 3000, null, null, null, null, null"
			+ ", null, null, null, null, null, null"
			+ ", null, null, null, #{recipient}, #{postCode}, #{address}"
			+ ", #{detailAddress}, #{memo}, default")
			**/
	int insertOrder(CartOrder cartOrder);
	
	int insertProductOrder(CartOrder cartOrder);
	
	int deleteOrdercart(CartOrder cartOrder);
	
	
//	List<Cart> findCartListByMemberId(String memberId);
//	
//	List<Product> findProductByCartList(List<Cart> cartList);



	
}
