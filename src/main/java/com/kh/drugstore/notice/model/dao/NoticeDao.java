package com.kh.drugstore.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.kh.drugstore.notice.model.dto.Notice;

@Mapper
public interface NoticeDao {

	@Select("select * from notice order by no desc")
	List<Notice> selectNoticeList(RowBounds rowBounds);

	@Insert("insert into notice values (seq_notice_no.nextval, #{writer}, #{title}, #{content}, default, #{next}, #{last}, #{nexttitle}, #{lasttitle})")
	int insertNotice(Notice notice);

	@Select("select * from notice where no = #{no}")
	Notice oneNotice(int no);

	@Update("update notice set title = #{title}, content = #{content} where no = #{no} ")
	int updateNotice(Notice notice);

	@Delete("delete from notice where no = #{no}")
	int deleteNotice(int no);

	@Select("select * from (select no, lead(no,1,9999) over(order by no) as next,\r\n"
			+ "lag(no,1,9999) over(order by no) as last,\r\n"
			+ "title, lead(title, 1, 9999) over(order by no) as nexttitle,\r\n"
			+ "lag(title,1,9999) over(order by no) as lasttitle\r\n"
			+ "from notice order by no desc) where no=#{no}")
	Notice movePage(int no);

	@Select("select count(*) from notice")
	int getTotalContent();
	
	


	
}
