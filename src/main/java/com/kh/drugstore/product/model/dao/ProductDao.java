package com.kh.drugstore.product.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;

public interface ProductDao {


	List<Product> findAllProduct(RowBounds rowBounds);

	@Select("select count(*) from product")
	int getTotalContent();

	@Select("select * from product_attachment where pCode = #{pCode}")
	List<ProductAttachment> findAttachmentByProductCode(int pCode);

}
