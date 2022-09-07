package com.kh.drugstore.qna.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.qna.model.dao.QnaDao;
import com.kh.drugstore.qna.model.dto.Qna;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaDao qnaDao;

	@Override
	public List<Qna> selectQnaList() {
		return qnaDao.selectQnaList();
	}
	
}
