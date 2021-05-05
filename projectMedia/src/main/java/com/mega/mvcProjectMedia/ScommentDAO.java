package com.mega.mvcProjectMedia;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component // ShopDAO dao = new ShopDAO(); 한개만 객체 생성!, 싱글톤!
public class ScommentDAO {
	// myBatis싱글톤 주소를 주입!
	@Autowired
	SqlSessionTemplate my;

	public void create(ScommentVO bag) throws Exception {
		//         mapper파일의 namespace이름.태그의id와 일치해야함.
		//         <mapper namespace="member">
		//		      <select id ="insert">
		my.insert("scomment.insert", bag);
	}
	
	public List<ScommentVO> all() {
		return my.selectList("scomment.all");	
	}
	
	public void delete(ScommentVO bag) {
		my.delete("scomment.delete", bag);
	}
}
