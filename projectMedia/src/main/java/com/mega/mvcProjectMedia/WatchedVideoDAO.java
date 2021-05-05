package com.mega.mvcProjectMedia;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component
public class WatchedVideoDAO {

	
	@Autowired
	  SqlSessionTemplate my;
	
	public void create(WatchedVideoVO bag) throws Exception {
		my.insert("video1.insert", bag);
	}
	
	public void update(WatchedVideoVO bag) throws Exception {
		my.insert("video1.update", bag);
	}
	
	
}
