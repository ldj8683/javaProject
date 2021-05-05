package com.mega.mvcProjectMedia;

public class CommentVO {
	private String video_code;
	private String userid;
	private String user_comment;
	private int comment_num;
	private String comment_indate;
	
	public String getVideo_code() {
		return video_code;
	}
	public void setVideo_code(String video_code) {
		this.video_code = video_code;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUser_comment() {
		return user_comment;
	}
	public void setUser_comment(String user_comment) {
		this.user_comment = user_comment;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getComment_indate() {
		return comment_indate;
	}
	public void setComment_indate(String comment_indate) {
		this.comment_indate = comment_indate;
	}

}
