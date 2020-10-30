package kr.pandorabox.aniwalk.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	
	// 오너 페이지 - 완료된 산책 리뷰
	@RequestMapping("/owner/review.do")
	public String insertWalkingReview(ReviewDTO reviewDto) {
		int result = reviewService.insertReview(reviewDto);
		return "redirect: /aniwalk/owner/activityList.do";
	}
}
