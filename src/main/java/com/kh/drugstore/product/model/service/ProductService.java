package com.kh.drugstore.product.model.service;

import java.util.List;
import java.util.Map;

import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;

public interface ProductService {

	List<Product> findAllProduct(Map<String, Integer> param);

	int getTotalContent();

	List<ProductAttachment> findAttachmentByProductCode(int pCode);

	List<Product> selectProductByCategoryId(int categoryId);

	List<Product> selectOneProduct(int pCode);

	List<Product> findServeyProduct(String symptom);

	
}
