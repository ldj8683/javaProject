package com.mega.mvcProjectMedia;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//import com.mega.mvc40.UserInfoVO;

@Component
public class UserInfoDAO {

	@Autowired
	SqlSessionTemplate my;
	
	//json
	public List<UserInfoVO> userAgeInformation() throws Exception{
		return my.selectList("user_information.userAgeInformation");
	}
	
	// 아이디 중복 여부 확인 (1, 0) 을 반환해서 int로 반환을 해주도록 설정
	public int checkUserId(UserInfoVO bag) throws Exception{
		int result = my.selectOne("user_information.checkUserId", bag);
		return result;
	}
	
	// 테스트
	public UserInfoVO UserInformation(UserInfoVO bag){
		return my.selectOne("user_information.UserInformation", bag);
	}
	
	// 회원 정보를 확인할 때 사용
	public UserInfoVO UserInformation2(UserInfoVO bag){
		return my.selectOne("user_information.UserInformation2", bag);
	}
	
	// 회원정보를 수정할때 그 수정하는 input에 값을 출력해주게 하기 위해서 사용
	//     (이렇게 값을 미리 넣어주면 수정할 부분만 수정을 할 수 있기때문에 효율적이다)
	public UserInfoVO UpdateValue(UserInfoVO bag) throws Exception {
		return my.selectOne("user_information.UpdateValue", bag);
	}
	
	// 삭제를 할 때 한 번더 정보를 확인하기 위해서 사용
	public UserInfoVO DeleteValue(UserInfoVO bag) throws Exception {
		return my.selectOne("user_information.DeleteValue", bag);
	}
	
	// 회원가입을 할때 사용
	public void create(UserInfoVO bag) throws Exception {
		my.insert("user_information.insert", bag);
	}
	
	// MockData를 넣을 때 사용
	public void create2(UserInfoVO bag) throws Exception {
		my.insert("user_information.insert2", bag);
	}
	
	
	// 회원정보를 수정할 때 사용
	public void update(UserInfoVO bag) throws Exception {
		my.update("user_information.update", bag);
	}
	
	// 회원탈퇴를 할 때 사용
	public void delete(UserInfoVO bag) throws Exception {
		my.delete("user_information.delete", bag);
	}
	
	// 로그인을 할 때 사용
	public UserInfoVO userLogin(UserInfoVO bag) throws Exception {
		return my.selectOne("user_information.loginCk", bag);
	}
}
