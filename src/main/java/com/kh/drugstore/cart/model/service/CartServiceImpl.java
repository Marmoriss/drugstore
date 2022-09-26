package com.kh.drugstore.cart.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.cart.model.dao.CartDao;
import com.kh.drugstore.cart.model.dto.Cart;
import com.kh.drugstore.cart.model.dto.CartOrder;
import com.kh.drugstore.product.model.dto.Product;

@Transactional(rollbackFor = Exception.class)
@Service
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDao cartDao;
	
	@Override
	public List<Cart> findCartListByMemberId(String memberId) {
		//cart 조회
		List<Cart> cartList = cartDao.findCartListByMemberId(memberId);
		
		return cartList;
	}
	@Override
	public List<Product> findProductByPcode(String pcode) {
		List<Product> productList = cartDao.findProductByPcode(pcode);
		
		return productList;
	}
	@Override
	public int deleteCart(int[] cartNo) {
		
		return cartDao.deleteCart(cartNo);
	}
	
	@Override
	public Object cartDelete(int[] cartNo) {
		return cartDao.cartDelete(cartNo);
	}
	
	@Override
	public int updateCart(Map<String, Object> param) {
		return cartDao.updateCart(param);
	}
	
	
	
//	@Override
//	public Map<String, List> findCartListByMemberId(String memberId) {
//		Map<String, List> cartMap = new HashMap<String, List>();
//		
//		List<Cart> cartList = cartDao.findCartListByMemberId(memberId);
//		if(cartList.size() == 0 ) {
//			return null;
//		}
//		
//		List<Product> productList = cartDao.findProductByCartList(cartList);
//		
//		cartMap.put("cartList", cartList);
//		cartMap.put("productList", productList);
//		
//		return cartMap;
	@Override
	public List<Cart> findOrderListByCartNo(int[] checkbox) {
		return cartDao.findOrderListByCartNo(checkbox);
	}
	@Override
	public int insertOrder(Map<String, Object> cartOrder) {
		int result = 0;
		result = cartDao.insertOrder(cartOrder);
		result = cartDao.insertProductOrder(cartOrder);
		result = cartDao.deleteOrdercart(cartOrder);
		return result;
	}
	
	
	@Override public int insertCart(Map<String, Object> map) {
	  return cartDao.insertCart(map); 
	}
	 
	
	@Override
	public List<Cart> getPcode(int[] checkCategoryByCartNo) {
		return cartDao.getPcode(checkCategoryByCartNo);
	}
	@Override
	public Integer findCart(Map<String, Object> param) {
		return cartDao.findCart(param);
	}
	@Override
	public int addCart(Map<String, Object> cartList) {
		return cartDao.addCart(cartList);
	}
	
}