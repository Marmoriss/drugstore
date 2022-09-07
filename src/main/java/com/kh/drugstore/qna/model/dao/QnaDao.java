package com.kh.drugstore.qna.model.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import com.kh.drugstore.qna.model.dto.Qna;

@Mapper
public interface QnaDao {

	@Select("select * from qna order by qna_id desc")
	public List<Qna> selectQnaList();


}
