package com.kh.drugstore.product.model.dto;

import java.util.ArrayList;
import java.util.List;

import com.kh.drugstore.common.YesNo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class Product extends ProductEntity {
	/**
	 * ProductEntity : getter/setter있는 진짜 상품 클래스 Product : 보조 클래스
	 */

	// 첨부파일 추가 클래스
	private List<ProductAttachment> attachments = new ArrayList<>();

	public Product(@NonNull int pCode, BigCode bigCode, String smallCode, int sttenmt_no, String pName,
			@NonNull String menu, @NonNull int price, @NonNull int amount, String ingreName, String mainFnctn,
			String intakeHint1, String srvUse, String distbPd, YesNo subYn, String baseStandard) {
		super(pCode, bigCode, smallCode, sttenmt_no, pName, menu, price, amount, ingreName, mainFnctn, intakeHint1,
				srvUse, distbPd, subYn, baseStandard);
	}
	
	public void add(ProductAttachment attach) {
		this.attachments.add(attach);
	}

}
