package com.kh.drugstore.product.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;

public interface ProductDao {

	@Select("select p.*, (select count(*) from product_attachment where pcode = p.pcode) attach_count from product p order by pcode desc")
	List<Product> findAllProduct(RowBounds rowBounds);

	@Select("select count(*) from product")
	int getTotalContent();

	@Select("select * from product_attachment where pCode = #{pCode}")
	List<ProductAttachment> findAttachmentByProductCode(int pCode);

	@Select("select * from product where category_id = #{categoryId}")
	List<Product> selectProductByCategoryId(int categoryId);

	@Select("select * from product where pcode = #{pCode}")
	List<Product> selectOneProduct(int pCode);

}
