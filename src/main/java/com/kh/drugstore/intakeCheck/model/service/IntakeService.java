package com.kh.drugstore.intakeCheck.model.service;

import java.util.List;
import java.util.Map;

import com.kh.drugstore.intakeCheck.model.dto.IntakeCheck;
import com.kh.drugstore.intakeCheck.model.dto.IntakeCheckExtend;

public interface IntakeService {

	int addIntakeList(IntakeCheck intake);

	List<IntakeCheckExtend> findByMemberId(String memberId);

	int deleteIntakeList(Map<String, Object> param);

	int updateIntakeYn(Map<String, Object> param);

}
