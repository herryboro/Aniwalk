package kr.pandorabox.aniwalk.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	@Autowired
	SqlSession session;
	
	// 오너 페이지 - 펫 프렌즈 리뷰 리스트
	@Override
	public List<ReviewDTO> getWalkerReviewList(String wk_id) {
		return session.selectList("kr.pandorabox.aniwalk.review.getWalkerReviewList", wk_id);
	}
	
	// 오너 페이지 - 산책 완료 리뷰 불러오기
	@Override
	public ReviewDTO getReview(String walking_id) {
		return session.selectOne("kr.pandorabox.aniwalk.review.getReview", walking_id);
	}
	
	// 오너 페이지 - 산책 완료 리뷰 생성
	@Override
	public int insertReview(ReviewDTO reviewDto) {
		return session.insert("kr.pandorabox.aniwalk.review.insertReview", reviewDto);
	}
}
