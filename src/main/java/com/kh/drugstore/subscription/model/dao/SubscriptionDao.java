package com.kh.drugstore.subscription.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.drugstore.subscription.model.dto.Subscription;
import com.kh.drugstore.subscription.model.dto.SubscriptionProduct;

@Mapper
public interface SubscriptionDao {

	@Insert("insert into subscription values(seq_sub_no.nextval, #{memberId},#{startDate},null,#{sendDate},5000,5000,0,0)")
	int insertInfo(Subscription subscription);

	@Select("select * from subscription where member_id = #{memberId}")
	Subscription getSubscription(String memberId);

	@Insert("insert into subscription_product values(#{subNo}, #{pcode}, 1)")
	int insertIntoProduct(SubscriptionProduct subscription);

}
