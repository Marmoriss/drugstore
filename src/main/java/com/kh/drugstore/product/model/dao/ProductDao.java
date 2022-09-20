package com.kh.drugstore.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;
import com.kh.drugstore.product.model.dto.ProductEntity;

@Mapper
public interface ProductDao {

	@Select("select p.*, (select count(*) from product_attachment where pcode = p.pcode) attach_count from product p")
	List<Product> findAllProduct(RowBounds rowBounds);

	@Select("select count(*) from product")
	int getTotalContent();

	@Select("select * from product_attachment where pcode = #{pcode}")
	List<ProductAttachment> findAttachmentByProductCode(int pcode);

	@Select("select * from product where category_id = #{categoryId}")
	List<Product> selectProductByCategoryId(int categoryId);

	Product selectOneProductCollection(int pcode);

	List<ProductEntity> findByValues(Map<String, Object> param);

	@Select("select * from (select * from product where main_fnctn like concat('%' || #{symptom},'%')) where rownum <= 3")
	List<Product> findServeyProduct(String symptom);

	// 주희 코드 시작
	
	@Select("select pcode from product where pname like '%' || #{pname} || '%'")
	int selectPcodeByPname(String pname);
	
	@Select("select pname from product where pname like '%' || #{pname} || '%' ")
	List<String> autocompletePname(String pname);
	
	// 동하
	@Select("select * from product where rownum <= 10")
	List<Product> selectSubscriptionAllProduct();
	
	@Select("select pcode from product where pname like '%' || #{pname} || '%'")
	int selectPcodeByPname(String pname);
			
}
