package com.mega.mvcProjectMedia;

public class EnquiriesVO {
	private String enumber;
	private String userid;
	private String etitle;
	private String edate;
	private String edetails;

	public String getEnumber() {
		return enumber;
	}

	public void setEnumber(String enumber) {
		this.enumber = enumber;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getEtitle() {
		return etitle;
	}

	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getEdetails() {
		return edetails;
	}

	public void setEdetails(String edetails) {
		this.edetails = edetails;
	}

	@Override
	public String toString() {
		return "EnquiriesVO [enumber=" + enumber + ", userid=" + userid + ", etitle=" + etitle + ", edate=" + edate
				+ ", edetails=" + edetails + "]";
	}

}
