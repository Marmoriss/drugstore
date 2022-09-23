package com.kh.drugstore.chat.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.drugstore.chat.model.dto.ChatLog;
import com.kh.drugstore.chat.model.dto.ChatMember;
import com.kh.drugstore.chat.model.service.ChatService;
import com.kh.drugstore.member.model.dto.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	ChatService chatService;
	
	@GetMapping("/chat.do")
	public void chat(Authentication authentication, Model model) {
		// 채팅방유무 조회
		Member member = (Member) authentication.getPrincipal();
		ChatMember chatMember = chatService.findChatMemberByMemberId(member.getMemberId());
		log.debug("chatMember = {}", chatMember);
		
		String chatroomId = null;
		if(chatMember == null) {
			// 처음 입장한 경우
			chatroomId = generateChatroomId();
			log.debug("chatroomId = {}", chatroomId);
			
			// chatmember insert
			List<ChatMember> chatMembers = Arrays.asList(
					new ChatMember(chatroomId, member.getMemberId()),
					new ChatMember(chatroomId, "admin"));
			chatService.insertChatMembers(chatMembers);	
			
		}
		else {
			// 재입장한 경우 (전 채팅 내역 불러오기)
			chatroomId = chatMember.getChatroomId();
			List<ChatLog> chatLogs = chatService.findChatLogByChatroomId(chatroomId);
			model.addAttribute("chatLogs", chatLogs);
			log.debug("chatLogs = {}", chatLogs);
		}
		
		model.addAttribute("chatroomId", chatroomId);
		
	}

	/**
	 * 대문자/소문자/숫자 조합
	 * @return
	 */
	private String generateChatroomId() {
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		final int len = 8;
		for(int i = 0; i < len; i++) {			
			if(random.nextBoolean()) {
				// 영문자
				if(random.nextBoolean()) {
					// 대문자
					sb.append((char) (random.nextInt(26) + 'A'));
				}
				else {
					// 소문자
					sb.append((char) (random.nextInt(26) + 'a'));
				}
			}
			else {
				// 숫자
				sb.append(random.nextInt(10));
			}
		}
		return sb.toString();
	}
}

