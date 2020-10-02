package kr.pandorabox.aniwalk.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
			return "manager/user";
		}
		
	}
}
