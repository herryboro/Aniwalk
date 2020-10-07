package kr.pandorabox.aniwalk.walking;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface WalkingService {
	public int recruitInsert(WalkingDTO walking);
	public List<WalkingDTO> recruitDog(String mem_nickname);
	public List<WalkingDTO> getRecruitList();
}
