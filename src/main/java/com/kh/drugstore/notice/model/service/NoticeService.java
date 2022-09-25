package com.kh.drugstore.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.drugstore.notice.model.dto.Notice;

public interface NoticeService {

	List<Notice> selectNoticeList(Map<String, Integer> param);

	int insertNotice(Notice notice);

	Notice oneNotice(int no);

	int updateNotice(Notice notice);

	int deleteNotice(int no);

	Notice movePage(int no);

	int getTotalContent();

}
