package com.mega.mvcProjectMedia;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class PaymentDAO {
	
	@Autowired
	SqlSessionTemplate my; //mybasket + 변수 생성
	
	public void create(PaymentVO bag) throws Exception {
		my.insert("payment.insert", bag);
	}
	
	public CartVO read(PaymentVO bag) {
		CartVO vo = my.selectOne("payment.select", bag);
	    return vo;
    }
	public List<PaymentVO> all() {
		return my.selectList("payment.all");
	}	
	public void delete(PaymentVO bag) throws Exception {
		my.delete("payment.delete", bag);
	}
	
}