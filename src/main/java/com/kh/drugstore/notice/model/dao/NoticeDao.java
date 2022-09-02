package com.kh.drugstore.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.drugstore.notice.model.dto.Notice;

@Mapper
public interface NoticeDao {

	@Select("select * from notice order by no desc")
	List<Notice> selectNoticeList();

	@Insert("insert into notice values (seq_notice_no.nextval, #{writer}, #{title}, #{content}, default)")
	int insertNotice(Notice notice);

	@Select("select * from notice where no = #{no}")
	Notice oneNotice(int no);

	@Update("update notice set title = #{title}, content = #{content} where no = #{no} ")
	int updateNotice(Notice notice);

	@Delete("delete from notice where no = #{no}")
	int deleteNotice(int no);

	
}
