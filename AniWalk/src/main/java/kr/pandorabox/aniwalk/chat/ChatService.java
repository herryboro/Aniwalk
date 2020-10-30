package kr.pandorabox.aniwalk.chat;

import java.util.List;
import java.util.Map;

import kr.pandorabox.aniwalk.walking.WalkingDTO;

public interface ChatService {
	//워커 프로필(대화 리스트)
	public String getWalkerProfile(String walker_id);
	public String getWkId(String walker_id);
	//멤버 프로필
	public String getMemProfile(String mem_nickname);
	
	///워커///
	public List<ChatDTO> walkerChatList(Map<String,Object> walkerChatList);
	public List<ChatDTO> walkerChatFind(Map<String, Object> searchCondition);
	public List<ChatDTO> reservationList(Map<String,String> map);
	///오너///
	public void chatInsert(Map<String, Object> chat);
	public List<ChatDTO> chatFind(Map<String, Object> searchCondition);
	public List<ChatDTO> chatList(Map<String, Object> chatList);
	public List<WalkingDTO> nonMatchList(String mem_nickname);
	public int walkingUpdate(Map<String, String> map);
}
