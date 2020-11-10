package kr.pandorabox.aniwalk.walking;

import java.sql.Date;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class WalkingDTO {
	
	//member
	private String mem_nickname;
	
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
	private String real_walk_start_time;
	private String real_walk_end_time;

	//walking mission
	private String mission_id;
	private String mission_contents;
	private String mission_img;
	private String mission_perform_location;
	private Date mission_perform_time;
	private MultipartFile[] files;
	
	//dog
	private String dog_name;
	private String dog_type;
	private String dog_size;
	private String dog_info;
	private Date dog_birth;
	private String mem_id;
	
	//dog_img
	private String dog_img_id;
	private String dog_image;
	
	//walker
	private String wk_profile_img1;
	private String wk_name;
	
	//path
	private String walking_lat;
	private String walking_lng;
	
	@Override
	public String toString() {
		return "WalkingDTO [mem_nickname=" + mem_nickname + ", walking_id=" + walking_id + ", recruit_mem_id="
				+ recruit_mem_id + ", dog_id=" + dog_id + ", recruit_date=" + recruit_date + ", walk_date=" + walk_date
				+ ", walk_start_time=" + walk_start_time + ", walk_end_time=" + walk_end_time + ", recruit_notices="
				+ recruit_notices + ", recruit_location=" + recruit_location + ", recruit_close_yn=" + recruit_close_yn
				+ ", match_wk_id=" + match_wk_id + ", walking_map_path=" + walking_map_path + ", map_capture_img="
				+ map_capture_img + ", walking_point=" + walking_point + ", real_walk_start_time="
				+ real_walk_start_time + ", real_walk_end_time=" + real_walk_end_time + ", mission_id=" + mission_id
				+ ", mission_contents=" + mission_contents + ", mission_img=" + mission_img
				+ ", mission_perform_location=" + mission_perform_location + ", mission_perform_time="
				+ mission_perform_time + ", files=" + Arrays.toString(files) + ", dog_name=" + dog_name + ", dog_type="
				+ dog_type + ", dog_size=" + dog_size + ", dog_info=" + dog_info + ", dog_birth=" + dog_birth
				+ ", mem_id=" + mem_id + ", dog_img_id=" + dog_img_id + ", dog_image=" + dog_image
				+ ", wk_profile_img1=" + wk_profile_img1 + ", wk_name=" + wk_name + ", walking_lat=" + walking_lat
				+ ", walking_lng=" + walking_lng + "]";
	}



	public String getWalking_lat() {
		return walking_lat;
	}



	public void setWalking_lat(String walking_lat) {
		this.walking_lat = walking_lat;
	}



	public String getWalking_lng() {
		return walking_lng;
	}



	public void setWalking_lng(String walking_lng) {
		this.walking_lng = walking_lng;
	}



	public String getMission_id() {
		return mission_id;
	}



	public void setMission_id(String mission_id) {
		this.mission_id = mission_id;
	}



	public String getMission_contents() {
		return mission_contents;
	}



	public void setMission_contents(String mission_contents) {
		this.mission_contents = mission_contents;
	}



	public String getMission_img() {
		return mission_img;
	}



	public void setMission_img(String mission_img) {
		this.mission_img = mission_img;
	}



	public String getMission_perform_location() {
		return mission_perform_location;
	}



	public void setMission_perform_location(String mission_perform_location) {
		this.mission_perform_location = mission_perform_location;
	}



	public Date getMission_perform_time() {
		return mission_perform_time;
	}



	public void setMission_perform_time(Date mission_perform_time) {
		this.mission_perform_time = mission_perform_time;
	}



	public MultipartFile[] getFiles() {
		return files;
	}


	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}


	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
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
	public String getDog_name() {
		return dog_name;
	}
	public void setDog_name(String dog_name) {
		this.dog_name = dog_name;
	}
	public String getDog_type() {
		return dog_type;
	}
	public void setDog_type(String dog_type) {
		this.dog_type = dog_type;
	}
	public String getDog_size() {
		return dog_size;
	}
	public void setDog_size(String dog_size) {
		this.dog_size = dog_size;
	}
	public String getDog_info() {
		return dog_info;
	}
	public void setDog_info(String dog_info) {
		this.dog_info = dog_info;
	}
	public Date getDog_birth() {
		return dog_birth;
	}
	public void setDog_birth(Date dog_birth) {
		this.dog_birth = dog_birth;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getDog_img_id() {
		return dog_img_id;
	}
	public void setDog_img_id(String dog_img_id) {
		this.dog_img_id = dog_img_id;
	}
	public String getDog_image() {
		return dog_image;
	}
	public void setDog_image(String dog_image) {
		this.dog_image = dog_image;
	}
	public String getWalk_date() {
		return walk_date;
	}
	public void setWalk_date(String walk_date) {
		this.walk_date = walk_date;
	}
	public int getWalking_point() {
		return walking_point;
	}
	public void setWalking_point(int walking_point) {
		this.walking_point = walking_point;
	}
	public String getWk_profile_img1() {
		return wk_profile_img1;
	}
	public void setWk_profile_img1(String wk_profile_img1) {
		this.wk_profile_img1 = wk_profile_img1;
	}
	public String getWk_name() {
		return wk_name;
	}
	public void setWk_name(String wk_name) {
		this.wk_name = wk_name;
	}
	public String getReal_walk_start_time() {
		return real_walk_start_time;
	}
	public void setReal_walk_start_time(String real_walk_start_time) {
		this.real_walk_start_time = real_walk_start_time;
	}
	public String getReal_walk_end_time() {
		return real_walk_end_time;
	}
	public void setReal_walk_end_time(String real_walk_end_time) {
		this.real_walk_end_time = real_walk_end_time;
	}
	
	
	
	
	
}
