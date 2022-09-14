package com.kh.drugstore.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.admin.model.dao.AdminDao;
import com.kh.drugstore.member.model.dto.User;
import com.kh.drugstore.product.model.dto.Category;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;
	
	// 주희코드 시작	
	@Override
	public List<Product> selectProductList() {
		return adminDao.selectProductList();
	}
	
	@Override
	public List<Category> selectCategoryList(int categoryId) {
		return adminDao.selectCategoryList(categoryId);
	}
	
	@Override
	public List<String> autocompletePname(String pname) {
		return adminDao.autocompletePname(pname);
	}
	
	@Override
	public List<String> autocompleteManu(String manu) {
		return adminDao.autocompleteManu(manu);
	}

	@Override
	public int insertProduct(Product product) {
		int result = adminDao.insertProduct(product);
		log.debug("admin#pcode = {}", product.getPcode());
		
		// 첨부파일 insert
		List<ProductAttachment> attachments = product.getAttachments();
		if(!attachments.isEmpty()) {
			for(ProductAttachment attach : attachments) {
				attach.setPcode(product.getPcode());
				result = adminDao.insertAttachment(attach);
			}
		}
		return result;
				
	}
	
	@Override
	public Category getCategoryParentLevel(int categoryId) {
		return adminDao.getCategoryParentLevel(categoryId);
	}
	
	@Override
	public ProductAttachment selectOneAttachment(int attachNo) {
		return adminDao.selectOneAttachment(attachNo);
	}
	
	@Override
	public int deleteAttachment(int attachNo) {
		return adminDao.deleteAttachment(attachNo);
	}
	
	@Override
	public int updateProduct(Product product) {
		// 상품 업데이트
		int result = adminDao.updateProduct(product);
		
		// 첨부파일 insert
		List<ProductAttachment> attachments = product.getAttachments();
		if(attachments != null && !attachments.isEmpty()) {
			for(ProductAttachment attach : attachments) {
				result = adminDao.insertAttachment(attach);
			}
		}
		
		return result;
	}
	
	
	
	
	

// 주희코드 끝
	
//	태연코드 시작
	@Override
	public List<User> userList(Map<String, Integer> param,String searchType, String keyword) {
		int limit = param.get("limit");
		int offset = (param.get("cPage") - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return adminDao.userList(rowBounds,searchType,keyword);
	}
	
	@Override
	public int getTotalContent() {
		return adminDao.getTotalContent();
	}
	
	
// 태연코드 끝
}
	
	
	
	
	
