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
	public Qna oneQna(int pcode) {
		// TODO Auto-generated method stub
		return qnaDao.oneQna(pcode);
	}
	
	@Override
	public int insertQnaComment(Qna qna) {
		// TODO Auto-generated method stub
		return qnaDao.insertQnaComment(qna);
	}
	
	// 주희 코드 시작
	@Override
	public Qna selectOneQna(int qnaId) {
		return qnaDao.selectOneQna(qnaId);
	}
	
	@Override
	public int updateQna(Qna qna) {
		return qnaDao.updateQna(qna);
	}
	
	@Override
	public int deleteQna(int qnaId) {
		return qnaDao.deleteQna(qnaId);
	}
	
	@Override
	public List<Qna> selectQnaListByPcode(int pcode) {
		return qnaDao.selectQnaListByPcode(pcode);
	}
	
	@Override
	public Qna selectOneAnswer(int qnaId) {
		return qnaDao.selectOneAnswer(qnaId);
	}
	
	
	
	
	
	
	
	
	
}
