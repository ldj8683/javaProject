package com.mega.mvcProjectMedia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.mega.mvc1000.SportVideo2VO;
//import com.mega.mvc1000.WatchedVideoVO;

@Controller
public class SportVideo2Controller {
   
   @Autowired
   SportVideo2DAO dao1;
   
   @Autowired
   WatchedVideoDAO dao2;
   
   @RequestMapping("all")
   public void all(SportVideo2VO vo, Model model) {      
      List<SportVideo2VO> list = dao1.all();   

      System.out.println("all 목록?   개수 : " + list.size() + "개의 목록의 개수");
      model.addAttribute("list", list);
      System.out.println(list.get(0));
      System.out.println(list.get(0).image);
      System.out.println(list);
   }
   @RequestMapping("search")
   public void all3(SportVideo2VO sportVideo2VO, Model model) {
	   System.out.println(sportVideo2VO.getWord());
      List<SportVideo2VO> list = dao1.search(sportVideo2VO);
      System.out.println("all3 목록의개수 : " + list.size() + "개의 목록의 개수");
      model.addAttribute("list", list);
      System.out.println(list.get(0));
   }
   
   @RequestMapping("select")
   public void select(SportVideo2VO sportVideo2VO, WatchedVideoVO vo1, Model model) throws Exception {      
      SportVideo2VO vo = dao1.read(sportVideo2VO);      
      model.addAttribute("vo", vo);      
      System.out.println(vo);
      dao2.create(vo1);
      /* model.addAttribute("vo1",vo1); */
      
   }
   
   @RequestMapping("future")
   public void update(WatchedVideoVO vo, Model model) throws Exception {
      System.out.println(vo);
      model.addAttribute("FutureVideoVO", vo);
      dao2.update(vo);      
   }
   
   @RequestMapping("myvideo")
   public void all2(SportVideo2VO sportVideo2VO, Model model) {
      List<SportVideo2VO> list1 = dao1.past1(sportVideo2VO);
      System.out.println("목록의  개수: " + list1.size() + "개의 목록의 개수");
      model.addAttribute("list1", list1);
      System.out.println(list1.get(0));
      
      List<SportVideo2VO> list2 = dao1.past2(sportVideo2VO);
      System.out.println("목록의  개수: " + list2.size() + "개의 목록의 개수");
      model.addAttribute("list2", list2);
      
      List<SportVideo2VO> list3 = dao1.future1(sportVideo2VO);
      model.addAttribute("list3", list3);   
   }
}
