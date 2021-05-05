package com.mega.mvcProjectMedia;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ResentVideoDAO {
	@Autowired
	SqlSessionTemplate my;
	public void createResent(ResentVideoVO bag) {
		my.insert("resent_video.insert", bag);
	}
	
	public List<ResentVideoVO> read(ResentVideoVO bag) {
		return my.selectList("resent_video.read", bag);
	}
	
	public int checkDb(ResentVideoVO bag) throws Exception{
		int result = my.selectOne("resent_video.checkDb", bag);
		return result;
	}
}
