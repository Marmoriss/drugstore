package com.kh.drugstore.notice.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.drugstore.notice.model.dto.Notice;

public interface NoticeDao {

//	@Select("select * from notice order by no desc")
	List<Notice> selectNoticeList();

}
