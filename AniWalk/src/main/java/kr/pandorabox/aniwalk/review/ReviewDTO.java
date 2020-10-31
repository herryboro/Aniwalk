package kr.pandorabox.aniwalk.review;

import java.sql.Date;

public class ReviewDTO {
	private String review_id;
	private String walking_id;
	private String review_contents;
	private String review_score;
	private Date review_date;
	
	private String mem_nickname;
	private String mem_profile_img;
	
	private String dog_image;
	
	@Override
	public String toString() {
		return "ReviewDTO [review_id=" + review_id + ", walking_id=" + walking_id + ", review_contents="
				+ review_contents + ", review_score=" + review_score + ", review_date=" + review_date
				+ ", mem_nickname=" + mem_nickname + ", mem_profile_img=" + mem_profile_img + ", dog_image=" + dog_image
				+ "]";
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public String getWalking_id() {
		return walking_id;
	}
	public void setWalking_id(String walking_id) {
		this.walking_id = walking_id;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}
	public String getReview_score() {
		return review_score;
	}
	public void setReview_score(String review_score) {
		this.review_score = review_score;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_profile_img() {
		return mem_profile_img;
	}
	public void setMem_profile_img(String mem_profile_img) {
		this.mem_profile_img = mem_profile_img;
	}

	public String getDog_image() {
		return dog_image;
	}


	public void setDog_image(String dog_image) {
		this.dog_image = dog_image;
	}
	
}
