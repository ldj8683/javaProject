package com.mega.mvcProjectMedia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller //어노테이션, 표시
public class ScommentController {
	
	@Autowired
	ScommentDAO dao; //싱글톤으로 만들어진 객체의 주소를 넣어주세요.
	
	@RequestMapping("ccreate")
	public void insert(ScommentVO bag) throws Exception {
		dao.create(bag);
	}
	
	@RequestMapping("call")
	public void all(Model model) {
		List<ScommentVO> list = dao.all();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("cdelete")
	public void delete(ScommentVO bag) {
		dao.delete(bag);
	}

}
