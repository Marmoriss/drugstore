package com.kh.drugstore.chat.model.service;

import java.util.List;

import com.kh.drugstore.chat.model.dto.ChatLog;
import com.kh.drugstore.chat.model.dto.ChatMember;

import lombok.NonNull;


public interface ChatService {

	ChatMember findChatMemberByMemberId(String memberId);

	void insertChatMembers(List<ChatMember> chatMembers);

	int insertChatLog(ChatLog chatLog);

	List<ChatLog> findChatLogByChatroomId(String chatroomId);

	List<ChatLog> findRecentChatLogs();


	
}
