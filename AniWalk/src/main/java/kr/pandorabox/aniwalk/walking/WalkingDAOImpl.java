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
	
	// 펫 프렌즈 페이지 - 산책 현황 리스트
	@Override
	public List<WalkingDTO> getAllWalkingList(String walker_id) {
		return session.selectList("kr.pandorabox.aniwalk.walking.getAllWalkingList", walker_id);
	}
	
	//모집글 상세검색
	@Override
	public List<WalkingDTO> getSearchRecruitList(WalkingDTO walkingDto) {
		return session.selectList("kr.pandorabox.aniwalk.walking.getSearchRecruitList", walkingDto);
	}
	
	//산책 path 불러오기
	@Override
	public List<WalkingDTO> getWalkingLocation(String walking_id) {
		return session.selectList("kr.pandorabox.aniwalk.walking.getWalkingLocation", walking_id);
	}
	
	//산책 path
	@Override
	public int insertWalkingLocation(WalkingDTO walkingDto) {
		return session.insert("kr.pandorabox.aniwalk.walking.insertWalkingLocation", walkingDto);
	}
	
	
	//owner 산책정보
	@Override
	public WalkingDTO getWalkingInfo(String walking_id) {
		return session.selectOne("kr.pandorabox.aniwalk.walking.getWalkingInfo", walking_id);
	}
	
	//산책시간 등록
	@Override
	public int updateWalkingTime(Map<String, String> map) {
		return session.update("kr.pandorabox.aniwalk.walking.updateWalkingTime", map);
	}
	
	//프렌즈 산책 리스트
	@Override
	public List<WalkingDTO> getWalkingList(String walker_id) {
		return session.selectList("kr.pandorabox.aniwalk.walking.getWalkingList", walker_id);
	}
	
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
   public List<WalkingDTO> getRecruitList(String search) {
      return session.selectList("kr.pandorabox.aniwalk.walking.getRecruitList", search);
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
	//오늘 산책정보
	@Override
	public List<WalkingDTO> todayWalking(Map<String, Object> map) {
		return session.selectList("kr.pandorabox.aniwalk.walking.todayWalking",map);
	}
	//워커 인덱스 가져오기
	@Override
	public String wkId(String walker_id) {
		return session.selectOne("kr.pandorabox.aniwalk.walking.wkId",walker_id);
	}
	//워커 산책 신청
	@Override
	public int walkingRecruit(Map<String, String> map) {
		return session.insert("kr.pandorabox.aniwalk.walking.walkingRecruit",map);
	}
	//오너 전체 산책 일정
	@Override
	public List<WalkingDTO> allWalking(String mem_nickname) {
		return session.selectList("kr.pandorabox.aniwalk.walking.allWalking",mem_nickname);
	}
	//워커 모집글 중복 신청 확인
	@Override
	public int applyCheck(Map<String, String> map) {
		return session.selectOne("kr.pandorabox.aniwalk.walking.applyCheck",map);
	}
	
}
