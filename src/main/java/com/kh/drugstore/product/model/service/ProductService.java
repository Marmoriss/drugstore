package com.kh.drugstore.product.model.service;

import java.util.List;
import java.util.Map;

import com.kh.drugstore.product.model.dto.Product;

public interface ProductService {

	List<Product> findAllProduct(Map<String, Integer> param);

	int getTotalContent();

}
