package com.kh.drugstore.auth.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import lombok.NonNull;

@Mapper
public interface AuthDao {

	@Insert("insert into authority values(#{memberId},'ROLE_USER')")
	int insertAuth(@NonNull String memberId);

}
