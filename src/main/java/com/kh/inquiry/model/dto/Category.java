package com.kh.inquiry.model.dto;

public enum Category {
	
	inquiryProduct("제품문의"),
	inquiryMember("회원문의"),
	inquiryDelivery("배송문의"),
	inquiryOrderPay("주문/결제"),
	inquiryOrderElse("취소/반품/환불"),
	inquiryEtc("기타");
	
	private String krName;
	
	Category(String krName) {
		this.krName = krName;
	}
	
	public String getKrName() {
		return krName;
	}

}
