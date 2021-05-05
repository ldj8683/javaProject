package com.mega.mvcProjectMedia;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class NoticeDAO {
	
	@Autowired
	SqlSessionTemplate my; //mybasket + 변수 생성
	
	public void create(NoticeVO bag) throws Exception {
		my.insert("notice.insert", bag);
	}
	
	public NoticeVO read(NoticeVO bag) {
		NoticeVO vo = my.selectOne("notice.select", bag);
	    return vo;
    }
	public List<NoticeVO> all() {
		return my.selectList("notice.all");
	}
	public void update(NoticeVO bag) throws Exception {
		my.update("notice.update", bag);
	}	
	public void delete(NoticeVO bag) throws Exception {
		my.delete("notice.delete", bag);
	}
	
}