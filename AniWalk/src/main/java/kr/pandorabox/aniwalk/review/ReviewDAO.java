package kr.pandorabox.aniwalk.review;

public interface ReviewDAO {

	public ReviewDTO getReview(String walking_id);

	public int insertReview(ReviewDTO reviewDto);

}
