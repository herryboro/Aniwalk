package kr.pandorabox.aniwalk.chat;


public class ChatDTO {
	private String chat_date;
	private String mem_nickname;
	private String walker_id;
	private String send_nickname;
	private String receive_nickname;
	private String contents;
	private String wk_profile_img1;
	private String mem_profile_img;
	
	//대화창에서 매칭
	private String walk_date;
	private String walk_start_time;
	private String walk_end_time;
	private String recruit_location;
	private String dog_name ;
	private String recruit_notices ;
	private String dog_type;
	private String wk_id;
	private String walking_id;
	private String reservation;
	
	public String getChat_date() {
		return chat_date;
	}
	public void setChat_date(String chat_date) {
		this.chat_date = chat_date;
	}
	public String getSend_nickname() {
		return send_nickname;
	}
	public void setSend_nickname(String send_nickname) {
		this.send_nickname = send_nickname;
	}
	public String getReceive_nickname() {
		return receive_nickname;
	}
	public void setReceive_nickname(String receive_nickname) {
		this.receive_nickname = receive_nickname;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getWalker_id() {
		return walker_id;
	}
	public void setWalker_id(String walker_id) {
		this.walker_id = walker_id;
	}
	
	public String getWk_profile_img1() {
		return wk_profile_img1;
	}
	public void setWk_profile_img1(String wk_profile_img1) {
		this.wk_profile_img1 = wk_profile_img1;
	}
	public String getMem_profile_img() {
		return mem_profile_img;
	}
	public void setMem_profile_img(String mem_profile_img) {
		this.mem_profile_img = mem_profile_img;
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
	public String getRecruit_location() {
		return recruit_location;
	}
	public void setRecruit_location(String recruit_location) {
		this.recruit_location = recruit_location;
	}
	public String getDog_name() {
		return dog_name;
	}
	public void setDog_name(String dog_name) {
		this.dog_name = dog_name;
	}
	public String getRecruit_notices() {
		return recruit_notices;
	}
	public void setRecruit_notices(String recruit_notices) {
		this.recruit_notices = recruit_notices;
	}
	public String getDog_type() {
		return dog_type;
	}
	public void setDog_type(String dog_type) {
		this.dog_type = dog_type;
	}
	public String getWk_id() {
		return wk_id;
	}
	public void setWk_id(String wk_id) {
		this.wk_id = wk_id;
	}
	public String getWalking_id() {
		return walking_id;
	}
	public void setWalking_id(String walking_id) {
		this.walking_id = walking_id;
	}
	public String getReservation() {
		return reservation;
	}
	public void setReservation(String reservation) {
		this.reservation = reservation;
	}
	@Override
	public String toString() {
		return "ChatDTO [chat_date=" + chat_date + ", mem_nickname=" + mem_nickname + ", walker_id=" + walker_id
				+ ", send_nickname=" + send_nickname + ", receive_nickname=" + receive_nickname + ", contents="
				+ contents + ", wk_profile_img1=" + wk_profile_img1 + ", mem_profile_img=" + mem_profile_img
				+ ", walk_date=" + walk_date + ", walk_start_time=" + walk_start_time + ", walk_end_time="
				+ walk_end_time + ", recruit_location=" + recruit_location + ", dog_name=" + dog_name
				+ ", recruit_notices=" + recruit_notices + "]";
	}
	

	
}
