package com.kh.drugstore.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.product.model.dao.ProductDao;
import com.kh.drugstore.product.model.dto.ProductAttachment;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Service
@Slf4j
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao productDao;
	
	//상품코드로 상품첨부파일 조회
	public List<ProductAttachment> findAttachmentByProductCode(int pcode) {
	 	return ProductDao.findAttachmentByProductCode(pcode);
	}
}
