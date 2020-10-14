package kr.pandorabox.aniwalk.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public String index(String manager_id, String manager_pw, HttpServletRequest req) {
		int result = managerService.managerLogin(manager_id, manager_pw);

		if(result != 1) {
			return "redirect:/manager/index.do";		// managerIndex.jsp
		} else {
			req.getSession().setAttribute("manager_id", manager_id);
			return "redirect:/manager/user.do";
		}
		
	}
	
	@RequestMapping("manager/user.do")
	public ModelAndView memberList(HttpServletRequest req) {
		
		if(req.getSession().getAttribute("manager_id") == null) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/manager/index.do");
			return mav;
		}
		
		String manager_id = (String)req.getSession().getAttribute("manager_id");		
		
		if(manager_id.equals("super") && manager_id != null) {	
			ModelAndView mav = new ModelAndView();
			List<MemberDTO> memlist = managerService.memberList();
			System.out.println(memlist.get(0).getMem_nickname());
			mav.addObject("memlist", memlist);
			mav.setViewName("manager/user");	// manageUser.jsp
			return mav;
		} else {
			ModelAndView mav = new ModelAndView();
			System.out.println("뮝미");
			mav.setViewName("manager/index");		// manager/managerIndex.jsp
			return mav;
		}
		
	}
	
	@RequestMapping("manager/userInfo.do")
	public ModelAndView userInfo(String kakao_id) {
		System.out.println("controller kakao_id: " + kakao_id);
		
		ModelAndView mav = new ModelAndView();
		List<JoinMemberDogImgDTO> userList = managerService.userInfo(kakao_id);		
		
		mav.addObject("userList", userList);
		mav.setViewName("manager/userInfo");	// manageUserInfo.jsp
		return mav;
	}
	
	@RequestMapping("manager/manageMatching.do")
	public ModelAndView manageMatching() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manager/manageMatching");
		return mav;
	}
	
	@RequestMapping("manager/managePoint.do")
	public ModelAndView managePonint() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manager/managePoint");
		return mav;
	}
}
