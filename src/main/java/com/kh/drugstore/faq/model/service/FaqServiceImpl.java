package com.kh.drugstore.faq.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.faq.model.dao.FaqDao;
import com.kh.drugstore.faq.model.dto.Faq;

@Service
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqDao faqDao;
	
	@Override
	public List<Faq> selectFaqList() {
		return faqDao.selectFaqList();
	}
	
	@Override
	public int insertFaq(Faq faq) {
		return faqDao.insertFaq(faq);
	}
	
	@Override
	public int deleteFaq(int no) {
	return faqDao.deleteFaq(no);
}

}
