package com.kh.drugstore.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.cart.model.dao.CartDao;
import com.kh.drugstore.cart.model.dto.CartMemberProduct;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDao cartDao;
	
	@Override
	public List<CartMemberProduct> findCartListByMemberId(String memberId) {
		return cartDao.findCartListByMemberId(memberId);
	}
}
