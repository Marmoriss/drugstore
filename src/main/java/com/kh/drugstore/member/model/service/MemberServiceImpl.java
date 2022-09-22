package com.kh.drugstore.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.drugstore.member.model.dao.MemberDao;
import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.member.model.dto.MemberEntity;

import lombok.NonNull;
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
	
	@Override
	public int deleteMember(Member member) {
		return memberDao.deleteMember(member);
	}
	
	@Override
	public Member findKakaoMember(String memberId) {
		return memberDao.findKakaoMember(memberId);
	}
	
	@Override
	public int insertKakaoMember(MemberEntity memberK) {
		return memberDao.insertkakaoMember(memberK);
	}
	
	@Override
	public Member selectOneMemberByName(Member member) {
		return memberDao.selecOneMemberByName(member);
	}
	
}
