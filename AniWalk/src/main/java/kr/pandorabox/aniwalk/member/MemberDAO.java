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
	public int addDog(JoinMemberDogImgDTO joinMemberDogImgDTO);
	public int addfileInsert(ArrayList<String> filelist);
	public String getMem_id(String mem_nickname);
	public String getDog_id(String getForeign_Mem_id);
	
}
