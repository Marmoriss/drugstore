package com.kh.drugstore.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.notice.model.dao.NoticeDao;
import com.kh.drugstore.notice.model.dto.Notice;

import lombok.extern.slf4j.Slf4j;

//@Service
@Slf4j
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao noticeDao;
	
	@Override
	public List<Notice> selectNoticeList() {
		return noticeDao.selectNoticeList();
	}
}
