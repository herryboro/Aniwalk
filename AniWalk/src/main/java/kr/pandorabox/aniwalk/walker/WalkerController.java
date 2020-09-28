package kr.pandorabox.aniwalk.walker;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import kr.pandorabox.aniwalk.FileUploadLogic;

@Controller
public class WalkerController {
	@Autowired
	private WalkerService walkerService;
	@Autowired
	private FileUploadLogic uploadService;
	
	// 펫 프렌즈 상세 정보
	@RequestMapping("manager/walkerInfo.do")
	public ModelAndView walkerInfo(String wk_id) {
		List<WalkerDTO> walkerInfo = walkerService.applierList(wk_id);
		return new ModelAndView("manager/walkerInfo", "walkerInfo", walkerInfo);
	}
	
	// 펫 프렌즈 리스트
	@RequestMapping("manager/walker.do")
	public ModelAndView ApplierList(String wk_id) {
		ModelAndView mav = new ModelAndView();
		List<WalkerDTO> list = walkerService.applierList(wk_id);
		mav.addObject("applierList",list);
		mav.setViewName("manager/walker");
		return mav;
	}
	
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
