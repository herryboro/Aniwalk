package kr.pandorabox.aniwalk.chat;


public class ChatDTO {
	private String chat_date;
	private String mem_nickname;
	private String walker_id;
	private String send_nickname;
	private String receive_nickname;
	private String contents;
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
	@Override
	public String toString() {
		return "ChatDTO [chat_date=" + chat_date + ", mem_nickname=" + mem_nickname + ", walker_id=" + walker_id
				+ ", send_nickname=" + send_nickname + ", receive_nickname=" + receive_nickname + ", contents="
				+ contents + "]";
	}
	
	
}
