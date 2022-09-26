package com.kh.drugstore.cart.model.service;

import java.util.List;
import java.util.Map;

import com.kh.drugstore.cart.model.dto.Cart;
import com.kh.drugstore.cart.model.dto.CartOrder;
import com.kh.drugstore.product.model.dto.Product;

public interface CartService {

	List<Cart> findCartListByMemberId(String memberId);

	List<Product> findProductByPcode(String pcode);

	int deleteCart(int[] delCartNo);

	Object cartDelete(int[] cartNo);

	int updateCart(Map<String, Object> param);

	List<Cart> findOrderListByCartNo(int[] checkbox);

	int insertOrder(Map<String, Object> cartOrder);
	
	int insertCart(Map<String, Object> map);

	List<Cart> getPcode(int[] checkCategoryByCartNo);

	Integer findCart(Map<String, Object> param);

	int addCart(Map<String, Object> cartList);
	
//	Map<String, List> findCartListByMemberId(String memberId);
}
