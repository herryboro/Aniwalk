package kr.pandorabox.aniwalk.member;

import java.util.ArrayList;
import java.util.List;

public interface MemberService {
	String joinCheck (int kakao_id);
	int joinMember(JoinMemberDogImgDTO joinMemberDogImgDTO, ArrayList<String> filelist);
	public List<JoinMemberDogImgDTO> myPage(String mem_nickname);
	int addDog(JoinMemberDogImgDTO joinMemberDogImgDTO, ArrayList<String> filelist);
	public String getMem_id(String mem_nickname);
	public String getDog_id(String getForeign_Mem_id);
	
	
	 
}
