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

	List<Product> selectProductByCategoryId(int categoryId);

	Product selectOneProductCollection(int pCode);


	// 주희 코드 시작
	List<ProductEntity> findByValues(Map<String, Object> param);

	int selectPcodeByPname(String pname);
	
	List<String> autocompletePname(String term);
	
	
	//주희 코드 끝
	
	// 설문 조사 상품 가져오기 
	List<Product> findServeyProduct(String body);


}
