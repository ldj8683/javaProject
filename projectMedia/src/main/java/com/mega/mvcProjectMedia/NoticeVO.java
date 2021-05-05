package com.mega.mvcProjectMedia;

public class NoticeVO {
	private String nnumber;
	private String userid;
	private String ntitle;
	private String ndate;
	private String ndetails;
	
	public String getNnumber() {
		return nnumber;
	}
	public void setNnumber(String nnumber) {
		this.nnumber = nnumber;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	public String getNdetails() {
		return ndetails;
	}
	public void setNdetails(String ndetails) {
		this.ndetails = ndetails;
	}
	@Override
	public String toString() {
		return "NoticeVO [nnumber=" + nnumber + ", userid=" + userid + ", ntitle=" + ntitle + ", ndate=" + ndate
				+ ", ndetails=" + ndetails + "]";
	}
	
}
	
	