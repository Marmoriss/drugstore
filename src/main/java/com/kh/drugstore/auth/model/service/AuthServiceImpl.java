package com.kh.drugstore.auth.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.auth.model.dao.AuthDao;

import lombok.NonNull;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private AuthDao authDao;
	
	@Override
	public int insertAuth(@NonNull String memberId) {
		return authDao.insertAuth(memberId);
	}
}
