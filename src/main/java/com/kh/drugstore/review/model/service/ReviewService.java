package com.kh.drugstore.review.model.service;

import java.util.List;

import com.kh.drugstore.review.model.dto.Review;

public interface ReviewService {

	List<Review> selectReviewListByPcode(int pcode);

}
