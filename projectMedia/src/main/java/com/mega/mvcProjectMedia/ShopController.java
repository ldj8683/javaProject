package com.mega.mvcProjectMedia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller //어노테이션, 표시
public class ShopController {
	
	@Autowired
	ShopDAO dao; //싱글톤으로 만들어진 객체의 주소를 넣어주세요.
	
	@RequestMapping("screate")
	public void insert(ShopVO bag) throws Exception {
		dao.create(bag);
	}
	
	@RequestMapping(value= {"sall", "foot", "base", "basket"})
	public void all(Model model) {
		List<ShopVO> list = dao.all();
		model.addAttribute("list", list);
	}
	
	@RequestMapping("supdate")
	public void update(ShopVO bag) throws Exception {
		dao.update(bag);
	}
	
	@RequestMapping("supgrade")
	public void upgrade(ShopVO bag) throws Exception {
		dao.update(bag);
	}
}
