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
		System.out.println("daofilelist: " + filelist);
		Map<String,Object> paramMap = new HashMap<String, Object>();
		paramMap.put("filelist",filelist);
		return sqlSession.insert("kr.pandorabox.aniwalk.member.fileinsert", paramMap);
	}
	
	@Override
	public List<JoinMemberDogImgDTO> myPage(String mem_nickname) {
		return sqlSession.selectList("kr.pandorabox.aniwalk.member.myPage",mem_nickname);
	}
}
