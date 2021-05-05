package com.mega.mvcProjectMedia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {

	@Autowired
	CartDAO dao;

	@Autowired
	CartDAO dao2;

	@RequestMapping("cartInsert4")
	public void insert(CartVO cartVO) throws Exception {
		dao.create(cartVO);
	}

	@RequestMapping("cartAll4")
	public void all(Model model) {
		System.out.println("컨트롤러");
		List<CartVO> list = dao.all();
		System.out.println("목록의 개수: " + list.size() + "개의 목록이 있음.===================");
		model.addAttribute("list", list);
	}
	
	@RequestMapping("cartDelete4")
	public void delete(CartVO cartVO) throws Exception {
		dao.delete(cartVO);
	}

}
