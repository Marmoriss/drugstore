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
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.member.model.dao.MemberDao;
import com.kh.drugstore.member.model.dto.Member;
import com.kh.drugstore.member.model.dto.MemberEntity;
import com.kh.drugstore.orders.model.dto.Orders;

import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
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
	public int insertKakaoMember(Member memberK) {
		return memberDao.insertkakaoMember(memberK);
	}
	
	@Override
	public Member selectOneMemberByName(Member member) {
		return memberDao.selecOneMemberByName(member);
	}
	@Override
	public List<Orders> getOrderById(Map<String, Object> param) {
		int limit = (int) param.get("limit"); 
		 int offset = (int)param.get("cPage") - 1 * limit; 
		 RowBounds rowBounds = new RowBounds(offset, limit); 
		 return memberDao.getOrderById(rowBounds,param);
	}
	@Override
	public int getTotalContent(Map<String, Object> param) {
		 return memberDao.getTotalContent(param);
	}
	@Override
	public List<Orders> findByValues(Map<String, Object> param) {
		return memberDao.findByValues(param);
	}
	
}
