package com.kh.drugstore.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.review.model.dao.ReviewDao;
import com.kh.drugstore.review.model.dto.Review;
import com.kh.drugstore.review.model.dto.ReviewAttachment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao reviewDao;

	@Override
	public List<Review> selectReviewListByPcode(int pcode) {
		return reviewDao.selectReviewListByPcode(pcode);
	}
	
	@Override
	public int insertReview(Review review) {
		int result = reviewDao.insertReview(review);
		log.debug("review#no = {}", review.getNo());
		
		// 첨부파일 insert
		List<ReviewAttachment> attachments = review.getAttachments();
		if(!attachments.isEmpty()) {
			for(ReviewAttachment attach : attachments) {
				attach.setReviewNo(review.getNo());
				result = reviewDao.insertAttachment(attach);
			}
		}
		
		return result;
	}
}
