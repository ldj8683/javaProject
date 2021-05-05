package com.mega.mvcProjectMedia;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class CartDAO {
	
	@Autowired
	SqlSessionTemplate my; //mybasket + 변수 생성
	
	public void create(CartVO bag) throws Exception {
		my.insert("cart.insert", bag);
	}
	
	public CartVO read(CartVO bag) {
		CartVO vo = my.selectOne("cart.select", bag);
	    return vo;
    }
	public List<CartVO> all() {
		return my.selectList("cart.all");
	}	
	public void delete(CartVO bag) throws Exception {
		my.delete("cart.delete", bag);
	}
	
}