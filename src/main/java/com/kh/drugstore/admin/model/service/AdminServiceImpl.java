package com.kh.drugstore.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.admin.model.dao.AdminDao;
import com.kh.drugstore.member.model.dto.User;
import com.kh.drugstore.notice.model.dto.Notice;
import com.kh.drugstore.orders.model.dto.Orders;
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
	
	@Override
	public int getMinus1Mem() {
		return adminDao.getMinus1Mem(); 
	}
	
	@Override
	public int getMinus2Mem() {
		return adminDao.getMinus2Mem(); 
	}
	
	@Override
	public int getMinus3Mem() {
		return adminDao.getMinus3Mem(); 
	}
	@Override
	public int getMinus4Mem() {
		return adminDao.getMinus4Mem(); 
	}
	@Override
	public int getMinus5Mem() {
		return adminDao.getMinus5Mem(); 
	}
	@Override
	public int getMinus6Mem() {
		return adminDao.getMinus6Mem(); 
	}
	@Override
	public int getMinus7Mem() {
		return adminDao.getMinus7Mem(); 
	}

	@Override
	public int getMemToday() {
		return adminDao.getMemToday(); 
	}
	
	@Override
	public int getVisitTodayCount() {
		return adminDao.getVisitTodayCount();
	}
	
	@Override
	public int getVisitTotalCount() {
		return adminDao.getVisitTotalCount();
	}
	
	@Override
	public void insertVisit() {
		adminDao.insertVisit();
	}

	@Override
	public List<Orders> selectOrders() {
		return adminDao.selectOrders();
	}
	
	@Override
	public int statusUpdate(Map<String, Object> data) {
		return adminDao.statusUpdate(data);
	}

	
// 태연코드 끝
}
	
	
	
	
	
