package com.kh.drugstore.review.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.kh.drugstore.review.model.dto.Review;
import com.kh.drugstore.review.model.dto.ReviewAttachment;

@Mapper
public interface ReviewDao {

	List<Review> selectReviewListByPcode(int pcode);
	
	@Insert("insert into review values(seq_review_no.nextval, #{memberId}, #{pcode}, #{content}, #{star}, default)")
	@SelectKey(statement = "select seq_review_no.currval from dual", before = false, keyProperty = "no", resultType = int.class)
	int insertReview(Review review);

	@Insert("insert into review_attachment values(seq_review_attach_no.nextval, #{reviewNo}, #{originalFilename}, #{renamedFilename}, default)")
	int insertAttachment(ReviewAttachment attach);

	Review getOneReview(int reviewNo);

	@Select("select * from review_attachment where attach_no = #{attachNo}")
	ReviewAttachment selectOneAttachment(int attachNo);

	@Delete("delete from review_attachment where attach_no = #{attachNo}")
	int deleteAttachment(int attachNo);

	int updateReview(Review review);
	
}
