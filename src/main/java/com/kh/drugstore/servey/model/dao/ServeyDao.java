package com.kh.drugstore.servey.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.drugstore.servey.model.dto.Servey;


@Mapper
public interface ServeyDao {
	
	@Insert("insert into servey values(seq_servey_no.nextval,#{memberId},#{gender},#{height},#{weight},#{body},#{symptom})")
	int symptomEnroll(Servey servey);
	
	@Select("select * from servey where member_id = #{memberId}")
	Servey selectOneServey(Object principal);
	

}
