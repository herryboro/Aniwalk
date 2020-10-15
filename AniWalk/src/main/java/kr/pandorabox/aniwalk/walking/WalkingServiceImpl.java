package kr.pandorabox.aniwalk.walking;

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
	
	// 산책 미션 리스트
	@Override
	public List<WalkingDTO> getMissionList(String walking_id) {
		return walkingDao.getMissionList(walking_id);
	}
	
	// 산책 미션 등록
	@Override
	public int insertWalkingData(WalkingDTO walkingDto) {
		MultipartFile[] walking = walkingDto.getFiles();
		String mission_img = "";
		String path = "C:/walking";
		for(int i=0; i<walking.length; i++) {
			String fileName = walking[i].getOriginalFilename();
			if(fileName.length()!=0) {
				String new_file = upload.upload(walking[i], path, "start" + fileName);
				mission_img = mission_img + new_file + "/";
			}
		}
		walkingDto.setMission_img(mission_img);
		int result = walkingDao.insertWalkingMission(walkingDto);
		
		return result;
	}
	
	@Override
	public int recruitInsert(WalkingDTO walking) {
		return walkingDao.recruitInsert(walking);
	}
	@Override
	public List<WalkingDTO> recruitDog(String mem_nickname) {
		return walkingDao.recruitDog(mem_nickname);
	}
	
	@Override
	public List<WalkingDTO> getRecruitList() {
		return walkingDao.getRecruitList();
	}
	@Override
	public List<WalkingDTO> recruitlist(String mem_nickname) {
		return walkingDao.recruitlist(mem_nickname);
	}
	@Override
	public int recruitUpdate(WalkingDTO walking) {
		return walkingDao.recruitUpdate(walking);
	}
	@Override
	public List<ApplyWalkingDTO> applyList(String walking_id) {
		return walkingDao.applyList(walking_id);
	}
	@Override
	public int matching(Map<String, String> map) {
		return walkingDao.matching(map);
	}	

}
