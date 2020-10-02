package kr.pandorabox.aniwalk.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService{
	@Autowired
	private ManagerDAO managerDAO;
	
	public int managerLogin(String manager_id, String manage_pw) {
		System.out.println("service_manager_id: " + manager_id);
		System.out.println("service_manage_pw: " + manage_pw);
		
		int result_id = managerDAO.managerLoginId(manager_id);
		System.out.println("Service_result_id: " + result_id);
		
		if(result_id == 1) {
			int result_pw = managerDAO.managerLoginPw(manage_pw);
			System.out.println("result_pw: " + result_pw);
			
			if(result_pw == 1) {
				return 1;
			} else {
				return 2;
			}
		} else {
			return 2;
		}
		
	}
}
