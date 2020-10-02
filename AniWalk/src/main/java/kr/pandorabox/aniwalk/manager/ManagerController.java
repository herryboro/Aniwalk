package kr.pandorabox.aniwalk.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.pandorabox.aniwalk.walker.WalkerDTO;

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
	
	@RequestMapping("manager/walkerlist.do")
	public ModelAndView walkerList() {
		ModelAndView mav = new ModelAndView();
		
		List<WalkerDTO> walkerList = managerService.walkerList();
		mav.addObject("applierList", walkerList);
		mav.setViewName("manager/walker");
		return mav;
	}
}
