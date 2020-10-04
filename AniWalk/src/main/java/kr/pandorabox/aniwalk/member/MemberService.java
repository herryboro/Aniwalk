package kr.pandorabox.aniwalk.member;

import java.util.ArrayList;
import java.util.List;

public interface MemberService {
	String joinCheck (int kakao_id);
	int joinMember(JoinMemberDogImgDTO joinMemberDogImgDTO, ArrayList<String> filelist);
	
	public List<JoinMemberDogImgDTO> myPage(String mem_nickname);
	 
}
