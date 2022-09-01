package com.kh.drugstore.question.model.dto;

public enum Category {
	questProduct("제품문의"),
	questMember("회원문의"),
	questDelivery("배송문의"),
	questOrderPay("주문/결제"),
	questOrderElse("취소/반품/환불"),
	questEtc("기타");
	
	private String questCategory;
	
	Category(String questCategory) {
		this.questCategory = questCategory;
	}
	
	public String getQuestCategory() {
		return questCategory;
	}
	
}

