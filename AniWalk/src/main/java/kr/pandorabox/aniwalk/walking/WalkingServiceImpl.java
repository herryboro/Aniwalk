package kr.pandorabox.aniwalk.walking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WalkingServiceImpl implements WalkingService{
	@Autowired
	private WalkingDAO walkingDao;
	
	@Override
	public int recruitInsert(WalkingDTO walking) {
		return walkingDao.recruitInsert(walking);
	}
	@Override
	public List<WalkingDTO> recruitDog(String mem_nickname) {
		return walkingDao.recruitDog(mem_nickname);
	}
}
