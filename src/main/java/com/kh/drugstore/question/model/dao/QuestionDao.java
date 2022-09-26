package com.kh.drugstore.question.model.dao;

import java.util.List;

import com.kh.drugstore.question.model.dto.Question;

public interface QuestionDao {

	List<Question> selectQuestionList();

	int insertQuestion(Question question);

	int updateQuestion(Question question);

	int deleteQuestion(int no);

	Question oneQuestion(int no);

}
