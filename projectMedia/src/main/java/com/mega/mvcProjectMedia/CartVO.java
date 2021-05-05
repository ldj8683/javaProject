package com.mega.mvcProjectMedia;

public class CartVO {
	private String cnumber;
	private String userid;
	private String cproduct;
	private String ccode;
	private String cquantity;
	private String cpayment;
	public String getCnumber() {
		return cnumber;
	}
	public void setCnumber(String cnumber) {
		this.cnumber = cnumber;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCproduct() {
		return cproduct;
	}
	public void setCproduct(String cproduct) {
		this.cproduct = cproduct;
	}
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getCquantity() {
		return cquantity;
	}
	public void setCquantity(String cquantity) {
		this.cquantity = cquantity;
	}
	public String getCpayment() {
		return cpayment;
	}
	public void setCpayment(String cpayment) {
		this.cpayment = cpayment;
	}
	@Override
	public String toString() {
		return "CartVO [cnumber=" + cnumber + ", userid=" + userid + ", cproduct=" + cproduct + ", ccode=" + ccode
				+ ", cquantity=" + cquantity + ", cpayment=" + cpayment + "]";
	}
	
	
	
}
