package com.kh.drugstore.admin.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.drugstore.product.model.dto.Product;

@Mapper
public interface AdminDao {

	@Select("select * from product order by pcode")
	List<Product> selectProductList();

}
