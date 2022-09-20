package com.kh.drugstore.intakeCheck.model.service;

import java.util.List;

import com.kh.drugstore.intakeCheck.model.dto.IntakeCheck;

public interface IntakeService {

	int addIntakeList(IntakeCheck intake);

	List<IntakeCheck> findByMemberId(String memberId);

}
