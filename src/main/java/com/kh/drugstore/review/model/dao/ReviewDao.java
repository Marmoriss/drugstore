package com.kh.drugstore.review.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.drugstore.review.model.dto.Review;

@Mapper
public interface ReviewDao {

	List<Review> selectReviewListByPcode(int pcode);

}
