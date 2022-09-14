package com.kh.drugstore.servey.model.service;

import com.kh.drugstore.servey.model.dto.Servey;

public interface ServeyService {

	int symptomEnroll(Servey servey);

	Servey selectOneServey(Object principal);


}
