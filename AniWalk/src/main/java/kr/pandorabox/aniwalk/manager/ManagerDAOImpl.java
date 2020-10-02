package kr.pandorabox.aniwalk.manager;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAOImpl implements ManagerDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int managerLoginId(String manager_id) {
		System.out.println("dao_manager_id: " + manager_id);
		
		int resultDAO = sqlSession.selectOne("kr.pandorabox.aniwalk.manager.idcheck", manager_id);
		System.out.println("resultDAO: " + resultDAO);
		return resultDAO;
	}
	
	@Override
	public int managerLoginPw(String manage_pw) {
		System.out.println("dao_manage_pw: " + manage_pw);
		
		return sqlSession.selectOne("kr.pandorabox.aniwalk.manager.pwcheck", manage_pw);
	}
}
