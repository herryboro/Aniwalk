package kr.pandorabox.aniwalk.walking;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WalkingDAOImpl implements WalkingDAO{
	@Autowired
	SqlSession session;
	
	//산책 미션 가져오기
	@Override
	public List<WalkingDTO> getMissionList(String walking_id) {
		return session.selectList("kr.pandorabox.aniwalk.walking.getMissionList", walking_id);
	}
	
	//산책 미션 저장
	@Override
	public int insertWalkingMission(WalkingDTO walkingDto) {
		return session.insert("kr.pandorabox.aniwalk.walking.insertWalkingMission", walkingDto);
	}
	
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
	@Override
	public int recruitUpdate(WalkingDTO walking) {
		return session.update("kr.pandorabox.aniwalk.walking.recruitUpdate",walking);
	}

	//신청자 리스트
	@Override
	public List<ApplyWalkingDTO> applyList(String walking_id) {
		return session.selectList("kr.pandorabox.aniwalk.walking.applyList",walking_id);
	}
	//매칭
	@Override
	public int matching(Map<String, String> map) {
		return session.update("kr.pandorabox.aniwalk.walking.matching",map);
	}
	
	
	
}
