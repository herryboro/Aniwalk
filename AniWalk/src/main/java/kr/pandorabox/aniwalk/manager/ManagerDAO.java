package kr.pandorabox.aniwalk.manager;

import java.util.List;

import kr.pandorabox.aniwalk.member.JoinMemberDogImgDTO;
import kr.pandorabox.aniwalk.walker.WalkerDTO;

public interface ManagerDAO {
	public int managerLoginId(String manager_id);
	public int managerLoginPw(String manage_pw);
	public List<MemberDTO> memberList();
	public List<WalkerDTO> walkerList();
	public List<JoinMemberDogImgDTO> userInfo(String kakao_id);
}
