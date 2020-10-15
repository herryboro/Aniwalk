package kr.pandorabox.aniwalk.walking;

import java.util.List;
import java.util.Map;

public interface WalkingDAO {
	//모집글 등록
	public int recruitInsert(WalkingDTO walking);
	
	//모집글 올릴 때 개 이미지 
	public List<WalkingDTO> recruitDog(String mem_nickname);

	public List<WalkingDTO> getRecruitList();
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
}
