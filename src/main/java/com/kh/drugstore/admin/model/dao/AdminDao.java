package com.kh.drugstore.admin.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.kh.drugstore.member.model.dto.User;
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
			+ "		m.member_id,name,phone,created_at,gender,body from member m left join servey s on\r\n"
			+ "		(m.member_id = s.member_id)) order by created_at desc")
	int getTotalContent();

	@Select("select count(*) from member where to_char(created_at, 'yymmdd') = to_char(sysdate-1,'yymmdd')")
	int getMinus1Mem();

	@Select("select count(*) from member where to_char(created_at, 'yymmdd') = to_char(sysdate-2,'yymmdd')")
	int getMinus2Mem();
	
	@Select("select count(*) from member where to_char(created_at, 'yymmdd') = to_char(sysdate-3,'yymmdd')")
	int getMinus3Mem();
	
	@Select("select count(*) from member where to_char(created_at, 'yymmdd') = to_char(sysdate-4,'yymmdd')")
	int getMinus4Mem();
	
	@Select("select count(*) from member where to_char(created_at, 'yymmdd') = to_char(sysdate-5,'yymmdd')")
	int getMinus5Mem();
	
	@Select("select count(*) from member where to_char(created_at, 'yymmdd') = to_char(sysdate-6,'yymmdd')")
	int getMinus6Mem();
	
	@Select("select count(*) from member where to_char(created_at, 'yymmdd') = to_char(sysdate-7,'yymmdd')")
	int getMinus7Mem();
	
	@Select("select count(*) from member where to_char(created_at, 'yymmdd') = to_char(sysdate,'yymmdd')")
	int getMemToday();

	@Select("select count(*) from visit where to_char(v_date, 'yy/mm/dd') = to_char(sysdate, 'yy/mm/dd')")
	int getVisitTodayCount();

	@Select("select count(*) from visit")
	int getVisitTotalCount();
	
	@Insert("insert into visit(v_date) values(sysdate)")
	void insertVisit();


	
	
	
	
	
	
	
// 태연코드 끝

}
