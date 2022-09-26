package com.kh.drugstore.servey.model.service;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.servey.model.dao.ServeyDao;
import com.kh.drugstore.servey.model.dto.Servey;

@Service
@Transactional(rollbackFor = Exception.class)
public class ServeyServiceImpl implements ServeyService {
	
	@Autowired
	private ServeyDao serveyDao;
	
	@Override
	public int symptomEnroll(Servey servey) {
		return serveyDao.symptomEnroll(servey);
	}
	
	@Override
	public Servey selectOneServey(Object principal) {
		return serveyDao.selectOneServey(principal);
	}
	
	@Override
	public int deleteServey(String name) {
		return serveyDao.deleteServey(name);
	}

}
