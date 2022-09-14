package com.kh.drugstore.member.model.service;

import java.io.IOException;
import java.util.HashMap;

import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.member.model.dto.MemberEntity;

import lombok.NonNull;

public interface MemberService {

	int insertMember(Member member);

	Member selectOneMember(String memberId);

	int updateMember(Member member);

	int deleteMember(Member member);

	Member findKakaoMember(@NonNull String memberId);

	int insertKakaoMember(MemberEntity memberK);


	

	

	

	
}
