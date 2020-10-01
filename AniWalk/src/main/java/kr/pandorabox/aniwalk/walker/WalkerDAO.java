package kr.pandorabox.aniwalk.walker;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface WalkerDAO {

	public int walkerApply(WalkerDTO walker);

	public int fileInsert(ArrayList<String> filelist);

	public List<WalkerDTO> applyierList(String wk_id);
	
	public int walkerLogin(HashMap<String, String> map);
	public int walkerLogin_id(String walker_id);
	
	//워커신청 폰체크
	public String phoneCheck(String phoneNum);
	public WalkerDTO walkerInfo(String walker_id);
	
	//워커 산책 후기
	public List<WalkerDTO> review(String walker_id);

}
