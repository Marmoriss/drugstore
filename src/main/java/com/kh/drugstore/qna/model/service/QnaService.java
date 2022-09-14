package com.kh.drugstore.qna.model.service;

import java.util.List;
import java.util.Map;

import com.kh.drugstore.qna.model.dto.Qna;

public interface QnaService {

	List<Qna> selectQnaList(Map<String, Integer> param);

	int getTotalContent();

	int insertQna(Qna qna);

	Qna oneQna(int pCode);

	int insertQnaComment(Qna qna);


}
