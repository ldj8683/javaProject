package com.mega.mvcProjectMedia;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.SessionAttribute;
//import org.springframework.web.bind.annotation.SessionAttributes;

//import com.mega.mvc40.UserInfoVO;

@Controller
public class UserInfoController {
	// 기능별 메서드
	
	@Autowired
	UserInfoDAO dao;
	
	@Autowired
	ResentVideoDAO dao_resent;
	
	@Autowired
	SportVideoDAO dao_sport;
	
	// 테스트할떄 사용
	@RequestMapping("UserInformation")
	public void UserInformation(UserInfoVO bag, Model model) throws Exception{
		UserInfoVO vo = dao.UserInformation(bag);
		System.out.println(vo.getUserid());
		model.addAttribute("vo", vo);
	}
	
	// 회원정보를 보여줍니다.
	@RequestMapping("UserInformation2")
	public void UserInformation2(UserInfoVO bag, ResentVideoVO bag2, Model model, Model model2, HttpSession session) throws Exception{
		// 로그인을 한 상태여야 하기 때문에 로그인 세션의 id를 가져옵니다.
		String loginId = (String)session.getAttribute("userId");
		System.out.println(loginId);
		// 가져온 id를 DTO를 이용해서 SQL문으로 보내줍니다.
		bag.setUserid(loginId);
		// 위의 아이디를 이용해서 가져온 데이터를 vo1에 저장해줍니다.
		UserInfoVO vo1 = dao.UserInformation2(bag);
		// 확인을 해줍니다.
		System.out.println(vo1.getUserid());
		//model을 이용해서 UserInformation2.jsp에서 출력을 해줍니다.
		model.addAttribute("vo1", vo1);
		
		// 위에 세션을 잡은 아이디를 ResentVideoVO에 넣어줍니다.
		bag2.setRvid(loginId);
		// 위에 넣어준 bag2의 id를 이용해서 RESENT_VIDEO 테이블에 있는지를 확인을 해줍니다.
		int result = dao_resent.checkDb(bag2);
		System.out.println(result);
		// RESENT_VIDEO 테이블에 있다고 하면다면 최근 본 동영상을 출력하도록 if문을 이용해서 설정해주었습니다.
		if(result != 0) {
			System.out.println("Resent video >>"  + bag2.getRvid());
			// 최근 본 동영상 데이터들을 list로 가져와 줍니다.
			List<ResentVideoVO> vo2 = dao_resent.read(bag2);
			System.out.println(vo2.get(0));
			// 가져온 list의 데이터들을 출력해주도록 합니다.
			model2.addAttribute("list", vo2);
		}
		
	}
	
	// 메인 페이지에서 Mock Data를 분석을 하기 위해서 사용합니다
	@RequestMapping("userAgeInformation")
	@ResponseBody
	public List<UserInfoVO> userAgeInformation() throws Exception{
		// DB에 저장된 모든 데이터를 JSON 형식으로 가져옵니다.
		List<UserInfoVO> userAgeInformation = dao.userAgeInformation();
		return userAgeInformation;
	}
	
	// 회원 가입을 할때 사용합니다.
	@RequestMapping("create")
	public void create(UserInfoVO bag) throws Exception{
		// 도로명 주소와 상세주소를 하나의 DB 컬럼에 넣기위해서 ", "로 구분을해서 uaddrString변수에 저장해줍니다.
		String uaddrString = bag.getUaddrRoad() + ", " + bag.getUaddrDetail();
		// 저장한 변수를 DTO의 uaddr에 저장해주어서 DB에 insert를 할 때 사용합니다. 
		bag.setUaddr(uaddrString);
		dao.create(bag);
	}
	
	// UpdateValue로 부터 받은 데이터를 이용해서 DB의 내용을 수정해줍니다.
	@RequestMapping("update")
	public void update(UserInfoVO bag) throws Exception{
		// 도로명 주소와 상세 주소를 하나의 DB 컬럼에 넣기 위해서 데이터를 합쳐서 uaddrString이라는 변수에 저장
		String uaddrString = bag.getUaddrRoad() + ", " + bag.getUaddrDetail();
		// 저장된 변수를 DTO의 uaddr에 넣어서 DB에 update를 할 때 저장이 되도록 해줍니다. 
		bag.setUaddr(uaddrString);
		dao.update(bag);
	}
	
	// DeleteValue로부터 받은 데이터를 이용해서 DB의 데이터를 삭제해줍니다.
	@RequestMapping("delete")
	public void delete(UserInfoVO bag) throws Exception{
		dao.delete(bag);
	}
	
	// 회원 탈퇴를 할때 로그인 을 한 상태이기 때문에 로그인 세션을 이용했습니다.
	@RequestMapping("DeleteValue")
	public void DeleteValue(UserInfoVO bag, Model model, HttpSession session) throws Exception{
		// 세션 설정이된 아이디를 loginId 변수에 저장
		String loginId = (String)session.getAttribute("userId");
		// loginId를 DTO에 넣어주어 SQL문에서 사용
		bag.setUserid(loginId);
		
		// id를 이용해서 찾은 데이터를 가져옵니다. 데이터를 가져와서 DeleteValue에 출력을 해주는 이유는
		// 탈퇴를 하기전에 한번더 탈퇴하는 것이 맞는지 정보를 보여주기 위해서 입니다.
		UserInfoVO vo = dao.DeleteValue(bag);
		model.addAttribute("vo", vo);
	}
	
	// 회원 정보를 수정할 때 사용
	@RequestMapping("UpdateValue")
	public void UpdateValue(UserInfoVO bag, Model model, HttpSession session) throws Exception{
		// 회원 정보를 볼때는 해당 정보의 id를 알아야한다.
		// 회원 정보를 볼 경우는 로그인이 되어있는 경우이기 때문이다.
		// 즉, 로그인이 되어서 세션이 설정 되어있기때문에 회원정보를 볼 때 이 세션이 설정된 id를 이용
		String loginId = (String)session.getAttribute("userId");
		System.out.println("수정" + loginId);
		
		// 세션을 이용해서 저장된 id를 DTO의 Userid에 넣어주어서 sql문에서 사용을 해줌.
		bag.setUserid(loginId);
		
		// SQL문을 통해서 가져온 데이터를 vo2에 저장을 해줍니다.
		UserInfoVO vo2 = dao.UpdateValue(bag);
		// 잘 가져왔는지 확인을 해줌
		System.out.println(vo2.getUserid());
		System.out.println(vo2.getUaddr());
		
		// 회원 가입을 할 때 주소가 도로명 주소와 상세 주소를 ', '를 이용해서 하나로 합쳐서 DB에 저장이 됬다.
		// 따라서 수정을 할때는 DB에 저장된 주소데이터를 도로명과 상세주소로 나누어 주어야한다.
		// 나누어 줄때 변수를 선언해서 split 함수를 이용해서 ", "를 기준으로 나누어줍니다.
		String tempAddr = vo2.getUaddr();
		String tempAddrRoad = tempAddr.split(", ")[0];
		String tempAddrDetail = tempAddr.split(", ")[1];
		// 잘 나누어져있는지 확인을 합니다.
		System.out.println(tempAddrRoad);
		System.out.println(tempAddrDetail);
		// 확인된 도로명 주소와 상세 주소를 가져온 DTO에 넣어줍니다.
		vo2.setUaddrRoad(tempAddrRoad);
		vo2.setUaddrDetail(tempAddrDetail);
		
		// Model을 이용해서 DB로부터 받은 데이터를 수정을 하는 페이지로 넘겨 줍니다.
		model.addAttribute("vo2", vo2);
	}
	
	// 로그인을 할때 DTO를 이용해서 로그인 form에서 아이디와 패스워드를 넘겨받아서 DAO를 통해서 DB로 이동해서
	// 로그인을 요청한 아이디와 패스워드를 찾아서 그것에 해당하는 데이터가 있는지를 확인합니다.
	@RequestMapping("userLogin")
	public String userLogin(UserInfoVO bag, HttpSession session) throws Exception{
		UserInfoVO vo = dao.userLogin(bag);
		// 데이터가 있다면 아래 구문을 수행합니다. System.out.println은 넘어온 데이터들을 확인하기 위한 확인용입니다.
		if(vo != null) {
			System.out.println("해당 id/pw가 있음.");
			System.out.println("입력받은 id: " + bag.getUserid());
			System.out.println("입력받은 pw: " + bag.getUpw());
			// 로그인이 되었을 경우 세션을 잡아줍니다.
			session.setAttribute("userId", vo.getUserid());
			// 세션을 설정하고 redirect를 이용해서 로그인이 성공했음을 알려주는 페이지가 아닌 메인페이지로 바로 돌아갑니다.
			return "redirect:MainPage.jsp";
		} else {
			// 로그인에 실패했을 경우 다시 로그인을 해야하기때문에 로그인페이지로 돌아가도록 합니다.
			System.out.println("해당 id/pw가 없음.");
			return "redirect:UserLogin.jsp";
		}
	}
	
	// 아이디 중복 여부를 확인
	@RequestMapping("checkUserId")
	@ResponseBody	// 중복 여부를 확인한 결과를 해당 페이지로 가져옴
	public int checkUserId(UserInfoVO bag) throws Exception {
		// 아이디가 있는지 여부를 확인하하는 sql문이 1이나 0으로 오기때문에 정수형으로 선언
		int result = dao.checkUserId(bag);
		// 결과값을 반환을 해줌(1, 0)
		return result;
	}
	
	// MockData를 넣어줌
	@RequestMapping("insertUserId")
	public void insert2(UserInfoVO bag) throws Exception{
		dao.create2(bag);
	}
	
}
