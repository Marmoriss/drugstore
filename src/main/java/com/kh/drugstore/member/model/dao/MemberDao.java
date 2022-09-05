package com.kh.drugstore.member.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.drugstore.member.model.dto.Member;

@Mapper
public interface MemberDao {
	
	@Insert("insert into member values(#{memberId},#{name},#{password},#{phone},default,null,default,null,null,#{address},#{detailAddress},null)")
	int insertMember(Member member);

	Member selectOneMember(String memberId);

	@Update("update member"
			+ " set name = #{name}, password = #{password}, phone = #{phone}, address = #{address}, detail_address = #{detailAddress}"
			+ " where member_id = #{memberId}")
	int updateMember(Member member);

}
