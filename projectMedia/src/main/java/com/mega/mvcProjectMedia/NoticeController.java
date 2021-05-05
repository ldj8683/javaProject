package com.mega.mvcProjectMedia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	@Autowired
	NoticeDAO dao;

	@Autowired
	NoticeDAO dao2;

	@RequestMapping("notiecInsert2")
	public void insert(NoticeVO noticeVO) throws Exception {
		dao.create(noticeVO);
	}

	@RequestMapping("noticeSelect2")
	public void select(NoticeVO noticeVO, Model model) {
		NoticeVO vo = dao.read(noticeVO);
		model.addAttribute("vo", vo);
	}

	@RequestMapping("noticeAll2")
	public void all(Model model) {
		List<NoticeVO> list = dao.all();
		System.out.println("목록의 개수: " + list.size() + "개의 목록이 있음.===================");
		model.addAttribute("list", list);
	}
	
	@RequestMapping("noticeUpdate2")
	public void update(NoticeVO noticeVO) throws Exception {
		dao.update(noticeVO);
	}
	
	@RequestMapping("noticeDelete2")
	public void delete(NoticeVO noticeVO) throws Exception {
		dao.delete(noticeVO);
	}

}
