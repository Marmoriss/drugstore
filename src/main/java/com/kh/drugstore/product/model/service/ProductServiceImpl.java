package com.kh.drugstore.product.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.product.model.dao.ProductDao;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;
import com.kh.drugstore.product.model.dto.ProductEntity;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;
	
	//페이징
	@Override
	public List<Product> findAllProduct(Map<String, Integer> param) {
		int limit = param.get("limit");
		int offset = (param.get("cPage") - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return productDao.findAllProduct(rowBounds);
	}
	
	@Override
	public int getTotalContent() {
		return productDao.getTotalContent();
	}
	
//	@Override
//	public int getBigTotalContent() {
//		return productDao.getBigTotalContent();
//	}
//	
//	@Override
//	public int getSmallTotalContent() {
//		return productDao.getSmallTotalContent();
//	}
	
	//상품코드로 상품첨부파일 조회
	@Override
	public List<ProductAttachment> findAttachmentByProductCode(int pCode) {
	 	return productDao.findAttachmentByProductCode(pCode);
	}
	
	@Override
	public List<Product> selectProductByBigCategoryId(int categoryId) {
		return productDao.selectProductBybigCategoryId(categoryId);
	}
	
	@Override
	public List<Product> selectProductBysmallCategoryId(int categoryId) {
		return productDao.selectProductBysmallCategoryId(categoryId);
	}
	
	@Override
	public List<Product> sortProductByRecent(int pcode) {
		return productDao.sortProductByRecent(pcode);
	}
	
	@Override
	public List<Product> sortProductByPrice(int price) {
		return productDao.sortProductByPrice(price);
	}
	
	@Override
	public List<Product> sortProductByPriceDesc(int price) {
		return productDao.sortProductByPriceDesc(price);
	}
	
	@Override
	public Product selectOneProductCollection(int pCode) {
		return productDao.selectOneProductCollection(pCode);
	}
	
	// 주희 코드 시작
	
	@Override
	public List<ProductEntity> findByValues(ProductEntity product) {
		return productDao.findByValues(product);
	}
	
	@Override
	public int selectPcodeByPname(String pname) {
		return productDao.selectPcodeByPname(pname);
	}
	
	@Override
	public List<String> autocompletePname(String term) {
		return productDao.autocompletePname(term);
	}
	
	@Override
	public List<Product> selectProductList() {
		return productDao.selectProductList();
	}
	
	
	// 주희 코드 끝
	
	
	@Override
	public List<Product> findServeyProduct(String body) {
		return productDao.findServeyProduct(body);
	}
	
	@Override
	public List<Product> selectSubscriptionAllProduct() {
		return productDao.selectSubscriptionAllProduct();
	}
	
	@Override
	public List<Product> checkCategory(int[] checkCategoryByCartNo) {
		return productDao.checkCategory(checkCategoryByCartNo);
	}
	
	
	@Override
	public Product getProductBySubNo(int pcode) {
		return productDao.getProductBySubNo(pcode);
	}


	
	
	
	
	
	
	
	
	
	
	
	
}
