package kr.pandorabox.aniwalk.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import kr.pandorabox.aniwalk.FileUploadLogic;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService; 
	
	@Autowired
	FileUploadLogic uploadService;
	
	@RequestMapping("/loginPro.do")
	public ModelAndView checkMember(int kakao_id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String mem_nickname = memberService.joinCheck(kakao_id);
		
		if(mem_nickname == null) {
			mav.setViewName("login");		// main/signUp.jsp
			return mav;
		} else {
			request.getSession().setAttribute("mem_nickname", mem_nickname);
			System.out.println(request.getSession().getAttribute("mem_nickname"));
			mav.addObject("mem_nickname", mem_nickname);
			mav.addObject("kakao_id", kakao_id);
			mav.setViewName("owner/index");
			return mav;
		}			
	}
	 
	@RequestMapping(value = "/signIn.do", method = RequestMethod.POST)
	public ModelAndView joinMember(JoinMemberDogImgDTO joinMemberDogImgDTO, HttpServletRequest request) throws Exception {
		String mem_nickname = joinMemberDogImgDTO.getMem_nickname();
		
		ModelAndView mav = new ModelAndView();
		
		MultipartFile[] files = joinMemberDogImgDTO.getFiles();
		ArrayList<String> filelist = new ArrayList<String>();
		String path = "C:/owner";
		for(int i=0; i<files.length; i++) {
			String fileName = files[i].getOriginalFilename();
			System.out.println("fileName: " + fileName);
			if(fileName.length()!=0) {
				String new_file = uploadService.upload(files[i], path, fileName);
				filelist.add(new_file);
			}
		}
		
		int result = memberService.joinMember(joinMemberDogImgDTO, filelist);
		
		if(result == 1) {
			request.getSession().setAttribute("mem_nickname", mem_nickname);
			mav.setViewName("redirect:/owner/index.do");
		} else {
			mav.setViewName("login");
		}	
		return mav;
	}
	
	@RequestMapping("/owner/my.do")
	public ModelAndView ownerMy(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String mem_nickname = (String) req.getSession().getAttribute("mem_nickname");
		System.out.println("mem_nickname: " + mem_nickname);
		
		List<JoinMemberDogImgDTO> joinDtos = memberService.myPage(mem_nickname);
		
		mav.addObject("joinDtos", joinDtos);
		mav.setViewName("owner/my");		//ownerMy.jsp
		return mav;
	}
	
	// 반려견 정보 추가
	@RequestMapping("/owner/myPro.do")
	public ModelAndView addDog(JoinMemberDogImgDTO joinMemberDogImgDTO, HttpServletRequest request) {
		String mem_nickname = (String) request.getSession().getAttribute("mem_nickname");
		
		String getForeign_Mem_id = memberService.getMem_id(mem_nickname);
//		String getForeign_Dog_id = memberService.getDog_id(getForeign_Mem_id);
		
		joinMemberDogImgDTO.setMem_id(getForeign_Mem_id);
//		joinMemberDogImgDTO.setDog_id(getForeign_Dog_id);
	
		ModelAndView mav = new ModelAndView();
		
		MultipartFile[] files = joinMemberDogImgDTO.getFiles();
		ArrayList<String> filelist = new ArrayList<String>();
		String path = "C:/owner";
		for(int i=0; i<files.length; i++) {
			String fileName = files[i].getOriginalFilename();
			System.out.println("fileName: " + fileName);
			if(fileName.length()!=0) {
				String new_file = uploadService.upload(files[i], path, fileName);
				filelist.add(new_file);
			}
		}
		
		int result = memberService.addDog(joinMemberDogImgDTO, filelist);
		
		if(result == 1) {
			mav.setViewName("redirect:/owner/my.do");
		} else {
			mav.setViewName("owner/index");
		}	
		return mav;
	}
}
