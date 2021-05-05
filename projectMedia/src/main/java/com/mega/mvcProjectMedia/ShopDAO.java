package com.mega.mvcProjectMedia;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component // ShopDAO dao = new ShopDAO(); 한개만 객체 생성!, 싱글톤!
public class ShopDAO {
	// myBatis싱글톤 주소를 주입!
	@Autowired
	SqlSessionTemplate my;

	public void create(ShopVO bag) throws Exception {
		//         mapper파일의 namespace이름.태그의id와 일치해야함.
		//         <mapper namespace="member">
		//		      <select id ="insert">
		my.insert("shop.insert", bag);
	}
	
	public List<ShopVO> all() {
		return my.selectList("shop.all");	
	}
	
	public void update(ShopVO bag) throws Exception {
		my.update("shop.update", bag);
	}
	
	public void upgrade(ShopVO bag) throws Exception {
		my.update("shop.upgrade", bag);
	}
}
