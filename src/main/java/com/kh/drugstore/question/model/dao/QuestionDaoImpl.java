package com.kh.drugstore.question.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.drugstore.question.model.dto.Question;

@Repository
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Question> selectQuestionList() {
		return sqlSession.selectList("question.selectQeustionList");
	}
	
	@Override
	public int insertQuestion(Question question) {
		return sqlSession.insert("question.insertQuestion", question);
	}
	
	@Override
	public int updateQuestion(Question question) {
		return sqlSession.update("question.updateQuestion", question);
	}
	
	@Override
	public int deleteQuestion(int no) {
		return sqlSession.delete("question.deleteQuestion", no);
	}
	
	@Override
	public Question oneQuestion(int no) {
		return sqlSession.selectOne("question.oneQuestion", no);
	}
}
