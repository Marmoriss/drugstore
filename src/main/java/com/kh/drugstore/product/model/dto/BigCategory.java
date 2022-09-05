package com.kh.drugstore.product.model.dto;

import java.util.Arrays;

import lombok.Data;
import lombok.Getter;

@Getter
public enum BigCategory {
/**
 * DrugElement (약성분) 
	Gender 성별
	age 연령별
	body 신체부위
	Subscription 정기구독 
 *  
 */
	DRUGELEMENT("성분"),
	GENDER("성별"),
	AGE("연령"),
	BODY("신체부위"),
	SUBSCRIPTION("정기구독");
	
	private final String value;

	private BigCategory(String value) {
		this.value = value;
	}
	
	//ENUM 리스트에서 값 꺼내기 수식 
	// https://studyandwrite.tistory.com/506 <- 해당 부분 코드 참조 
	// 마음껏 지우고 편하게 해주세요.
	public static BigCategory fromCode(String dbData) {
		//정적메소드 Arrays.stream 생성. dbData와 똑같은 값만 getValue만 필터링 할것.  
		return Arrays.stream(BigCategory.values())
					.filter(v -> v.getValue().equals(dbData))
					.findAny() //filter조건에 해당하는 요소 1개를 먼저 찾으면 리턴.
					.orElseThrow(() -> new IllegalArgumentException(String.format("카테고리에 %s가 존재하지 않습니다.", dbData)));
	}
	
	@Data
	public static class BigCategoryResponse {
		private String key;
		private String value;
		
		public BigCategoryResponse(String key, BigCategory bigCategory) {
			this.key = key;
			this.value = bigCategory.getValue();
		}
	}
}
