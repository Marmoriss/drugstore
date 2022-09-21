package com.kh.drugstore.intakeCheck.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.drugstore.intakeCheck.model.dto.IntakeCheck;
import com.kh.drugstore.intakeCheck.model.dto.IntakeCheckExtend;

@Mapper
public interface IntakeDao {

	@Insert("insert into intake_check values(seq_intake_check_no.nextval, #{memberId}, #{pcode}, null, #{alarmTime}, default, default, null, #{amount})")
	int addIntakeList(IntakeCheck intake);

	@Select("select * from intake_check i left join product p on i.pcode = p.pcode where member_id = #{memberId}")
	List<IntakeCheckExtend> findByMemberId(String memberId);

	@Delete("delete from intake_check where member_id = #{memberId} and pcode = #{pcode}")
	int deleteIntakeList(Map<String, Object> param);

	@Update("update intake_check set intake_yn = #{intakeYn} where member_id = #{memberId} and pcode = #{pcode}")
	int updateIntakeYn(Map<String, Object> param);

	
}
