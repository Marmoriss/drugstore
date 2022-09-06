package com.kh.drugstore.product.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.product.model.dao.ProductDao;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	@Override
	//페이징
	public List<Product> findAllProduct(Map<String, Integer> param) {
		int limit = param.get("limit");
		int offset = (param.get("cPage") - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return productDao.findAllProduct(rowBounds);
	}
	
	@Override
	//전체개수
	public int getTotalContent() {
		return productDao.getTotalContent();
	}
	
	//상품코드로 상품첨부파일 조회
	@Override
	public List<ProductAttachment> findAttachmentByProductCode(int pCode) {
	 	return productDao.findAttachmentByProductCode(pCode);
	}
	
	@Override
	public List<Product> selectProductByCategoryId(int categoryId) {
		return productDao.selectProductByCategoryId(categoryId);
	}
	
	@Override
	public List<Product> selectOneProduct(int pCode) {
		return productDao.selectOneProduct(pCode);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
