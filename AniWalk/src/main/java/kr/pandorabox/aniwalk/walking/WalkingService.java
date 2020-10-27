package kr.pandorabox.aniwalk.walking;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface WalkingService {
	public int recruitInsert(WalkingDTO walking);
	public List<WalkingDTO> recruitDog(String mem_nickname);
	public List<WalkingDTO> getRecruitList(String search);
	public List<WalkingDTO> recruitlist(String mem_nickname);
	public int insertWalkingData(WalkingDTO walkingDto);
	public List<WalkingDTO> getMissionList(String walking_id);
	public int recruitUpdate(WalkingDTO walking);
	public List<ApplyWalkingDTO> applyList(String walking_id);
	public int matching(Map<String, String> map);
	//오늘 산책 정보
	public List<WalkingDTO> todayWalking(Map<String,Object> map);
	public String wkId(String walker_id);
	//워커 산책 신청하기
	public int walkingRecruit(Map<String,String> map);
	//오너 전체 산책 일정
	public List<WalkingDTO> allWalking(String mem_nickname);
	
	public List<WalkingDTO> getWalkingList(String walker_id);
	//워커 모집글 중복 확인
	public int applyCheck(Map<String, String> map);
	public WalkingDTO getWalkingInfo(String walking_id);
	public int insertWalkingLocation(String walking_id, String walking_map_path);
	public String getWalkingLocation(String walking_id);
	public List<WalkingDTO> getSearchRecruitList(WalkingDTO walkingDto);
}
