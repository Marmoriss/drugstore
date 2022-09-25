package com.kh.drugstore.faq.model.service;

import java.util.List;

import com.kh.drugstore.faq.model.dto.Faq;

public interface FaqService {

	List<Faq> selectFaqList();

	int insertFaq(Faq faq);

	int deleteFaq(int no);


	
	

}
