package com.mega.mvcProjectMedia;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


//import com.mega.mvcProjectTest.SportVideoVO;

//import com.mega.mvc1000.SportVideoVO;

@Component //MemberDAO dao = new MemberDAO(); 한개만 객체 생성!, 싱글톤!
public class SportVideoDAO {

	//myBatis싱글톤 주소를 주입!
	@Autowired
	SqlSessionTemplate my;
	
	public List<SportVideoVO> read() throws Exception {
		return my.selectList("sportvideo.select");
		
	}
	
	public List<SportVideoVO> search(String video_category) throws Exception {
		return my.selectList("sportvideo.search", video_category);
		
	}
	
	public void create(CommentVO bag) throws Exception {
		my.insert("com.insert", bag);
	}
	
	
	public List<CommentVO> read_com(String video_code) throws Exception {
		return my.selectList("com.search", video_code);
		
	}
	public SportVideoVO selectone(String video_code) throws Exception {
		return my.selectOne("sportvideo.selectone", video_code);
		
	}
	
	public void increaseView(String video_code) {
		my.update("sportvideo.increaseview", video_code);
		
	}
	
	public void increaseGood(String video_code) {
		my.update("sportvideo.increasegood", video_code);
		
	}
	
	public int countvideo(String video_category) {
		return my.selectOne("sportvideo.sportcount", video_category);
		}


	public List<SportVideoVO> selectvideo(PagingVO vo) {
		return my.selectList("sportvideo.searchpaging", vo);
	}
	
	
//	// 이대준 사용할 추가 부분
//	public List<SportVideoVO> VideoTest() throws Exception {
//		return my.selectList("sportPlayer.VideoTest");
//	}
//	
//	public SportVideoVO VideoDetail(SportVideoVO bag) throws Exception{
//		return my.selectOne("sportPlayer.VideoDetail", bag);
//	}
	

}