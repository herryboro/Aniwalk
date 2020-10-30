package kr.pandorabox.aniwalk.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	@Autowired
	SqlSession session;
	
	// 리뷰 불러오기
	@Override
	public ReviewDTO getReview(String walking_id) {
		return session.selectOne("kr.pandorabox.aniwalk.review.getReview", walking_id);
	}
	
	// 리뷰 생성
	@Override
	public int insertReview(ReviewDTO reviewDto) {
		return session.insert("kr.pandorabox.aniwalk.review.insertReview", reviewDto);
	}
}
