package kr.pandorabox.aniwalk.manager;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.pandorabox.aniwalk.member.JoinMemberDogImgDTO;


@Repository
public class ManagerDAOImpl implements ManagerDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int managerLoginId(String manager_id) {
		
		int resultDAO = sqlSession.selectOne("kr.pandorabox.aniwalk.manager.idcheck", manager_id);
		return resultDAO;
	}
	
	@Override
	public String managerLoginPw(String manager_id) {	
		return sqlSession.selectOne("kr.pandorabox.aniwalk.manager.pwcheck", manager_id);
	}
	
	@Override
	public List<MemberDTO> memberList() {
		return sqlSession.selectList("kr.pandorabox.aniwalk.manager.memberlist");
	}
	
	@Override
	public List<JoinMemberDogImgDTO> userInfo(String kakao_id) {
		return sqlSession.selectList("kr.pandorabox.aniwalk.manager.userinfo", kakao_id);
	}
}
