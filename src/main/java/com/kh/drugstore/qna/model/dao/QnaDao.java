package com.kh.drugstore.qna.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.kh.drugstore.qna.model.dto.Qna;

@Mapper
public interface QnaDao {

	//전체 qna 목록 조회
	@Select("select * from qna order by qna_id desc")
	public List<Qna> selectQnaList();
	
	//총 게시글 개수 
	@Select("select count(*) from qna")
	int getTotalContent();
	
	//qna 게시글 등록 - 그런데 비밀글이 가능한. 만약 제목, 내용이 없으면 에러. 
	@Insert("insert into qna values(#{qna_id}, default, default, #{writer}, default, default, #{content}, #{secret_password}, default")
	@SelectKey(statement= "select qna_id from dual", before = false, keyProperty = "qna_id", resultType = int.class)
	int insertQna(Qna qna);
	
	//덧글 등록(레벨 : 답글1 관리자, 대댓글2 사용자 / null 덧글, 대댓인 경우 참조댓글 no) 
	@Insert("insert into qna values(#{qna_id}, #{comment_ref}, default, #{writer}, default, default, #{content}, default, #{comment_level}")
	int insertQnaComment(int qnaId, Qna qna);

	//qna에서 내가 쓴 글 조회
	@Select("select q.*, (select * from where member where member_id = q.writer) my_qna from qna q order by writer")
	List<Qna> findQnaById(String writer);
}
