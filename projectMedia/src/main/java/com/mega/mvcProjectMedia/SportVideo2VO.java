package com.mega.mvcProjectMedia;

public class SportVideo2VO {
	int vnum;
	String vvideo;
	String title;
	String image;
	String vdate1;
	String userid;
	String futurevideo;
	String word;
	int clicks;
	int good;
	int badd;
	
	

	public int getVnum() {
		return vnum;
	}



	public void setVnum(int vnum) {
		this.vnum = vnum;
	}



	public String getVvideo() {
		return vvideo;
	}



	public void setVvideo(String vvideo) {
		this.vvideo = vvideo;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public String getVdate1() {
		return vdate1;
	}



	public void setVdate1(String vdate1) {
		this.vdate1 = vdate1;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public String getFuturevideo() {
		return futurevideo;
	}



	public void setFuturevideo(String futurevideo) {
		this.futurevideo = futurevideo;
	}



	public String getWord() {
		return word;
	}



	public void setWord(String word) {
		this.word = word;
	}



	public int getClicks() {
		return clicks;
	}



	public void setClicks(int clicks) {
		this.clicks = clicks;
	}



	public int getGood() {
		return good;
	}



	public void setGood(int good) {
		this.good = good;
	}



	public int getBadd() {
		return badd;
	}



	public void setBadd(int badd) {
		this.badd = badd;
	}



	// ë©”ì„œ?“œ
    void output() {
        System.out.println("vnum : " + vnum + ", vvideo : " + vvideo + ", title : " + title + ", image : " + image + ", vdate1 : " + vdate1  + ",  clicks : " + clicks + ", good : " + good + ", badd : " + badd);
    }



	@Override
	public String toString() {
		return "SportVideo2VO [vnum=" + vnum + ", vvideo=" + vvideo + ", title=" + title + ", image=" + image
				+ ", vdate1=" + vdate1 + ", userid=" + userid + ", futurevideo=" + futurevideo + ", word=" + word
				+ ", clicks=" + clicks + ", good=" + good + ", badd=" + badd + "]";
	}

	
	
	
	
	
}	
