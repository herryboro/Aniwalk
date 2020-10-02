package kr.pandorabox.aniwalk.manager;

import java.util.Date;

public class MemberDTO {
	String mem_id;
	String mem_nickname;
	String kakao_id;
	long mem_point;
	String mem_phone;
	String mem_profile_img;
	Date mem_join_date;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getKakao_id() {
		return kakao_id;
	}
	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}
	public long getMem_point() {
		return mem_point;
	}
	public void setMem_point(long mem_point) {
		this.mem_point = mem_point;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_profile_img() {
		return mem_profile_img;
	}
	public void setMem_profile_img(String mem_profile_img) {
		this.mem_profile_img = mem_profile_img;
	}
	public Date getMem_join_date() {
		return mem_join_date;
	}
	public void setMem_join_date(Date mem_join_date) {
		this.mem_join_date = mem_join_date;
	}
	
	
}
