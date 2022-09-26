package com.kh.drugstore.product.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;
import com.kh.drugstore.product.model.dto.ProductEntity;

public interface ProductService {

	List<Product> findAllProduct(Map<String, Integer> param);

	int getTotalContent();
	
	List<ProductAttachment> findAttachmentByProductCode(int pCode);

	//대분류 카테고리 리스트 갖고오기 
	List<Product> selectProductByBigCategoryId(int categoryId);
	
	//소분류 카테고리 리스트 갖고오기
	List<Product> selectProductBysmallCategoryId(int categoryId);

	//최신순
	List<Product> sortProductByRecent(int pcode);
	
	//낮은가격순
	List<Product> sortProductByPrice(int price);
	
	//높은 가격순
	List<Product> sortProductByPriceDesc(int price);
	
	Product selectOneProductCollection(int pCode);


	// 주희 코드 시작
	List<ProductEntity> findByValues(ProductEntity product);

	int selectPcodeByPname(String pname);
	
	List<String> autocompletePname(String term);
	
	List<Product> selectProductList();
	
	//주희 코드 끝
	
	// 설문 조사 상품 가져오기 
	List<Product> findServeyProduct(String body);


	// 구독할 수 있는 상품리스트
	List<Product> selectSubscriptionAllProduct();

	List<Product> checkCategory(int[] checkCategoryByCartNo);

	Product getProductBySubNo(int pcode);








	

	



}
