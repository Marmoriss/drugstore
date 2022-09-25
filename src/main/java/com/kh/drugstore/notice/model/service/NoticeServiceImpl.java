package com.kh.drugstore.notice.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.notice.model.dao.NoticeDao;
import com.kh.drugstore.notice.model.dto.Notice;
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao noticeDao;
	
	@Override
	public List<Notice> selectNoticeList(Map<String, Integer> param) {
		int limit = param.get("limit");
		int offset = (param.get("cPage") - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return noticeDao.selectNoticeList(rowBounds);
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}
	
	@Override
	public Notice oneNotice(int no) {
		return noticeDao.oneNotice(no);
	}
	
	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}
	
	@Override
	public int deleteNotice(int no) {
		return noticeDao.deleteNotice(no);
	}
	
	@Override
	public Notice movePage(int no) {
		return noticeDao.movePage(no);
	}
	
	@Override
	public int getTotalContent() {
		return noticeDao.getTotalContent();
	}
}
