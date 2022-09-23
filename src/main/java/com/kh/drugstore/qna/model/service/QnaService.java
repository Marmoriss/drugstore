package com.kh.drugstore.qna.model.service;

import java.util.List;
import java.util.Map;

import com.kh.drugstore.qna.model.dto.Qna;

public interface QnaService {

	List<Qna> selectQnaList(Map<String, Integer> param);

	int getTotalContent();

	int insertQna(Qna qna);

	Qna oneQna(int qnaId);

	int insertQnaComment(Qna qna);

	// 주희 코드 시작
	Qna selectOneQna(int qnaId);

	int updateQna(Qna qna);

	int deleteQna(int qnaId);


}
