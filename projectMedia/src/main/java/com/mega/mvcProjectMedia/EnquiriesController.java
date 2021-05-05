package com.mega.mvcProjectMedia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EnquiriesController {

	@Autowired
	EnquiriesDAO dao;

	@Autowired
	EnquiriesDAO dao2;

	@RequestMapping("enquiriesInsert3")
	public void insert(EnquiriesVO enquiriesVO) throws Exception {
		dao.create(enquiriesVO);
	}

	@RequestMapping("enquiriesSelect3")
	public void select(EnquiriesVO enquiriesVO, Model model) {
		EnquiriesVO vo = dao.read(enquiriesVO);
		model.addAttribute("vo", vo);
	}

	@RequestMapping("enquiriesAll3")
	public void all(Model model) {
		List<EnquiriesVO> list = dao.all();
		System.out.println("목록의 개수: " + list.size() + "개의 목록이 있음.===================");
		model.addAttribute("list", list);
	}
	
	@RequestMapping("enquiriesUpdate3")
	public void update(EnquiriesVO enquiriesVO) throws Exception {
		dao.update(enquiriesVO);
	}
	
	@RequestMapping("enquiriesDelete3")
	public void delete(EnquiriesVO enquiriesVO) throws Exception {
		dao.delete(enquiriesVO);
	}

}
