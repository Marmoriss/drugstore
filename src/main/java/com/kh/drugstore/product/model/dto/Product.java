package com.kh.drugstore.product.model.dto;

import java.time.LocalDate;
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

	public Product(@NonNull int pcode, int categoryId, int sttenmtNo, String pname, @NonNull String menu,
			@NonNull int price, @NonNull int amount, String ingreName, String mainFnctn, String intakeHint1,
			String srvUse, String distbPd, YesNo subYn, String baseStandard, SaleStatus saleStatus, LocalDate createdAt,
			LocalDate updatedAt) {
		super(pcode, categoryId, sttenmtNo, pname, menu, price, amount, ingreName, mainFnctn, intakeHint1, srvUse, distbPd,
				subYn, baseStandard, saleStatus, createdAt, updatedAt);
		// TODO Auto-generated constructor stub
	}
	
	public void add(ProductAttachment attach) {
		this.attachments.add(attach);
	}


}
