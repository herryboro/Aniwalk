package kr.pandorabox.aniwalk.walking;

import java.util.List;
import java.util.Map;

public interface WalkingDAO {
	//모집글 등록
	public int recruitInsert(WalkingDTO walking);
	
	//모집글 올릴 때 개 이미지 
	public List<WalkingDTO> recruitDog(String mem_nickname);

	public List<WalkingDTO> getRecruitList(String search);
	//내가 작성한 모집글 리스트(날짜별)
	public List<WalkingDTO> recruitlist(String mem_nickname);

	public int insertWalkingMission(WalkingDTO walkingDto);

	public List<WalkingDTO> getMissionList(String walking_id);
	//모집글 insert하면 point update
	public int recruitUpdate(WalkingDTO walking);
	//신청자 리스트
	public List<ApplyWalkingDTO> applyList(String walking_id);
	//매칭
	public int matching(Map<String, String> map);
	//오늘 산책정보
	public List<WalkingDTO> todayWalking(Map<String,Object> map);
	//워커 인덱스 가져오기
	public String wkId(String walker_id);
	//워커 산책 신청하기
	public int walkingRecruit(Map<String,String> map);
	//오너 전체 산책 일정
	public List<WalkingDTO> allWalking(String mem_nickname);
	
	public List<WalkingDTO> getWalkingList(String walker_id);
	//워커 모집글 중복 확인
	public int applyCheck(Map<String, String> map);

	public int updateWalkingTime(Map<String, String> map);

	public WalkingDTO getWalkingInfo(String walking_id);

	public int insertWalkingLocation(WalkingDTO walkingDto);

	public List<WalkingDTO> getWalkingLocation(String walking_id);

	public List<WalkingDTO> getSearchRecruitList(WalkingDTO walkingDto);

	public List<WalkingDTO> getAllWalkingList(String walker_id);
}
