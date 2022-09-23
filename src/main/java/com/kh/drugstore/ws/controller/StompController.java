package com.kh.drugstore.ws.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;

import com.kh.drugstore.chat.model.dto.ChatLog;
import com.kh.drugstore.chat.model.service.ChatService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StompController {
		
		@Autowired
		ChatService chatService;
	
		@MessageMapping("/a")
		@SendTo("/app/a")
		public String simpleMessage(String message) {
			log.debug("message = {}", message);
			return message;
		}
		
		
		@MessageMapping("/chat/{chatroomId}")
		@SendTo({"/app/chat/{chatroomId}", "/app/admin/chat/chatList"})
		public ChatLog chatLog(@RequestBody ChatLog chatLog) {
			log.debug("chatLog = {}", chatLog);
			int result = chatService.insertChatLog(chatLog);
			return chatLog;
		}
		

}





	
