package com.kh.drugstore.servey.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.servey.model.dao.ServeyDao;

@Service
public class ServeyServiceImpl implements ServeyService {
	
	@Autowired
	private ServeyDao serveyDao;
}
