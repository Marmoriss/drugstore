package com.kh.drugstore.orders.model.dto;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Orders {
    private int merchantUid; //주문번호
    private String memberId; //구매자 아이디
    private String impUid; //결제번호(NN)
    private String receiptId; //pa 주문번호(NN)
    private String method; //결제수단(NN)
    private String name; //주문명
    private Date createdAt; //결제 요청일
    private Date paidAt; //결제 완료일
    private Date failedAt; //결제 실패일
    private int cancelledAmount; //취소 금액
    private Date cancelledAt; //결제 취소일
    private int productPrice; //상품 금액(NN)
    private int totalPrice; //총 금액(NN)
    private int deliveryPrice; //배송비
    private String returnStatus; //반품 처리 상태
    private String returnReason; //반품 사유
    private Date returnRequestDate; //반품 신청일
    private Date returnCompleteDate; //반품 처리일
    private String cancelStatus; //취소 처리 상태
    private String cancelReason; //취소 사유
    private Date cancelRequestDate; //취소 신청일
    private Date cancelCompleteDate; //취소 처리일
    private String refundStatus; //환불 처리 상태
    private String refundMethod; //환불 수단
    private int totalRefundPrice; //총 환불금
    private Date refundRequestDate; //환불 신청일
    private Date refundCompleteDate; //환불 처리일
    private String recipient; //수령인
    private String postCode; //우편번호
    private String address; //주소
    private String detailAddress; //상세주소
    private String memo; //요청사항
    private String status; //주문상태(default 배송준비중)
}
