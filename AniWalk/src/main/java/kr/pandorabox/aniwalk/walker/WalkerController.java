package kr.pandorabox.aniwalk.walker;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import kr.pandorabox.aniwalk.Authentication;
import kr.pandorabox.aniwalk.FileUploadLogic;
import kr.pandorabox.aniwalk.SHA256;

@Controller
public class WalkerController {
	@Autowired
	private WalkerService walkerService;
	@Autowired
	private FileUploadLogic uploadService;
	@Autowired
	private Authentication auth;
	@Autowired
	private SHA256 hash;
	
	
	//main
	@RequestMapping("/walker/main.do")
	public String main(HttpServletRequest request, String walker_id) {
		request.getSession().setAttribute("walker_id", walker_id);
		System.out.println("세션---->"+request.getSession().getAttribute("walker_id"));
		return "walker/main";
	}	
	
	
	
	// 인증번호 확인 
	@ResponseBody
	@RequestMapping(value="walker/authNum.do",
			method = RequestMethod.POST,
			produces = "application/text;charset=utf-8")
	public String authNum(String auth_num, String auth) {
	    auth = hash.toSHA256(auth);
	    if(auth_num.equals(auth)) {
	    	return "pass";
	    }
		return "fail";
	}
	
	// 문자인증 메시지 보내기
	@ResponseBody
	@RequestMapping(value="walker/auth.do",
			method = RequestMethod.POST,
			produces = "application/text;charset=utf-8")
	public String auth(String wk_phone) {
		System.out.println(wk_phone);
		Random ran = new Random();
	    String auth = Integer.toString(ran.nextInt(899999) + 100000); 
	    System.out.println(auth);
	    auth = hash.toSHA256(auth);
	    System.out.println(auth);
		return auth;
	}
	
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
	
	//walker 로그인 유효성 검사
	@RequestMapping(value="/walker/loginCheck.do",
			method=RequestMethod.GET,
			produces = "application/json;charset=utf-8")
	public @ResponseBody int login(String walker_id, String wk_pw) {
		int result = walkerService.walkerLogin(walker_id,wk_pw);
		return result;
	}
	
	//walker my page
	@RequestMapping("/walker/my.do")
	public ModelAndView walkerMy() {
		
		
		ModelAndView mav = new ModelAndView();
		
		
		return mav;
	}
	
}
