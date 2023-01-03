package com.kh.drugstore.review.model.service;

import java.util.List;

import com.kh.drugstore.review.model.dto.Review;
import com.kh.drugstore.review.model.dto.ReviewAttachment;

public interface ReviewService {

	List<Review> selectReviewListByPcode(int pcode);

	int insertReview(Review review);

	Review getOneReview(int no);

	ReviewAttachment selectOneAttachment(int attachNo);

	int deleteAttachment(int attachNo);

	int updateReview(Review review);

}
