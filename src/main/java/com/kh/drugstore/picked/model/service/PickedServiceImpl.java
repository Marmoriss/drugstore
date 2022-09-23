package com.kh.drugstore.picked.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.picked.model.dao.PickedDao;
import com.kh.drugstore.picked.model.dto.PickedExtends;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class PickedServiceImpl implements PickedService {

	@Autowired
	PickedDao pickedDao;
	
	@Override
	public List<PickedExtends> selectPickedList(String memberId) {
		return pickedDao.selectPickedList(memberId);
	}
	
	@Override
	public int deletePickedList(Map<String, Object> map) {
		int result = 0;
		int[] pcodes = (int[]) map.get("pcode");
		
		for(int pcode : pcodes){
			map.put("pcode", pcode);
			result = pickedDao.deletePickedList(map);
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
