package kr.pandorabox.aniwalk.manager;

import java.util.List;

import kr.pandorabox.aniwalk.member.JoinMemberDogImgDTO;

public interface ManagerDAO {
	public int managerLoginId(String manager_id);
	public String managerLoginPw(String manage_pw);
	public List<MemberDTO> memberList();
	public List<JoinMemberDogImgDTO> userInfo(String kakao_id);
}
