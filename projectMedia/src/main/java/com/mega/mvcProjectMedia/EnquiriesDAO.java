package com.mega.mvcProjectMedia;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class EnquiriesDAO {
	
	@Autowired
	SqlSessionTemplate my; //mybasket + 변수 생성
	
	public void create(EnquiriesVO bag) throws Exception {
		my.insert("enquiries.insert", bag);
	}
	
	public EnquiriesVO read(EnquiriesVO bag) {
		EnquiriesVO vo = my.selectOne("enquiries.select", bag);
	    return vo;
    }
	public List<EnquiriesVO> all() {
		return my.selectList("enquiries.all");
	}
	public void update(EnquiriesVO bag) throws Exception {
		my.update("enquiries.update", bag);
	}	
	public void delete(EnquiriesVO bag) throws Exception {
		my.delete("enquiries.delete", bag);
	}
	
}