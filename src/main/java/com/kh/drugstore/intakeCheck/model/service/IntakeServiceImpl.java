package com.kh.drugstore.intakeCheck.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.intakeCheck.model.dao.IntakeDao;
import com.kh.drugstore.intakeCheck.model.dto.IntakeCheck;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class IntakeServiceImpl implements IntakeService {

	@Autowired
	private IntakeDao intakeDao;
	
	@Override
	public int addIntakeList(IntakeCheck intake) {
		return intakeDao.addIntakeList(intake);
	}
	
	@Override
	public List<IntakeCheck> findByMemberId(String memberId) {
		return intakeDao.findByMemberId(memberId);
	}
	
	
	
}
   