package com.kh.drugstore.question.model.dto;

import static java.util.stream.Collectors.toMap;

import java.util.Map;
import java.util.Objects;
import java.util.stream.Stream;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public enum QuestionCategory {
	
	제품문의, 회원문의, 배송문의, 주문결제, 취소반품환불, 기타;
	

	
	
}

