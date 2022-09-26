package com.kh.drugstore.faq.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.drugstore.faq.model.dto.Faq;

@Mapper
public interface FaqDao {

	@Select("select * from faq order by no desc")
	List<Faq> selectFaqList();

	@Insert("insert into faq values (seq_faq_no.nextval, #{question}, #{answer})")
	int insertFaq(Faq faq);

	@Delete("delete from faq where no = #{no}")
	int deleteFaq(int no);

	

	
	
}
