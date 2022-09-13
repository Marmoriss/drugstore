package com.kh.drugstore.cart.model.service;

import java.util.List;
import java.util.Map;

import com.kh.drugstore.cart.model.dto.Cart;
import com.kh.drugstore.product.model.dto.Product;

public interface CartService {

	List<Cart> findCartListByMemberId(String memberId);

	List<Product> findProductByPcode(String pcode);

	int deleteCart(int[] delCartNo);

	Object cartDelete(int[] cartNo);

	int updateCart(int amount, int pcode);

	List<Cart> findOrderListByCartNo(int[] checkbox);
	
//	Map<String, List> findCartListByMemberId(String memberId);
}
