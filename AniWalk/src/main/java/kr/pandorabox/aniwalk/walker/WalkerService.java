package kr.pandorabox.aniwalk.walker;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface WalkerService {
	public String[] getCity(String area);
	public int walkerApply(WalkerDTO walker, ArrayList<String> filelist);
	public List<WalkerDTO> applierList();
}
