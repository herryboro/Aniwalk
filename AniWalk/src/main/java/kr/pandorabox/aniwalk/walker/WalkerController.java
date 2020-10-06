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
		return "walker/main";
	}	
	
	// owner페이지 펫 프렌즈 리스트
	@RequestMapping("owner/walker.do")
	public ModelAndView walkerList(String wk_id) {
		ModelAndView mav = new ModelAndView();
		List<WalkerDTO> list = walkerService.applierList(wk_id);
		mav.addObject("walkerList",list);
		mav.setViewName("owner/walkerList");
		return mav;
	}
	
	// owner페이지  펫 프렌즈 상세 정보
	@RequestMapping("owner/walkerInfo.do")
	public ModelAndView ownerWalkerInfo(String wk_id) {
		List<WalkerDTO> walkerInfo = walkerService.applierList(wk_id);
		return new ModelAndView("owner/walkerInfo", "walkerInfo", walkerInfo);
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
	@RequestMapping(value="/walker/regionCheck.do", 
			method = RequestMethod.GET,
			produces = "application/json;charset=utf-8")
	public String[] city(String area) {
		String[] list = walkerService.getCity(area);
		return list;
	}
	
	// 펫 프렌즈 신청
	@RequestMapping("/apply.do")
	public String walkerApply(WalkerDTO walker, HttpServletRequest req) throws Exception {
		System.out.println(walker.getWk_location1());
		System.out.println(walker.getWk_location2());
		MultipartFile[] certifications = walker.getFiles();
		MultipartFile[] profile_imgs = walker.getWk_profile_imgs();
		ArrayList<String> filelist = new ArrayList<String>();
		ArrayList<String> profileImgList = new ArrayList<String>();
		String path = "C:/walker";
		for(int i=0; i<certifications.length; i++) {
			String fileName = certifications[i].getOriginalFilename();
			if(fileName.length()!=0) {
				String new_file = uploadService.upload(certifications[i], path, "certi" + fileName);
				filelist.add(new_file);
			}
		}
		for(int i=0; i<profile_imgs.length; i++) {
			String fileName = "profile" + profile_imgs[i].getOriginalFilename();
			String new_file = uploadService.upload(profile_imgs[i], path, fileName);
			profileImgList.add(new_file);
		}
		switch(profileImgList.size()) {
		case 3: walker.setWk_profile_img3(profileImgList.get(2));
		case 2: walker.setWk_profile_img2(profileImgList.get(1));
		case 1: walker.setWk_profile_img1(profileImgList.get(0));
		default: break;
		}
		walkerService.walkerApply(walker, filelist);
		return "index";
	}


	
	//walker 로그인 유효성 검사
	@RequestMapping(value="/walker/loginCheck.do",
			method=RequestMethod.GET,
			produces = "application/json;charset=utf-8")
	public @ResponseBody int login(String walker_id, String wk_pw, HttpServletRequest request) {
		int result = walkerService.walkerLogin(walker_id,wk_pw);
		if(result > 0) {
			request.getSession().setAttribute("walker_id", walker_id);
		}
		return result;
	}
	
	//walker my page
	@RequestMapping("/walker/my.do")
	public ModelAndView walkerMy(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String wallker_id = (String) request.getSession().getAttribute("walker_id");
		WalkerDTO walkerDto = walkerService.walkerInfo(wallker_id);
		List<WalkerDTO> reviewDtos = walkerService.review(wallker_id);
	
		mav.addObject("walkerDto", walkerDto);
		mav.addObject("reviewDtos", reviewDtos);
		mav.setViewName("walker/my");
		return mav;
	}
	
	
	//워커신청 폰 유효성검사
	@ResponseBody
	@RequestMapping(value="/walker/phoneCheck.do", 
			method = RequestMethod.GET,
			produces = "application/text;charset=utf-8")
	public String phoneCheck(String phoneNum) {
		System.out.println("넘어온 핸드폰번호 ===>"+phoneNum);
		String result = walkerService.phoneCheck(phoneNum);
		System.out.println("핸드폰체크 결과값"+result);
		return result;
	}
	
	//개인정보 수정하기
	@RequestMapping("/walker/myInfo.do")
	public ModelAndView myInfoUpdate(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String walker_id = (String) req.getSession().getAttribute("walker_id");
		WalkerDTO walkerDto = walkerService.myInfo(walker_id);
		mav.addObject("walkerDto", walkerDto);
		mav.setViewName("walker/myInfo");
		return mav;
	}
	
	//개인정보 수정완료
	
	@RequestMapping("/walker/myInfoModify.do")
	public String myInfoModify(WalkerDTO walker,String sido2,String gugun2,String sido1,String gugun1) {
		System.out.println("시군구"+sido2+gugun2);
		String wk_location1 = sido1 + " " + gugun1;
		String wk_location2 = sido2 + " " + gugun2;
		walker.setWk_location1(wk_location1);
		walker.setWk_location2(wk_location2);
		walkerService.myInfoUpdate(walker);
		
		return "redirect:/walker/my.do";
	}
	
}
