package com.kh.drugstore.product.model.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class Product extends ProductEntity {
/**
 * ProductEntity : getter/setter있는 진짜 상품 클래스
 * Product : 보조 클래스 
 */
	private List<ProductAttachment> attachmentList = new ArrayList<>();

	public Product(int pCode, int bigCode, String smallCode, int sttenmt_no, String pName, String menu, int price,
			int amount, String ingreName, String mainFnctn, String intakeHint1, String srvUse, String distbPd,
			String subYn, Date enrollDate) {
		super(pCode, bigCode, smallCode, sttenmt_no, pName, menu, price, amount, ingreName, mainFnctn, intakeHint1, srvUse,
				distbPd, subYn, enrollDate);
	}

	public Product(List<ProductAttachment> attachmentList) {
		super();
		this.attachmentList = attachmentList;
	}

	@Override
	public String toString() {
		return "Product [attachmentList=" + attachmentList + "]";
	}

	
}
