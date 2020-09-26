package kr.pandorabox.aniwalk.walker;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import kr.pandorabox.aniwalk.FileUploadLogic;

@Controller
public class WalkerController {
	@Autowired
	private WalkerService walkerService;
	@Autowired
	private FileUploadLogic uploadService;
	
	// 지역
	@ResponseBody
	@RequestMapping(value="/walker/region.do", 
			method = RequestMethod.GET,
			produces = "application/json;charset=utf-8")
	public String[] city(String area) {
		String[] list = walkerService.getCity(area);
		return list;
	}
	
	// 펫 프렌즈 신청
	@RequestMapping("/walker/apply.do")
	public String walkerApply(WalkerDTO walker, HttpServletRequest req) throws Exception {
		MultipartFile[] files = walker.getFiles();
		System.out.println(walker);
		ArrayList<String> filelist = new ArrayList<String>();
		String path = 
				WebUtils.getRealPath(req.getSession().getServletContext(), "/WEB-INF/upload");
		for(int i=0; i<files.length; i++) {
			String fileName = files[i].getOriginalFilename();
			if(fileName.length()!=0) {
				String new_file = uploadService.upload(files[i], path, fileName);
				filelist.add(new_file);
			}
		}
		walkerService.walkerApply(walker, filelist);
		return "index";
	}
}
