package com.kh.drugstore.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.drugstore.review.model.dao.ReviewDao;
import com.kh.drugstore.review.model.dto.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao reviewDao;

	@Override
	public List<Review> selectReviewListByPcode(int pcode) {
		return reviewDao.selectReviewListByPcode(pcode);
	}
}
