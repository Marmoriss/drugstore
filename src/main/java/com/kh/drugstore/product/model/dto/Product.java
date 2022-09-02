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

	public Product(int pcode, int categoryCode, String pName, String menu, int amount, String originalFilename,
			String renamedFilename, int stock, String ingreName, String ingreEff, String ingreSideeff, String caution,
			String usage, String storage, String subYn, Date enrollDate) {
		super(pcode, categoryCode, pName, menu, amount, originalFilename, renamedFilename, stock, ingreName, ingreEff,
				ingreSideeff, caution, usage, storage, subYn, enrollDate);
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
