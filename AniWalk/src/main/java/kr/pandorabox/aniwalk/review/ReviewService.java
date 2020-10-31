package kr.pandorabox.aniwalk.review;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface ReviewService {

	ReviewDTO getReview(String walking_id);

	int insertReview(ReviewDTO reviewDto);

	List<ReviewDTO> getWalkerReviewList(String wk_id);
}
