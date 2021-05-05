package com.mega.mvcProjectMedia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component
public class SportVideo2DAO {
	
	@Autowired
    SqlSessionTemplate my;
  
  public List<SportVideo2VO> all() {
     return my.selectList("video.all");   
  }
  
  public List<SportVideo2VO> search(SportVideo2VO bag) {
	  System.out.println("DAO"+bag.getWord());
     return my.selectList("video.search", bag);   
  }
     
  public SportVideo2VO read(SportVideo2VO bag) {
     SportVideo2VO vo = my.selectOne("video.select", bag);
     return vo;
  }
  
  public List<SportVideo2VO> past1(SportVideo2VO bag) {
     return my.selectList("video.past1", bag);   
  }
  
  public List<SportVideo2VO> past2(SportVideo2VO bag) {
     return my.selectList("video.past2", bag);   
  }
  
  public List<SportVideo2VO> future1(SportVideo2VO bag) {
     return my.selectList("video.future1", bag);   
  }
  

}