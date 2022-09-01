package com.kh.drugstore.productBoard.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.productBoard.model.dao.ProductBoardDao;
import com.kh.drugstore.productBoard.model.dto.ProductBoard;

import lombok.extern.slf4j.Slf4j;

@Transactional(rollbackFor = Exception.class)
@Service
@Slf4j
public class ProductBoardServiceImpl implements ProductBoardService {

	@Autowired
	ProductBoardDao productBoardDao;
	
	@Override
	public List<ProductBoard> selectProductBoardList(Map<String, Integer> param) {
		int limit = param.get("limit");
		int offset = (param.get("cPage") - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return productBoardDao.selectProductBoardList(rowBounds);
	}
}
