package kr.pandorabox.aniwalk.chat;

import java.util.List;
import java.util.Map;

import kr.pandorabox.aniwalk.walking.WalkingDTO;

public interface ChatDAO {
	//워커 프로필 사진
	public String getWalkerProfile(String walker_id);
	
	///워커///
	public List<ChatDTO> walkerChatList(Map<String,Object> walkerChatList);
	public List<ChatDTO> walkerChatFind(Map<String, Object> searchCondition);
	
	///오너///
	public void chatInsert(Map<String, Object> chat);
	public List<ChatDTO> chatFind(Map<String, Object> searchCondition);
	public List<ChatDTO> chatList(Map<String, Object> chatList);
	public List<WalkingDTO> nonMatchList(String mem_nickname);
}
