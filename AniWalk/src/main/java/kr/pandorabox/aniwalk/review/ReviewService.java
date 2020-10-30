package kr.pandorabox.aniwalk.review;

import org.springframework.stereotype.Service;

@Service
public interface ReviewService {

	ReviewDTO getReview(String walking_id);

	int insertReview(ReviewDTO reviewDto);
}
