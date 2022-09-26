package com.kh.drugstore.product.model.dto;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.kh.drugstore.common.YesNo;

import lombok.Builder;
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


	public Product(@NonNull int pcode, int categoryId, Long sttenmtNo, String pname, @NonNull String manu,
			@NonNull int price, @NonNull int amount, String ingreName, String mainFnctn, String intakeHint1,
			String srvUse, String distbPd, YesNo subYn, SaleStatus saleStatus, LocalDate createdAt,
			LocalDate updatedAt, int discount) {
		super(pcode, categoryId, sttenmtNo, pname, manu, price, amount, ingreName, mainFnctn, intakeHint1, srvUse, distbPd,
				subYn, saleStatus, createdAt, updatedAt, discount);
	}

	
	public void add(ProductAttachment attach) {
		this.attachments.add(attach);
	}
	
	

}
