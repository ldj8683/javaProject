package com.mega.mvcProjectMedia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PaymentController {

	@Autowired
	PaymentDAO dao;

	@Autowired
	PaymentDAO dao2;

	@RequestMapping("paymentInsert5")
	public void insert(PaymentVO paymentVO) throws Exception {
		dao.create(paymentVO);
	}

	@RequestMapping("paymentSelect5")
	public void select(PaymentVO paymentVO, Model model) {
		CartVO vo = dao.read(paymentVO);
		model.addAttribute("vo", vo);
	}

	@RequestMapping("paymentAll5")
	public void all(Model model) {
		List<PaymentVO> list = dao.all();
		System.out.println("목록의 개수: " + list.size() + "개의 목록이 있음.===================");
		model.addAttribute("list", list);
	}
	
	@RequestMapping("paymentDelete5")
	public void delete(PaymentVO paymentVO) throws Exception {
		dao.delete(paymentVO);
	}

}
