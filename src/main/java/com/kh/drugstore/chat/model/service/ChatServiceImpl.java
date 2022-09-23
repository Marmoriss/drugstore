package com.kh.drugstore.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.drugstore.chat.model.dao.ChatDao;
import com.kh.drugstore.chat.model.dto.ChatLog;
import com.kh.drugstore.chat.model.dto.ChatMember;

import lombok.NonNull;

@Transactional(rollbackFor = Exception.class)
@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatDao chatDao;
	
	@Override
	public ChatMember findChatMemberByMemberId(String memberId) {
		return chatDao.findChatMemberByMemberId(memberId);
	}
	
	/**
	 * 두명의 회원 등록에 대해 트랜잭션처리 
	 */
	@Override
	public void insertChatMembers(List<ChatMember> chatMembers) {
		for(ChatMember chatMember : chatMembers) {
			int result = chatDao.insertChatMember(chatMember);
		}
	}
	
	@Override
	public int insertChatLog(ChatLog chatLog) {
		return chatDao.insertChatLog(chatLog);
	}
	
	@Override
	public List<ChatLog> findChatLogByChatroomId(String chatroomId) {
		return chatDao.findChatLogByChatroomId(chatroomId);
	}
	
	@Override
	public List<ChatLog> findRecentChatLogs() {
		return chatDao.findRecentChatLogs();
	}
}
