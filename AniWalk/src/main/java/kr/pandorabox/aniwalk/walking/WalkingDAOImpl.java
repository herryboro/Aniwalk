package kr.pandorabox.aniwalk.walking;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WalkingDAOImpl implements WalkingDAO{
	@Autowired
	SqlSession session;
	
	//모집글 등록
	@Override
	public int recruitInsert(WalkingDTO walking) {
		return session.insert("kr.pandorabox.aniwalk.walking.recruitInsert",walking);
	}
	
	//모집글 올릴 때 개 선택
	@Override
	public List<WalkingDTO> recruitDog(String mem_nickname) {
		return session.selectList("kr.pandorabox.aniwalk.walking.recruitDog",mem_nickname);
	}
	
	//모집글 리스트
   @Override
   public List<WalkingDTO> getRecruitList() {
      return session.selectList("kr.pandorabox.aniwalk.walking.getRecruitList");
   }
	
	//내가 쓴 모집글 리스트(날짜별)
	@Override
	public List<WalkingDTO> recruitlist(String mem_nickname) {
		return session.selectList("kr.pandorabox.aniwalk.walking.recruitlist",mem_nickname);
	}
	
	
}
