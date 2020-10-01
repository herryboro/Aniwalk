package kr.pandorabox.aniwalk.member;

import java.util.ArrayList;

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
	MemberService memverService; 
	
	@Autowired
	FileUploadLogic uploadService;
	
	@RequestMapping("/loginPro.do")
	public ModelAndView checkMember(int kakao_id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		String mem_nickname = memverService.joinCheck(kakao_id);
		
		if(mem_nickname == null) {
			mav.setViewName("login");
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
	 
	@RequestMapping(value = "/owner/signIn.do", method = RequestMethod.POST)
	public ModelAndView joinMember(JoinMemberDogImgDTO joinMemberDogImgDTO, HttpServletRequest request) throws Exception {
		String kakao_id = joinMemberDogImgDTO.getKakao_id();
		System.out.println("kakao_id: " + kakao_id);
		
		ModelAndView mav = new ModelAndView();
		
		MultipartFile[] files = joinMemberDogImgDTO.getFiles();
		ArrayList<String> filelist = new ArrayList<String>();
		String path = "C:/member";
		for(int i=0; i<files.length; i++) {
			String fileName = files[i].getOriginalFilename();
			System.out.println("fileName: " + fileName);
			if(fileName.length()!=0) {
				String new_file = uploadService.upload(files[i], path, fileName);
				filelist.add(new_file);
			}
		}
		
		int result = memverService.joinMember(joinMemberDogImgDTO, filelist);
		
		if(result == 1) {
			mav.setViewName("owner/index");
		} else {
			mav.setViewName("login");
		}	
		return mav;
	}
}
