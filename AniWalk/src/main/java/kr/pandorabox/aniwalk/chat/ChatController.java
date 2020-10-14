package kr.pandorabox.aniwalk.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	@Autowired
	ChatService service;
	//채팅리스트
	//talkList
	@RequestMapping("/owner/talk.do")
	public ModelAndView chatList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String mem_nickname = (String) req.getSession().getAttribute("mem_nickname");
		Map<String, Object> chatList = new HashMap<String, Object>();
		chatList.put("mem_nickname", mem_nickname);
		List<ChatDTO> chatDtos = service.chatList(chatList);
		List<ChatDTO> chatLists = new ArrayList<ChatDTO>(); //새롭게 만드는 list
		int chatIndex = 0;
		for(int i=0;i<chatDtos.size();++i) {
			if(i==0) {
				chatLists.add(chatIndex, chatDtos.get(i)) ;
				chatIndex += 1;
			}else {
				if(! (chatDtos.get(i).getWalker_id()).equals((chatDtos.get(i-1).getWalker_id())) ) {//새롭게 만든 list에 담기
					chatLists.add(chatIndex, chatDtos.get(i)) ;
					chatIndex += 1;
				}
			}
		}
		System.out.println("size"+chatLists.size());
		mav.addObject("chatLists", chatLists);
		mav.setViewName("owner/talkList");
		return mav;
	}
	
	//mongodb chat Find
	//채팅 content
	@RequestMapping("/owner/talkContent.do")
	public ModelAndView chatFind(HttpServletRequest req, String walker_id) {
		System.out.println("walker_id 들어오는지 확인====>"+walker_id);
		
		ModelAndView mav = new ModelAndView();
		
		String mem_nickname = (String) req.getSession().getAttribute("mem_nickname");
		Map<String, Object> searchCondition = new HashMap<String, Object>();
		searchCondition.put("mem_nickname", mem_nickname);
		//walker_id도 추가하기
		searchCondition.put("walker_id", walker_id);
		System.out.println(searchCondition.get("walker_id") +"find walker_id");
		System.out.println(searchCondition.get("mem_nickname")+"find mem_nickname");
		
		//등록 서비스 호출
		List<ChatDTO> chatDtos = service.chatFind(searchCondition);
		System.out.println("size : "+chatDtos.size());
		mav.addObject("walker_id", walker_id);
		mav.addObject("mem_nickname", mem_nickname);
		mav.addObject("chatDtos", chatDtos);
		mav.setViewName("owner/talkContent");
		return mav;
	}
	
	//mongodb에 insert
	//talkContent
	@RequestMapping(value="/owner/chatInsert.do", 
			method = RequestMethod.POST,
			produces = "application/json;charset=utf-8")
	public @ResponseBody Map<String,Object> chatInsert(@RequestBody Map<String,Object> chat){
		Map<String,Object> retVal = new HashMap<String, Object>();
		
		
		System.out.println("contents : "+chat.get("contents"));
		System.out.println("chat_date : "+chat.get("chat_date"));
		System.out.println("send_nickname : "+chat.get("send_nickname"));
		service.chatInsert(chat);
		
		return retVal;
	}
	
	
	
	
}