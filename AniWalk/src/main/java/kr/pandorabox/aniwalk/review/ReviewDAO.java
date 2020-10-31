package kr.pandorabox.aniwalk.review;

import java.util.List;

public interface ReviewDAO {

	public ReviewDTO getReview(String walking_id);

	public int insertReview(ReviewDTO reviewDto);

	public List<ReviewDTO> getWalkerReviewList(String wk_id);

}
