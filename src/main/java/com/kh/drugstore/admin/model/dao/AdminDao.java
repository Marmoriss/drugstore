package com.kh.drugstore.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;
import com.kh.drugstore.member.model.dto.User;

import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.product.model.dto.Category;
import com.kh.drugstore.product.model.dto.Product;

@Mapper
public interface AdminDao {

// 주희코드 시작
	@Select("select * from product order by pcode")
	List<Product> selectProductList();
	
	@Select("select * from category where category_parent_lev = #{categoryId} order by category_id")
	List<Category> selectCategoryList(int categoryId);
	
	@Select("select pname from product where pname like '%' || #{pname} || '%' ")
	List<String> autocompletePname(String pname);
	
	@Select("select manu from product where manu like '%' || #{menu} || '%' ")
	List<String> autocompleteManu(String manu);
// 주희코드 끝
	
// 태연코드 시작
	List<User> userList(RowBounds rowBounds, @Param("searchType")String searchType, @Param("keyword")String keyword);
	
	@Select("select count(*)\r\n"
			+ "from (select\r\n"
			+ "		m.member_id,name,phone,created_at,gender,body from member m join servey s on\r\n"
			+ "		(m.member_id = s.member_id))")
	int getTotalContent();

	
// 태연코드 끝

}
