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
	
//	@Select("select count(*) from category join product p on (c.category_id = p.category_id) where c.category_id (select category_id from category where category_parent_lev = #{category_parent_lev})")
//	int getBigTotalContent();
//	
//	@Select("select count(*) from product p left join product_attachment a on p.pcode = a.pcode where category_id = #{category_id}")
//	int getSmallTotalContent();

	@Select("select * from product_attachment where pcode = #{pcode}")
	List<ProductAttachment> findAttachmentByProductCode(int pcode);

	//소분류 카테고리 리스트
//	@Select("select*from product where category_id = #{categoryId}")
	List<Product> selectProductBysmallCategoryId(int categoryId);

	//대분류 카테고리 리스트 
	List<Product> selectProductBybigCategoryId(int categoryId);

	//최신순 
	@Select("select*from product where category_id = #{categoryId} order by createdAt desc")
	List<Product> sortProductByRecent(int categoryId);
	
	//낮은가격순
	@Select("select*from product where category_id = #{categoryId} order by price")
	List<Product> sortProductByPrice(int categoryId);

	//높은가격순
	@Select("select*from product where category_id = #{categoryId} order by price desc")
	List<Product> sortProductByPriceDesc(int cateogryId);

	Product selectOneProductCollection(int pcode);

	List<ProductEntity> findByValues(ProductEntity product);

	@Select("select * from (select * from product where main_fnctn like concat('%' || #{symptom},'%')) where rownum <= 3")
	List<Product> findServeyProduct(String symptom);

	// 주희 코드 시작
	
	@Select("select pcode from product where pname like '%' || #{pname} || '%'")
	int selectPcodeByPname(String pname);
	
	@Select("select pname from product where pname like '%' || #{pname} || '%' ")
	List<String> autocompletePname(String pname);
	
	@Select("select * from product")
	List<Product> selectProductList();

	// 동하
	List<Product> selectSubscriptionAllProduct();

	List<Product> checkCategory(int[] checkCategoryByCartNo);
	
	@Select("select * from product where pcode = #{pcode}")
	Product getProductBySubNo(int pcode);






	
	
	
			
}
