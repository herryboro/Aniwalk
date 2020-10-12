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
	
	// 반려견 추가시 외래키dog_id 값을 얻기위한 메소드
//	@Override
//	public String getDog_id(String getForeign_Mem_id) {
//		return sqlSession.selectOne("kr.pandorabox.aniwalk.member.getDog_id", getForeign_Mem_id);
//	}
	
	
}
