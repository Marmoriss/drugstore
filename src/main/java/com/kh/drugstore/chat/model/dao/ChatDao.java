package com.kh.drugstore.chat.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.kh.drugstore.chat.model.dto.ChatLog;
import com.kh.drugstore.chat.model.dto.ChatMember;

import lombok.NonNull;


public interface ChatDao {
	
	@Select("select * from chat_member where member_id = #{memberId}")
	ChatMember findChatMemberByMemberId(String memberId);

	@Insert("insert into chat_member values (#{chatroomId}, #{memberId}, 0, default, default)")
	int insertChatMember(ChatMember chatMember);

	@Insert("insert into chat_log values(seq_chat_log_no.nextval, #{chatroomId}, #{memberId}, #{msg}, #{time})")
	int insertChatLog(ChatLog chatLog);

	
	@Select("select * from chat_log where chatroom_id = #{chatroomId} order by no")
	List<ChatLog> findChatLogByChatroomId(String chatroomId);

	@Select(" select \r\n"
			+ "    no, \r\n"
			+ "    chatroom_id,\r\n"
			+ "    (select member_id from chat_member where chatroom_id = cl.chatroom_id and member_id != 'admin') member_id, \r\n"
			+ "    msg,\r\n"
			+ "    time\r\n"
			+ " from(\r\n"
			+ "     select \r\n"
			+ "        cl.*,\r\n"
			+ "        row_number() over(partition by chatroom_id order by no desc) rnum\r\n"
			+ "     from\r\n"
			+ "        chat_log cl) cl\r\n"
			+ "where\r\n"
			+ "    rnum = 1\r\n"
			+ "order by\r\n"
			+ "    time desc")
	List<ChatLog> findRecentChatLogs();
	

}
