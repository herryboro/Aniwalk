package kr.pandorabox.aniwalk.walking;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WalkingController {
	@Autowired
	private WalkingService walkingService;
	
	// 모집글 리스트
	@RequestMapping("/walker/recruitlist.do")
	public ModelAndView recruitlist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<WalkingDTO> list = walkingService.getRecruitList();
		mav.addObject("recruitList", list);
		mav.setViewName("walker/recruitlist");
		return mav;
	}
	
	//모집글 올리기 
	@RequestMapping("/owner/recruit.do")
	public ModelAndView recruit(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String mem_nickname = (String) request.getSession().getAttribute("mem_nickname");
		
		List<WalkingDTO> walkingDtos = walkingService.recruitDog(mem_nickname);
		System.out.println(walkingDtos);
		String recruit_mem_id = walkingDtos.get(0).getMem_id();
		
		mav.addObject("recruit_mem_id",recruit_mem_id);
		mav.addObject("walkingDtos", walkingDtos);
		mav.setViewName("owner/recruit");
		return mav;
	}
	
	//모집글 insert
	@RequestMapping("/owner/recruitInsert.do")
	public String recruitInsert(WalkingDTO walking) {
		System.out.println(walking.getWalk_start_time()+walking.getWalk_end_time());
		walkingService.recruitInsert(walking);
		return "owner/index";
	}
	//내 모집글 list
	@RequestMapping("/owner/recruitList.do")
	public ModelAndView list(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String mem_nickname = (String) req.getSession().getAttribute("mem_nickname");
		List<WalkingDTO> walkingDtos= walkingService.recruitlist(mem_nickname);
		
		mav.setViewName("owner/recruitList");
		mav.addObject("mem_nickname", mem_nickname);
		mav.addObject("walkingDtos", walkingDtos);
		return mav;
	}
	
}
