package com.kh.drugstore.picked.model.dto;

import java.time.LocalDate;

import com.kh.drugstore.common.YesNo;
import com.kh.drugstore.product.model.dto.Product;
import com.kh.drugstore.product.model.dto.SaleStatus;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PickedExtends{
	private String memberId;
	private int pcode;
	private String pname;
	private int price;
	private int discount;
	private String originalFilename;
	private String renamedFilename;
	
	
}
