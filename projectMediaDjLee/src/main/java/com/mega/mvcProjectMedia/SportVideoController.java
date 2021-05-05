package com.mega.mvcProjectMedia;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



//import com.mega.mvc1000.SportVideoVO;

@Controller // 어노테이션, 표시
public class SportVideoController {

	@Autowired
	SportVideoDAO dao; // 싱글톤으로 만들어진 객체의 주소를 넣어주세요.
	
	// 이대준- 최근 본 영상에서 사용
	@Autowired
	ResentVideoDAO dao2;
	
	@RequestMapping("video_list_search")
	public void search(String video_category, Model model, Model model1, String nowPage, String cntPerPage)
			throws Exception {
		int total = dao.countvideo(video_category);
		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), video_category);
		System.out.println("목록의 개수: " + total + "개의 목록이 있음.============");
		model1.addAttribute("nae", video_category);
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", dao.selectvideo(vo));
		System.out.println(nowPage + " : " + cntPerPage);

	}
	
	@RequestMapping("Videopaging")
	public void search_paging(String video_category, Model model, Model model1, Model model12, String nowPage, String cntPerPage)
			throws Exception {
		int total = dao.countvideo(video_category);
		List<SportVideoVO> list = dao.read();
		PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), video_category);
		System.out.println("목록의 개수: " + total + "개의 목록이 있음.============");
		model1.addAttribute("nae", video_category);
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", dao.selectvideo(vo));
		System.out.println(nowPage + " : " + cntPerPage);
		model12.addAttribute("list", list);
	}

	@RequestMapping("video_recently")
	public void read(Model model) throws Exception {
		List<SportVideoVO> list = dao.read();
		System.out.println("--------목록의 개수: " + list.size() + "개의 목록이 있음.============");
		model.addAttribute("list", list);
	}

	@RequestMapping("comment.insert")
	public void insert(CommentVO bag) throws Exception {
		dao.create(bag);

	}

	// 이대준 - ResentVideoVO bag2, HttpSession session 추가
	@RequestMapping("Videoplay")
	public void read_com(String video_code, Model model, Model model1, ResentVideoVO bag2, HttpSession session) throws Exception {
		System.out.println("----------------"+ video_code);
		List<CommentVO> list = dao.read_com(video_code);
		System.out.println("목록의 개수: " + list.size() + "개의 목록이 있음.============");
		dao.increaseView(video_code);
		SportVideoVO bag = dao.selectone(video_code);
		if (list.size() != 0) {
			model.addAttribute("list", list);
		} else {
		}
		model1.addAttribute("vol",bag);
		
		// 이대준 - 최근 본 동영상에 추가가 되는 부분
		// 세션을 이용해서 현재 로그인 중인 아이디를 가져와서 최근 본 동영상의 DTO에 아이디를 저장해줍니다.
		// 또한 동영상이 저장된 테이블의 번호를 가져와서 최근본 동영상 DTO에 넣어줍니다.
		String loginId = (String)session.getAttribute("userId");
		if(loginId != null) {
			System.out.println(loginId);
			bag2.setVideonum(bag.getVideo_num());
			bag2.setRvid(loginId);
			System.out.println(bag2.getVideonum());
			// 아이디와 동영상번호가 들어간 DTO를 이용해서 SQL문을 이용해서 최근본 동영상 DB에 저장을 해줍니다.
			dao2.createResent(bag2);
		}
	}

	@RequestMapping("increaseGood")
	public void increaseGood(String video_code) {
		System.out.println("도착함" + video_code);
		dao.increaseGood(video_code);
	}

}
