package com.kh.drugstore.intakeCheck.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.drugstore.intakeCheck.model.dto.IntakeCheck;

@Mapper
public interface IntakeDao {

	@Insert("insert into intake_check values(seq_intake_check_no.nextval, #{memberId}, #{pcode}, null, #{alarmTime}, default, default, null)")
	int addIntakeList(IntakeCheck intake);

	@Select("select * from intake_check where member_id = #{memberId}")
	List<IntakeCheck> findByMemberId(String memberId);

	
}
