package com.kh.drugstore.qna.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.qna.model.dao.QnaDao;
import com.kh.drugstore.qna.model.dto.Qna;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaDao qnaDao;

	@Override
	public List<Qna> selectQnaList (Map<String, Integer> param) {
		int limit = param.get("limit");
		int offset = (param.get("cPage") - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return qnaDao.selectQnaList(rowBounds);
	}
	
	@Override
	public int getTotalContent() {
		return qnaDao.getTotalContent();
	}
	
	@Override
	public int insertQna(Qna qna) {
		// TODO Auto-generated method stub
		return qnaDao.insertQna(qna);
	}
	
	@Override
	public Qna oneQna(int pCode) {
		// TODO Auto-generated method stub
		return qnaDao.oneQna(pCode);
	}
	
	@Override
	public int insertQnaComment(Qna qna) {
		// TODO Auto-generated method stub
		return qnaDao.insertQnaComment(qna);
	}
	
}
