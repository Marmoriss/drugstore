package com.kh.drugstore.question.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.question.model.dao.QuestionDao;
import com.kh.drugstore.question.model.dto.Question;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionDao questionDao;
	
	@Override
	public List<Question> selectQuestionList() {
		return questionDao.selectQuestionList();
	}
	
	@Override
	public int insertQuestion(Question question) {
		return questionDao.insertQuestion(question);
	}
	
	@Override
	public int updateQuestion(Question question) {
		return questionDao.updateQuestion(question);
	}
	
	@Override
	public int deleteQuestion(int no) {
		return questionDao.deleteQuestion(no);
	}
	
	@Override
	public Question oneQuestion(int no) {
		return questionDao.oneQuestion(no);
	}
}
