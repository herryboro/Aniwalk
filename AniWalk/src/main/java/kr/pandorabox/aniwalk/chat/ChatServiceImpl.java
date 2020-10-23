package kr.pandorabox.aniwalk.chat;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	ChatDAO dao;

	////////워커///////
	
	@Override
	public List<ChatDTO> walkerChatList(Map<String, Object> walkerChatList) {
		return dao.walkerChatList(walkerChatList);
	}
	@Override
	public List<ChatDTO> walkerChatFind(Map<String, Object> searchCondition) {
		return dao.walkerChatFind(searchCondition);
	}
	
	////////오너///////
	@Override
	public void chatInsert(Map<String, Object> chat) {
		dao.chatInsert(chat);
	}
	@Override
	public List<ChatDTO> chatFind(Map<String, Object> searchCondition) {
		return dao.chatFind(searchCondition);
	}
	@Override
	public List<ChatDTO> chatList(Map<String, Object> chatList) {
		return dao.chatList(chatList);
	}
}
