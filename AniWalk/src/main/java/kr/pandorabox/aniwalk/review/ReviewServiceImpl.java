package kr.pandorabox.aniwalk.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDao;
	
	// 리뷰 불러오기
	@Override
	public ReviewDTO getReview(String walking_id) {
		return reviewDao.getReview(walking_id);
	}
	
	// 리뷰 생성
	@Override
	public int insertReview(ReviewDTO reviewDto) {
		return reviewDao.insertReview(reviewDto);
	}
	
}
