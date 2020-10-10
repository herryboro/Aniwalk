package kr.pandorabox.aniwalk.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.pandorabox.aniwalk.member.JoinMemberDogImgDTO;

@Controller
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("manager/indexPro.do")
	public String index(String manager_id, String manage_pw) {
		System.out.println("manager_id: " + manager_id);
		System.out.println("manager_id: " + manage_pw);
		
		int result = managerService.managerLogin(manager_id, manage_pw);
		System.out.println("result: " + result);
		if(result != 1) {
			return "manager/index";
		} else {
			return "redirect:/manager/user.do";
		}
		
	}
	
	@RequestMapping("manager/user.do")
	public ModelAndView memberList() {
		ModelAndView mav = new ModelAndView();
		
		List<MemberDTO> memlist = managerService.memberList();
		mav.addObject("memlist", memlist);
		mav.setViewName("manager/user");
		return mav;
	}
	
	@RequestMapping("manager/userInfo.do")
	public ModelAndView userInfo(String kakao_id) {
		System.out.println("controller kakao_id: " + kakao_id);
		
		ModelAndView mav = new ModelAndView();
		List<JoinMemberDogImgDTO> userList = managerService.userInfo(kakao_id);
		
		System.out.println("닉네임: " + userList.get(0).getMem_nickname());
		System.out.println(userList.get(0).getDog_name());
		System.out.println("userList객체: " + userList);
		
		mav.addObject("userList", userList);
		mav.setViewName("manager/userInfo");
		return mav;
	}
}
