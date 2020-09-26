package kr.pandorabox.aniwalk.walker;

import java.util.ArrayList;

public interface WalkerDAO {

	public int walkerApply(WalkerDTO walker);

	public int fileInsert(ArrayList<String> filelist);
	
}
