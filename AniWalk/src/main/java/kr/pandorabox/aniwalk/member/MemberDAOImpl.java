package kr.pandorabox.aniwalk.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public String joinCheck(int kakao_id) {
		return sqlSession.selectOne("kr.pandorabox.aniwalk.member.check", kakao_id);
	}
	
	@Override
	public int joinMember(JoinMemberDogImgDTO joinMemberDogImgDTO) {
		return sqlSession.insert("kr.pandorabox.aniwalk.member.joinmember", joinMemberDogImgDTO);
	}
	
	@Override
	public int joinDog(JoinMemberDogImgDTO joinMemberDogImgDTO) {
		return sqlSession.insert("kr.pandorabox.aniwalk.member.joindog", joinMemberDogImgDTO);
	}

	@Override
	public int fileInsert(ArrayList<String> filelist) {
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("filelist",filelist);
		return sqlSession.insert("kr.pandorabox.aniwalk.member.fileinsert", paramMap);
	}
	
	@Override
	public List<JoinMemberDogImgDTO> myPage(String mem_nickname) {
		return sqlSession.selectList("kr.pandorabox.aniwalk.member.myPage", mem_nickname);
	}
	
	@Override
	public int addDog(JoinMemberDogImgDTO joinMemberDogImgDTO) {
		return sqlSession.insert("kr.pandorabox.aniwalk.member.addDog", joinMemberDogImgDTO);
	}
	
	@Override
	public int addfileInsert(ArrayList<String> filelist) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("filelist", filelist);
		return sqlSession.insert("kr.pandorabox.aniwalk.member.addDogImg", paramMap);
	}
	
	// 반려견 추가시 외래키mem_id 값을 얻기위한 메소드
	@Override
	public String getMem_id(String mem_nickname) {
		return sqlSession.selectOne("kr.pandorabox.aniwalk.member.getMem_id", mem_nickname);
	}
	
	// 회원정보 수정 페이지의 전화번호 띄우기
	@Override
	public String getPhone_num(String mem_nickname) {
		return sqlSession.selectOne("kr.pandorabox.aniwalk.member.getPhone_num", mem_nickname);
	}
	
	// 유저 닉네임 수정
	@Override
	public int updateUserInfo(JoinMemberDogImgDTO joinMemberDogImgDTO) {
		return sqlSession.update("kr.pandorabox.aniwalk.member.nickUpdate", joinMemberDogImgDTO);
	}
	
	// 유저 프로필 수정
	@Override
	public int updateUserProfile(List<String> list) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("filelist", list.get(1));
		paramMap.put("id", list.get(0));
		return sqlSession.insert("kr.pandorabox.aniwalk.member.profileUpdate", paramMap);
	}
	
	// 특정회원의 filename 가져오기
	@Override
	public String getProfile(String mem_nickname) {
		return sqlSession.selectOne("kr.pandorabox.aniwalk.member.getProfile", mem_nickname);
	}
	
	// ajax용 반려견 정보
	@Override
	public List<JoinMemberDogImgDTO> getDogInfo(Map<String, String> map) {
		System.out.println("map: " + map);
		return sqlSession.selectList("kr.pandorabox.aniwalk.member.getDogInfo", map);
	}
	
	// 개 정보 수정
	@Override
	public void modifyDogInfo(JoinMemberDogImgDTO JoinMemberDogImgDTO) {
		sqlSession.update("kr.pandorabox.aniwalk.member.modifyDogInfo", JoinMemberDogImgDTO);
	}
	
	// 개 프로필 수정
	@Override
	public void modifyDogProfile(String dog_id, ArrayList<String> filelist) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("dog_id", dog_id);
		map.put("dog_profile", filelist.get(0));
		sqlSession.update("kr.pandorabox.aniwalk.member.modifyDogProfile", map);
	}
	
	// 개 정보 삭제
	@Override
	public void delDog(String dog_id) {
		sqlSession.update("kr.pandorabox.aniwalk.member.delDog", dog_id);
	}
	
}
