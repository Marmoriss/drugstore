package com.kh.drugstore.product.model.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductEntity {
/**
 * - 카테고리(복합 pk) - 코드/이름으로 묶일것이고. 카테고리/상품코드 둘다 복합 pk
	- 대분류만 영문자(enum) / 상품 코드랑 소분류코드는 숫자(int)로 
	- 숫자는 6자리로 잡고 가기. 
 */
	private int pcode;
	private int categoryCode;
	private String pName;
	private String menu;
	private int amount;
	private String originalFilename;
	private String renamedFilename;
	private int stock;
	private String ingreName;
	private String ingreEff;
	private String ingreSideeff;
	private String caution;
	private String usage;
	private String storage;
	private String subYn;
	private Date enrollDate;
	
	
}
