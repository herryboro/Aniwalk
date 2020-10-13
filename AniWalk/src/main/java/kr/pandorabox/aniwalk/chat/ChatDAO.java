package kr.pandorabox.aniwalk.chat;

import java.util.List;
import java.util.Map;

public interface ChatDAO {
	public void chatInsert(Map<String, Object> chat);
	public List<ChatDTO> chatFind(Map<String, Object> searchCondition);
	public List<ChatDTO> chatList(Map<String, Object> chatList);
}
