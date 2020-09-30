package kr.pandorabox.aniwalk.member;

import java.util.ArrayList;

public interface MemberDAO {
	int joinCheck(int kakao_id);
	int joinMember(JoinMemberDogImgDTO joinMemberDogImgDTO);
	int joinDog(JoinMemberDogImgDTO joinMemberDogImgDTO);
	int fileInsert(ArrayList<String> filelist);
}
