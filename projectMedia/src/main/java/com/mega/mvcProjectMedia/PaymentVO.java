package com.mega.mvcProjectMedia;

public class PaymentVO {
	private String pnumber;
	private String userid;
	private String pname;
	private String ptel;
	private String pdate;
	private String ppayment;
	private String pproduct;
	private String pcode;
	private String pquantity;

	public String getPnumber() {
		return pnumber;
	}

	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPtel() {
		return ptel;
	}

	public void setPtel(String ptel) {
		this.ptel = ptel;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getPpayment() {
		return ppayment;
	}

	public void setPpayment(String ppayment) {
		this.ppayment = ppayment;
	}

	public String getPproduct() {
		return pproduct;
	}

	public void setPproduct(String pproduct) {
		this.pproduct = pproduct;
	}

	public String getPcode() {
		return pcode;
	}

	public void setPcode(String pcode) {
		this.pcode = pcode;
	}

	public String getPquantity() {
		return pquantity;
	}

	public void setPquantity(String pquantity) {
		this.pquantity = pquantity;
	}

	@Override
	public String toString() {
		return "PaymentVO [pnumber=" + pnumber + ", userid=" + userid + ", pname=" + pname + ", ptel=" + ptel
				+ ", pdate=" + pdate + ", ppayment=" + ppayment + ", pproduct=" + pproduct + ", pcode=" + pcode
				+ ", pquantity=" + pquantity + "]";
	}

}
