package com.kh.drugstore.picked.model.service;

import java.util.List;
import java.util.Map;

import com.kh.drugstore.picked.model.dto.PickedExtends;

public interface PickedService {

	List<PickedExtends> selectPickedList(String memberId);

	int deletePickedList(Map<String, Object> map);

}
