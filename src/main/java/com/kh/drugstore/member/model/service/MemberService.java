package com.kh.drugstore.member.model.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.member.model.dto.MemberEntity;
import com.kh.drugstore.orders.model.dto.Orders;

import lombok.NonNull;

public interface MemberService {

	int insertMember(Member member);

	Member selectOneMember(String memberId);

	int updateMember(Member member);

	int deleteMember(Member member);

	Member findKakaoMember(@NonNull String memberId);

	int insertKakaoMember(Member memberK);

	Member selectOneMemberByName(Member member);

	List<Orders> getOrderById(Map<String, Object> param);

	int getTotalContent(Map<String, Object> param);

	List<Orders> findByValues(Map<String, Object> param);


	

	

	

	
}
