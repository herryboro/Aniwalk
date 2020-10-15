package kr.pandorabox.aniwalk.walking;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WalkingController {
	@Autowired
	private WalkingService walkingService;
	
	// 산책 시작 
	@ResponseBody
	@RequestMapping(value = "/walking/walkingStart.do",
			method = RequestMethod.POST,
			consumes ={"multipart/form-data"})
	public List<WalkingDTO> walking(WalkingDTO walkingDto) {
		System.out.println(walkingDto.getWalking_id());
		System.out.println(walkingDto.getMission_perform_location());
		System.out.println(walkingDto.getMission_contents());
		int result = walkingService.insertWalkingData(walkingDto);
		List<WalkingDTO> list = walkingService.getMissionList(walkingDto.getWalking_id());
		return list;
	}
	
	// 프렌즈 산책 정보 리스트
	@RequestMapping("/walker/activList.do")
	public ModelAndView getMissionList(HttpServletRequest req) {
		String walker_id = (String) req.getSession().getAttribute("walker_id");
		System.out.println(walker_id);
		List<WalkingDTO> list = walkingService.getWalkingList(walker_id);
		return new ModelAndView("walker/activList", "activList", list);
	}

	
	// 산책 정보 가져오기
	@RequestMapping("/walker/activiting.do")
	public ModelAndView getMissionList(String walking_id) {
		List<WalkingDTO> list = walkingService.getMissionList(walking_id);
		for (WalkingDTO walkingDTO : list) {
			if(walkingDTO.getMission_contents().equals("end")) list = null;
		}
		return new ModelAndView("walker/activiting", "missionList", list);
	}
	
	// 모집글 리스트
	@RequestMapping("/walker/recruitlist.do")
	public ModelAndView recruitlist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<WalkingDTO> list = walkingService.getRecruitList();
		String walker_id = (String) request.getSession().getAttribute("walker_id");
		//워커 인덱스 가져오기
		String wk_id = walkingService.wkId(walker_id);
		mav.addObject("wk_id", wk_id);
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
		System.out.println(walking);
		System.out.println(walking.getWalk_start_time()+walking.getWalk_end_time());
		walkingService.recruitInsert(walking);
		//산책모집 올리면 member 테이블에 포인트 update
		walkingService.recruitUpdate(walking);
		
		return "redirect:/owner/recruitList.do";
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
	
	//신청자 list
	@RequestMapping(value="/walking/ajax_applyList.do",
			method = RequestMethod.GET,
			produces = "application/json;charset=utf-8")
	public @ResponseBody List<ApplyWalkingDTO> ajax_applyList(String walking_id){
		List<ApplyWalkingDTO> applyList = walkingService.applyList(walking_id);
		System.out.println(applyList);
		return applyList;
	}
	
	//매칭 하기
	@RequestMapping("/walking/matching.do")
	public String matching(String match_wk_id, String walking_id) {
		//매칭
		Map<String, String> map = new HashMap<String, String>();
		map.put("match_wk_id", match_wk_id);
		map.put("walking_id", walking_id);
		walkingService.matching(map);
		return "owner/activityList";
	}
	
	//오너 인덱스(오늘 산책일정이 여기에 떠야함)
	@RequestMapping("/owner/index.do")
	public ModelAndView ownerIndex(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String mem_nickname = (String) req.getSession().getAttribute("mem_nickname");
		
		//현재 날짜
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String walk_date = format1.format(today);
		System.out.println("222222222:"+walk_date);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_nickname", mem_nickname);
		map.put("walk_date", walk_date);
		
		List<WalkingDTO> todayList =walkingService.todayWalking(map);
		System.out.println("todayList:"+todayList);
		
		mav.addObject("todayList", todayList);
		mav.setViewName("owner/index");
		return mav;
	}
	
	//(전체 산책 일정)
	@RequestMapping("/owner/activityList.do")
	public ModelAndView todayWalking(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String mem_nickname = (String) req.getSession().getAttribute("mem_nickname");
		
		List<WalkingDTO> allList =walkingService.allWalking(mem_nickname);
		System.out.println("todayList:"+allList);
		
		mav.addObject("allList", allList);
		mav.setViewName("owner/activityList");
		return mav;
	}
	
	//산책 신청
	
	@RequestMapping("walker/walkingRecruit.do")
	public String walkingRecruit(String walking_id, String wk_id) {
		System.out.println("산책신청::::"+walking_id+wk_id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("walking_id", walking_id);
		map.put("wk_id", wk_id);
		walkingService.walkingRecruit(map);
		return "redirect:/walker/recruitlist.do";
	}
}
