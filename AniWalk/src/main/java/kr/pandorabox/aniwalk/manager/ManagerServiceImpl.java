package kr.pandorabox.aniwalk.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pandorabox.aniwalk.member.JoinMemberDogImgDTO;

@Service
public class ManagerServiceImpl implements ManagerService{
	@Autowired
	private ManagerDAO managerDAO;
	
	public int managerLogin(String manager_id, String manage_pw) {
		
		int result = managerDAO.managerLoginId(manager_id);
		
		if(result == 1) {
			String pw = managerDAO.managerLoginPw(manager_id);
			if(manage_pw.equals(pw)) {
				return 2;
			} else {
				return 0;
			}
		} else {
			return -1;
		}
	}
	
	@Override
	public List<MemberDTO> memberList() {
		List<MemberDTO> memlist = managerDAO.memberList();
		return memlist;
	}
	
	@Override
	public List<JoinMemberDogImgDTO> userInfo(String kakao_id) {
		List<JoinMemberDogImgDTO> userlist = managerDAO.userInfo(kakao_id);
		System.out.println(userlist.get(0).getMem_nickname());
		return userlist;
	}
}
