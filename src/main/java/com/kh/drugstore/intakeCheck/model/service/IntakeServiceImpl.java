package com.kh.drugstore.intakeCheck.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.intakeCheck.model.dao.IntakeDao;
import com.kh.drugstore.intakeCheck.model.dto.IntakeCheck;
import com.kh.drugstore.intakeCheck.model.dto.IntakeCheckExtend;

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
	public List<IntakeCheckExtend> findByMemberId(String memberId) {
		return intakeDao.findByMemberId(memberId);
	}
	
	@Override
	public int deleteIntakeList(Map<String, Object> param) {
		return intakeDao.deleteIntakeList(param);
	}
	
	@Override
	public int updateIntakeYn(Map<String, Object> param) {
		return intakeDao.updateIntakeYn(param);
	}
}
   