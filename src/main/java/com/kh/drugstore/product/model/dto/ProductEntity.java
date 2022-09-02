package com.kh.drugstore.product.model.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductEntity {
/**
 * - 카테고리(복합 pk) - 코드/이름으로 묶일것이고. 카테고리/상품코드 둘다 복합 pk
	- 대분류만 영문자(enum) / 상품 코드랑 소분류코드는 숫자(int)로 
	- 숫자는 6자리로 잡고 가기. 
 */
	private int pCode; //상품코드
	private int bigCode; //대분류코드
	private String smallCode; //소분류코드
	private int sttenmt_no; //품목제조관리 번호
	private String pName; //상품명
	@NonNull
	private String menu; //제조사
	@NonNull
	private int price; //가격
	@NonNull
	private int amount; //내용량(수량)
	private String ingreName; //성분명
	private String mainFnctn; //효능
	private String intakeHint1; //주의사항
	private String srvUse; //용법
	private String distbPd; //유통기한
	private String subYn; //구독상품 여부 
	private Date enrollDate; //기준규격
	
	
}
