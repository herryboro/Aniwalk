package kr.pandorabox.aniwalk.member;

import java.util.ArrayList;
import java.util.List;

public interface MemberDAO {
	String joinCheck(int kakao_id);
	int joinMember(JoinMemberDogImgDTO joinMemberDogImgDTO);
	int joinDog(JoinMemberDogImgDTO joinMemberDogImgDTO);
	int fileInsert(ArrayList<String> filelist);
	
	//owner my page
	public List<JoinMemberDogImgDTO> myPage(String mem_nickname);
}
