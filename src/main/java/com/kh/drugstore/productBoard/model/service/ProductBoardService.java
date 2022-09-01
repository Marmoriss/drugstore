package com.kh.drugstore.productBoard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.drugstore.productBoard.model.dto.ProductBoard;

public interface ProductBoardService {

	List<ProductBoard> selectProductBoardList(Map<String, Integer> param);

}
