package com.kh.drugstore.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.member.model.dao.MemberDao;
import com.kh.drugstore.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {

	
    
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}
	
	@Override
	public Member selectOneMember(String memberId) {
		return memberDao.selectOneMember(memberId);
	}
	
	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}
	
	
}
