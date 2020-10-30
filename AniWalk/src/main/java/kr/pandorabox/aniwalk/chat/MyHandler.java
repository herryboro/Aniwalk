package kr.pandorabox.aniwalk.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.util.JSONPObject;

@Component
public class MyHandler extends TextWebSocketHandler{
	//연결 요청 처리 
        //메시지 받기, 메시지 전달

	//WebSocketSession 클라이언트 당 하나씩 생성, 해당 클라이언트와 연결된 웹소켓을 이용할 수 있는 객체  
	//해당 객체를 통해 메시지를 주고 받음

	private List<WebSocketSession> users;
	private Map<String, Object> userMap;
	
	public MyHandler() {
		users= new ArrayList<WebSocketSession>();
		userMap = new HashMap<String,Object>();
	}

	@Override
        //소켓 연결 생성 후 실행 메서드
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("TextWebSocketHandler : 연결 생성!"+session);
		users.add(session);
	}

	@Override
        //메시지 수신 후 실행 메서드
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("TextWebSocketHandler : 메시지 수신!");
		
		JSONObject object = new JSONObject(message.getPayload());
		String type = object.getString("type");
		
		
		if(type != null && type.equals("register") ) {
			
			//등록 요청 메시지
			String user = object.getString("userid");
			
			//아이디랑 Session이랑 매핑 >>> Map
			userMap.put(user, session);
		}else if(type.equals("chat")){
			
			//채팅 메시지 : 상대방 아이디를 포함해서 메시지를 보낼것이기 때문에
			//Map에서 상대방 아이디에 해당하는 WebSocket 꺼내와서 메시지 전송
			//String user = object.getString("userid");
			String target = object.getString("target");
			
		
			WebSocketSession ws = (WebSocketSession)userMap.get(target);
			
			String msg = type+"|"+object.getString("message")+ "|" + target;
			
			if(ws !=null ) {
				ws.sendMessage(new TextMessage(msg));
			}
		}else if(type.equals("reservation")) {
			
			String target = object.getString("target");
			WebSocketSession ws = (WebSocketSession)userMap.get(target);
			String walk_date = object.getString("walk_date");
			String walk_start_time = object.getString("walk_start_time");
			String walk_end_time = object.getString("walk_end_time");
			String recruit_location = object.getString("recruit_location");
			String dog_name = object.getString("dog_name");
			String recruit_notices = object.getString("recruit_notices");
			String dog_type = object.getString("dog_type");
			String chat_date = object.getString("chat_date");
			//수정하기 msg
			String msg = type+"|"+target+"|"+walk_date+"|"+walk_start_time+"|"+walk_end_time+"|"+recruit_location+"|"+dog_name+"|"+recruit_notices+"|"+dog_type+"|"+chat_date;
			System.out.println("msg::::"+msg);
			if(ws !=null ) {
				ws.sendMessage(new TextMessage(msg));
			}
		}else if(type.equals("accept")) {
			String target = object.getString("target");
			WebSocketSession ws = (WebSocketSession)userMap.get(target);
			
			String walking_id =object.getString("walking_id");
			String chat_date =object.getString("chat_date");
			
			String msg = type+"|"+target+"|"+chat_date+"|"+walking_id; 
			if(ws !=null ) {
				ws.sendMessage(new TextMessage(msg));
			}
		}else if(type.equals("reject")) {
			String target = object.getString("target");
			WebSocketSession ws = (WebSocketSession)userMap.get(target);
			
			String chat_date =object.getString("chat_date");
			
			String msg = type+"|"+target+"|"+chat_date ;
			if(ws !=null ) {
				ws.sendMessage(new TextMessage(msg));
			}
		}
	}

	@Override
        //연결 해제 후 실행 메서드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("TextWebSocketHandler : 연결 종료!");
		users.remove(session);
	}	
}