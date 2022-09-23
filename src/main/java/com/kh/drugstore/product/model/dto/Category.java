package com.kh.drugstore.product.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Category {

	private String categoryId;
	private int categoryLev;
	private String categoryNm;
	private String categoryDetailName;
	private int categoryParentLev;
}
