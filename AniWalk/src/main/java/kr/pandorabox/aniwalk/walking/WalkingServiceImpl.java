package kr.pandorabox.aniwalk.walking;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.pandorabox.aniwalk.FileUploadLogic;

@Service
public class WalkingServiceImpl implements WalkingService{
	@Autowired
	private WalkingDAO walkingDao;
	@Autowired
	private FileUploadLogic upload;
	
	// 펫 프렌즈 페이지 - 산책 현황 리스트
	@Override
	public List<WalkingDTO> getAllWalkingList(String walker_id) {
		return walkingDao.getAllWalkingList(walker_id);
	}
	
	// 모집글 상세검색
	@Override
	public List<WalkingDTO> getSearchRecruitList(WalkingDTO walkingDto) {
		return walkingDao.getSearchRecruitList(walkingDto);
	}	
	
	// 산책 path 불러오기
	@Override
	public List<WalkingDTO> getWalkingLocation(String walking_id) {
		return walkingDao.getWalkingLocation(walking_id);
	}
	
	// 산책 path
	@Override
	public int insertWalkingLocation(WalkingDTO walkingDto) {
		return walkingDao.insertWalkingLocation(walkingDto);
	}
	
	// owner 산책 정보
	@Override
	public WalkingDTO getWalkingInfo(String walking_id) {
		return walkingDao.getWalkingInfo(walking_id);
	}
	
	
	// 프렌즈 현재 예약 중인 산책 리스트
	@Override
	public List<WalkingDTO> getWalkingList(String walker_id) {
		return walkingDao.getWalkingList(walker_id);
	}
	
	// 산책 미션 리스트
	@Override
	public List<WalkingDTO> getMissionList(String walking_id) {
		List<WalkingDTO> list = walkingDao.getMissionList(walking_id);
		return list;
	}
	
	// 산책 미션 등록
	@Override
	public int insertWalkingData(WalkingDTO walkingDto) {
		MultipartFile[] walking = walkingDto.getFiles();
		String mission_img = "";
		String path = "/aniwalk/walking";
		for(int i=0; i<walking.length; i++) {
			String fileName = walking[i].getOriginalFilename();
			if(fileName.length()!=0) {
				String new_file = upload.upload(walking[i], path, "start" + fileName);
				mission_img = mission_img + new_file + "/";
			}
		}
		walkingDto.setMission_img(mission_img);
		int result = walkingDao.insertWalkingMission(walkingDto);
		String mission_contents = walkingDto.getMission_contents();
		String walking_id = walkingDto.getWalking_id();
		if(mission_contents.equals("start") || mission_contents.equals("end")) {
			Map<String, String> map = new HashMap<>();
			map.put("mission_contents", mission_contents);
			map.put("walking_id", walking_id);
			result = walkingDao.updateWalkingTime(map);
		}
		return result;
	}
	
	
	@Override
	public List<WalkingDTO> recruitDog(String mem_nickname) {
		return walkingDao.recruitDog(mem_nickname);
	}
	
	@Override
	public List<WalkingDTO> getRecruitList(String search) {
		return walkingDao.getRecruitList(search);
	}
	@Override
	public List<WalkingDTO> recruitlist(String mem_nickname) {
		return walkingDao.recruitlist(mem_nickname);
	}
	
	@Override
	public List<ApplyWalkingDTO> applyList(String walking_id) {
		return walkingDao.applyList(walking_id);
	}
	@Override
	public int matching(Map<String, String> map) {
		return walkingDao.matching(map);
	}	
	//오늘 산책 정보
	@Override
	public List<WalkingDTO> todayWalking(Map<String, Object> map) {
		return walkingDao.todayWalking(map);
	}
	@Override
	public String wkId(String walker_id) {
		return walkingDao.wkId(walker_id);
	}
	@Override
	public int walkingRecruit(Map<String, String> map) {
		return walkingDao.walkingRecruit(map);
	}
	@Override
	public List<WalkingDTO> allWalking(String mem_nickname) {
		return walkingDao.allWalking(mem_nickname);
	}
	@Override
	public int applyCheck(Map<String, String> map) {
		return walkingDao.applyCheck(map);
	}
	//오너 모집글 작성 시 insert, update
	@Override
	public int recruitInsertUpdate(WalkingDTO walking) {
		int result = 0; //전체 결과
		int walkingResult = 0; //walking 테이블에 insert 결과
		int memberResult = 0; //member 테이블 update 결과
		walkingResult = walkingDao.recruitInsert(walking);
		memberResult = walkingDao.recruitUpdate(walking);
		if(walkingResult>=1 & memberResult>=1) {
			result = 1;
		}
		return result;
	}
}
