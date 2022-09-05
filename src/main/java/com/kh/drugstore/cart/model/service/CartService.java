package com.kh.drugstore.cart.model.service;

import java.util.List;

import com.kh.drugstore.cart.model.dto.CartMemberProduct;

public interface CartService {

	List<CartMemberProduct> findCartListByMemberId(String memberId);

}
