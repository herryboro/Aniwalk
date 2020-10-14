package kr.pandorabox.aniwalk.walking;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface WalkingService {
	public int recruitInsert(WalkingDTO walking);
	public List<WalkingDTO> recruitDog(String mem_nickname);
	public List<WalkingDTO> getRecruitList();
	public List<WalkingDTO> recruitlist(String mem_nickname);
	public int insertWalkingData(WalkingDTO walkingDto);
	public List<WalkingDTO> getMissionList(String walking_id);
}
