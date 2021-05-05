package com.mega.mvcProjectMedia;

import java.util.Date;

//import org.springframework.format.annotation.DateTimeFormat;

public class ResentVideoVO {
	private String rvid;
	private int videonum;
	private Date rvdate;
	
	// SQL문의 조인을 이용해서 가져온 데이터들이 저장될 DTO 변수들을 생성해줍니다.
	private String video_img;
	private String video_name;
	private String video_code;
	public String getVideo_img() {
		return video_img;
	}
	public void setVideo_img(String video_img) {
		this.video_img = video_img;
	}
	public String getVideo_name() {
		return video_name;
	}
	public void setVideo_name(String video_name) {
		this.video_name = video_name;
	}
	public String getVideo_code() {
		return video_code;
	}
	public void setVideo_code(String video_code) {
		this.video_code = video_code;
	}

	
	
	
	public String getRvid() {
		return rvid;
	}

	public void setRvid(String rvid) {
		this.rvid = rvid;
	}

	public int getVideonum() {
		return videonum;
	}

	public void setVideonum(int videonum) {
		this.videonum = videonum;
	}

	public Date getRvdate() {
		return rvdate;
	}

	public void setRvdate(Date rvdate) {
		this.rvdate = rvdate;
	}
	
	
}
