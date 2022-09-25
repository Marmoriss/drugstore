package com.kh.drugstore.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.member.model.dto.MemberEntity;
import com.kh.drugstore.orders.model.dto.Orders;

import lombok.NonNull;

@Mapper
public interface MemberDao {
	
	@Insert("insert into member values(#{memberId},#{name},#{password},#{phone},default,null,default,null,null,#{address},#{detailAddress},null)")
	int insertMember(Member member);

	Member selectOneMember(String memberId);

	@Update("update member"
			+ " set name = #{name}, password = #{password}, phone = #{phone}, address = #{address}, detail_address = #{detailAddress}"
			+ " where member_id = #{memberId}")
	int updateMember(Member member);
	
	// enabled 0으로 해서 컬럼에서 조회는 가능하지만 실제로 로그인 못하게 했다.
	@Update("update member set enabled = '0' where member_id = #{memberId}")
	int deleteMember(Member member);

	@Select("select member_id from member where member_id = #{memberId}")
	Member findKakaoMember(String memberId);
	
	@Insert("insert into member values(#{memberId},#{name},#{password},#{phone},default,null,default,null,null,null,null,null)")
	int insertkakaoMember(Member memberK);

	@Select("select * from member where name = #{name} and phone = #{phone}")
	Member selecOneMemberByName(Member member);

	List<Orders> getOrderById(RowBounds rowBounds, Map<String, Object> param);
	
	int getTotalContent(Map<String, Object> param);

	List<Orders> findByValues(Map<String, Object> param);
	


}
