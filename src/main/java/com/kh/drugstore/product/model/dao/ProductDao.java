package com.kh.drugstore.product.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;

public interface ProductDao {

	@Select("select p.*, (select count(*) from product_attachment where pcode = p.pcode) attach_count from product p")
	List<Product> findAllProduct(RowBounds rowBounds);

	@Select("select count(*) from product")
	int getTotalContent();

	@Select("select * from product_attachment where pcode = #{pcode}")
	List<ProductAttachment> findAttachmentByProductCode(int pcode);

	@Select("select * from product where category_id = #{categoryId}")
	List<Product> selectProductByCategoryId(int categoryId);

	@Select("select * from product where pcode = #{pcode}")
	List<Product> selectOneProduct(int pcode);

}
