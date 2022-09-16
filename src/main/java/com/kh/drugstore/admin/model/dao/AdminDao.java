  package com.kh.drugstore.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.kh.drugstore.member.model.dto.User;
import com.kh.drugstore.orders.model.dto.Orders;
import com.kh.drugstore.product.model.dto.Category;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.ProductAttachment;

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
	
	@Insert("insert into product(pcode, category_id, pname, manu, price, amount) values(seq_product_no.nextval, #{categoryId}, #{pname}, #{manu}, #{price}, #{amount})")
	@SelectKey(statement = "select seq_product_no.currval from dual", before = false, keyProperty = "pcode", resultType = int.class)
	int insertProduct(Product product);
	
	@Insert("insert into product_attachment values(seq_product_attach_no.nextval, #{pcode}, #{originalFilename}, #{renamedFilename}, default)")
	int insertAttachment(ProductAttachment attach);
	
	@Insert("insert into product values(seq_product_no.nextval, #{sttenmtNo}, #{pname}, #{manu}, 0, 0, null, #{mainFnctn}, #{intakeHint1}, #{srvUse}, #{distbPd}, default, #{baseStandard}, null, default, default, null)")
	int insertOpenApi(Map<String, Object> map);
	
	@Select("select * from category where category_id = #{categoryId}")
	Category getCategoryParentLevel(int categoryId);
	
	@Select("select * from product_attachment where attach_no = #{attachNo}")
	ProductAttachment selectOneAttachment(int attachNo);
	
	@Delete("delete from product_attachment where attach_no = #{attachNo}")
	int deleteAttachment(int attachNo);
	
	int updateProduct(Product product);
	
	
	
	
	
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

	@Select("select merchant_uid, member_id, total_price, status, paid_at from orders")
	List<Orders> selectOrders();

	@Update("update orders set status ='배송중' where merchant_uid = #{merchantUid}")
	int statusUpdate(Map<String, Object> data);



	
	
	
	
	
// 태연코드 끝

}
