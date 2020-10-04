package kr.pandorabox.aniwalk.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public String joinCheck(int kakao_id) {			
		return memberDAO.joinCheck(kakao_id);
	}
	
	@Override
	public int joinMember(JoinMemberDogImgDTO joinMemberDogImgDTO, ArrayList<String> filelist) {
		int result1 = memberDAO.joinMember(joinMemberDogImgDTO);
		int result2 = memberDAO.joinDog(joinMemberDogImgDTO);
		int result = 0;
		
		if(filelist.size() != 0) {
			int success = memberDAO.fileInsert(filelist);
			System.out.println("success: " + success);
			if(result1 >= 1 && result2 >= 1 && success >= 1) {
				result = 1;
			}
		}	
		return result;
	}
	
	@Override
	public List<JoinMemberDogImgDTO> myPage(String mem_nickname) {
		return memberDAO.myPage(mem_nickname);
	}
}
