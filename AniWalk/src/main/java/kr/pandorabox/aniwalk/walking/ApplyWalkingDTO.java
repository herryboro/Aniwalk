package kr.pandorabox.aniwalk.walking;

import java.sql.Date;

public class ApplyWalkingDTO {
	//walking
	private String walking_id;
	private String recruit_mem_id;
	private String dog_id;
	private String recruit_date;
	private String walk_date;
	private String walk_start_time;
	private String walk_end_time;
	private String recruit_notices;
	private String recruit_location;
	private int recruit_close_yn;
	private String match_wk_id;
	private String walking_map_path;
	private String map_capture_img;
	private int walking_point;
	
	//apply
	private String apply_id;
	private String apply_wk_id;
	private String walking_apply_date;
	
	//walker
	private String wk_id;
	private String wk_name;
	private String walker_id;
	private String wk_pw;
	private String wk_phone;
	private String wk_birth;
	private String wk_email;
	private String wk_addr;
	private String wk_profile_img1;
	private String wk_profile_img2;
	private String wk_profile_img3;
	private String wk_event_agree;
	private String wk_location1;
	private String wk_location2;
	private String wk_certificate_list;
	private String wk_intro;
	private int wk_point;
	private Date apply_date;
	private int apply_state;
	private Date activity_start_date;
	private int activity_state;
	public String getWalking_id() {
		return walking_id;
	}
	public void setWalking_id(String walking_id) {
		this.walking_id = walking_id;
	}
	public String getRecruit_mem_id() {
		return recruit_mem_id;
	}
	public void setRecruit_mem_id(String recruit_mem_id) {
		this.recruit_mem_id = recruit_mem_id;
	}
	public String getDog_id() {
		return dog_id;
	}
	public void setDog_id(String dog_id) {
		this.dog_id = dog_id;
	}
	public String getRecruit_date() {
		return recruit_date;
	}
	public void setRecruit_date(String recruit_date) {
		this.recruit_date = recruit_date;
	}
	public String getWalk_date() {
		return walk_date;
	}
	public void setWalk_date(String walk_date) {
		this.walk_date = walk_date;
	}
	public String getWalk_start_time() {
		return walk_start_time;
	}
	public void setWalk_start_time(String walk_start_time) {
		this.walk_start_time = walk_start_time;
	}
	public String getWalk_end_time() {
		return walk_end_time;
	}
	public void setWalk_end_time(String walk_end_time) {
		this.walk_end_time = walk_end_time;
	}
	public String getRecruit_notices() {
		return recruit_notices;
	}
	public void setRecruit_notices(String recruit_notices) {
		this.recruit_notices = recruit_notices;
	}
	public String getRecruit_location() {
		return recruit_location;
	}
	public void setRecruit_location(String recruit_location) {
		this.recruit_location = recruit_location;
	}
	public int getRecruit_close_yn() {
		return recruit_close_yn;
	}
	public void setRecruit_close_yn(int recruit_close_yn) {
		this.recruit_close_yn = recruit_close_yn;
	}
	public String getMatch_wk_id() {
		return match_wk_id;
	}
	public void setMatch_wk_id(String match_wk_id) {
		this.match_wk_id = match_wk_id;
	}
	public String getWalking_map_path() {
		return walking_map_path;
	}
	public void setWalking_map_path(String walking_map_path) {
		this.walking_map_path = walking_map_path;
	}
	public String getMap_capture_img() {
		return map_capture_img;
	}
	public void setMap_capture_img(String map_capture_img) {
		this.map_capture_img = map_capture_img;
	}
	public int getWalking_point() {
		return walking_point;
	}
	public void setWalking_point(int walking_point) {
		this.walking_point = walking_point;
	}
	public String getApply_id() {
		return apply_id;
	}
	public void setApply_id(String apply_id) {
		this.apply_id = apply_id;
	}
	public String getApply_wk_id() {
		return apply_wk_id;
	}
	public void setApply_wk_id(String apply_wk_id) {
		this.apply_wk_id = apply_wk_id;
	}
	public String getWalking_apply_date() {
		return walking_apply_date;
	}
	public void setWalking_apply_date(String walking_apply_date) {
		this.walking_apply_date = walking_apply_date;
	}
	public String getWk_id() {
		return wk_id;
	}
	public void setWk_id(String wk_id) {
		this.wk_id = wk_id;
	}
	public String getWk_name() {
		return wk_name;
	}
	public void setWk_name(String wk_name) {
		this.wk_name = wk_name;
	}
	public String getWalker_id() {
		return walker_id;
	}
	public void setWalker_id(String walker_id) {
		this.walker_id = walker_id;
	}
	public String getWk_pw() {
		return wk_pw;
	}
	public void setWk_pw(String wk_pw) {
		this.wk_pw = wk_pw;
	}
	public String getWk_phone() {
		return wk_phone;
	}
	public void setWk_phone(String wk_phone) {
		this.wk_phone = wk_phone;
	}
	public String getWk_birth() {
		return wk_birth;
	}
	public void setWk_birth(String wk_birth) {
		this.wk_birth = wk_birth;
	}
	public String getWk_email() {
		return wk_email;
	}
	public void setWk_email(String wk_email) {
		this.wk_email = wk_email;
	}
	public String getWk_addr() {
		return wk_addr;
	}
	public void setWk_addr(String wk_addr) {
		this.wk_addr = wk_addr;
	}
	public String getWk_profile_img1() {
		return wk_profile_img1;
	}
	public void setWk_profile_img1(String wk_profile_img1) {
		this.wk_profile_img1 = wk_profile_img1;
	}
	public String getWk_profile_img2() {
		return wk_profile_img2;
	}
	public void setWk_profile_img2(String wk_profile_img2) {
		this.wk_profile_img2 = wk_profile_img2;
	}
	public String getWk_profile_img3() {
		return wk_profile_img3;
	}
	public void setWk_profile_img3(String wk_profile_img3) {
		this.wk_profile_img3 = wk_profile_img3;
	}
	public String getWk_event_agree() {
		return wk_event_agree;
	}
	public void setWk_event_agree(String wk_event_agree) {
		this.wk_event_agree = wk_event_agree;
	}
	public String getWk_location1() {
		return wk_location1;
	}
	public void setWk_location1(String wk_location1) {
		this.wk_location1 = wk_location1;
	}
	public String getWk_location2() {
		return wk_location2;
	}
	public void setWk_location2(String wk_location2) {
		this.wk_location2 = wk_location2;
	}
	public String getWk_certificate_list() {
		return wk_certificate_list;
	}
	public void setWk_certificate_list(String wk_certificate_list) {
		this.wk_certificate_list = wk_certificate_list;
	}
	public String getWk_intro() {
		return wk_intro;
	}
	public void setWk_intro(String wk_intro) {
		this.wk_intro = wk_intro;
	}
	public int getWk_point() {
		return wk_point;
	}
	public void setWk_point(int wk_point) {
		this.wk_point = wk_point;
	}
	public Date getApply_date() {
		return apply_date;
	}
	public void setApply_date(Date apply_date) {
		this.apply_date = apply_date;
	}
	public int getApply_state() {
		return apply_state;
	}
	public void setApply_state(int apply_state) {
		this.apply_state = apply_state;
	}
	public Date getActivity_start_date() {
		return activity_start_date;
	}
	public void setActivity_start_date(Date activity_start_date) {
		this.activity_start_date = activity_start_date;
	}
	public int getActivity_state() {
		return activity_state;
	}
	public void setActivity_state(int activity_state) {
		this.activity_state = activity_state;
	}
	@Override
	public String toString() {
		return "ApplyWalking [walking_id=" + walking_id + ", recruit_mem_id=" + recruit_mem_id + ", dog_id=" + dog_id
				+ ", recruit_date=" + recruit_date + ", walk_date=" + walk_date + ", walk_start_time=" + walk_start_time
				+ ", walk_end_time=" + walk_end_time + ", recruit_notices=" + recruit_notices + ", recruit_location="
				+ recruit_location + ", recruit_close_yn=" + recruit_close_yn + ", match_wk_id=" + match_wk_id
				+ ", walking_map_path=" + walking_map_path + ", map_capture_img=" + map_capture_img + ", walking_point="
				+ walking_point + ", apply_id=" + apply_id + ", apply_wk_id=" + apply_wk_id + ", walking_apply_date="
				+ walking_apply_date + ", wk_id=" + wk_id + ", wk_name=" + wk_name + ", walker_id=" + walker_id
				+ ", wk_pw=" + wk_pw + ", wk_phone=" + wk_phone + ", wk_birth=" + wk_birth + ", wk_email=" + wk_email
				+ ", wk_addr=" + wk_addr + ", wk_profile_img1=" + wk_profile_img1 + ", wk_profile_img2="
				+ wk_profile_img2 + ", wk_profile_img3=" + wk_profile_img3 + ", wk_event_agree=" + wk_event_agree
				+ ", wk_location1=" + wk_location1 + ", wk_location2=" + wk_location2 + ", wk_certificate_list="
				+ wk_certificate_list + ", wk_intro=" + wk_intro + ", wk_point=" + wk_point + ", apply_date="
				+ apply_date + ", apply_state=" + apply_state + ", activity_start_date=" + activity_start_date
				+ ", activity_state=" + activity_state + "]";
	}
	
}
