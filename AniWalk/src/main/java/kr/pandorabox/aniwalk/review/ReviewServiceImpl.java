package kr.pandorabox.aniwalk.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDao;
	
	// 오너 페이지 - 펫 프렌즈 리뷰 리스트
	@Override
	public List<ReviewDTO> getWalkerReviewList(String wk_id) {
		return reviewDao.getWalkerReviewList(wk_id);
	}
	
	// 오너 페이지 - 완료된 산책 리뷰 불러오기
	@Override
	public ReviewDTO getReview(String walking_id) {
		return reviewDao.getReview(walking_id);
	}
	
	// 오너 페이지 - 완료된 산책 리뷰 생성
	@Override
	public int insertReview(ReviewDTO reviewDto) {
		return reviewDao.insertReview(reviewDto);
	}
	
}
