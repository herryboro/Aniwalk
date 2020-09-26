package kr.pandorabox.aniwalk.walker;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WalkerDAOImpl implements WalkerDAO{
	@Autowired
	SqlSession session;
	
	
	// walker 자격증 정보 insert
	@Override
	public int fileInsert(ArrayList<String> filelist) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("filelist", filelist);
		System.out.println(filelist);
		return session.insert("kr.pandorabox.aniwalk.walker.fileinsert", paramMap);
	}
	
	// walker 신청자 insert
	@Override
	public int walkerApply(WalkerDTO walker) {
		System.out.println(walker);
		return session.insert("kr.pandorabox.aniwalk.walker.walkerApply", walker);
	}
}
