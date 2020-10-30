package kr.pandorabox.aniwalk.chat;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pandorabox.aniwalk.walking.WalkingDTO;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	ChatDAO dao;
	
	@Override
	public String getWalkerProfile(String walker_id) {
		return dao.getWalkerProfile(walker_id);
	}
	@Override
	public String getMemProfile(String mem_nickname) {
		return dao.getMemProfile(mem_nickname);
	}
	@Override
	public String getWkId(String walker_id) {
		return dao.getWkId(walker_id);
	}

	////////워커///////
	
	@Override
	public List<ChatDTO> walkerChatList(Map<String, Object> walkerChatList) {
		return dao.walkerChatList(walkerChatList);
	}
	@Override
	public List<ChatDTO> walkerChatFind(Map<String, Object> searchCondition) {
		return dao.walkerChatFind(searchCondition);
	}
	@Override
	public List<ChatDTO> reservationList(Map<String, String> map) {
		return dao.reservationList(map);
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
	@Override
	public List<WalkingDTO> nonMatchList(String mem_nickname) {
		return dao.nonMatchList(mem_nickname);
	}
	@Override
	public int walkingUpdate(Map<String, String> map) {
		return dao.walkingUpdate(map);
	}
}
