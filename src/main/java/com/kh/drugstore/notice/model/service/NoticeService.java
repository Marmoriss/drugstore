package com.kh.drugstore.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.kh.drugstore.notice.model.dao.NoticeDao;
import com.kh.drugstore.notice.model.dto.Notice;



public interface NoticeService {

	List<Notice> selectNoticeList();
}
