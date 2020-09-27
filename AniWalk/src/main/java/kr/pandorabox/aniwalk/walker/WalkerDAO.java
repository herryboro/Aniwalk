package kr.pandorabox.aniwalk.walker;

import java.util.ArrayList;
import java.util.List;

public interface WalkerDAO {

	public int walkerApply(WalkerDTO walker);

	public int fileInsert(ArrayList<String> filelist);

	public List<WalkerDTO> applyierList();
	
}
