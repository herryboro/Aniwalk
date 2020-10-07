package kr.pandorabox.aniwalk.walking;

import java.util.List;

public interface WalkingDAO {
	//모집글 등록
	public int recruitInsert(WalkingDTO walking);
	
	//모집글 올릴 때 개 이미지 
	public List<WalkingDTO> recruitDog(String mem_nickname);

	public List<WalkingDTO> getRecruitList();

}
