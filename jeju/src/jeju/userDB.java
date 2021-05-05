package jeju;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class userDB {

	public void create(userVO bag) throws Exception { //입력받은 데이터를 가방에 넣어서 주기때문에 userVO bag이 입력값

		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공.");

		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";

		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db연결성공.");

		String sql = "insert into user_information values(?,?,?,?,?,?,?)"; //user_information 테이블에 7개의 값들을 insert
		PreparedStatement ps = con.prepareStatement(sql); // sql문 인식

		ps.setString(1, bag.getId());  //user_information에 설정되어있는 칼럼순서대로 insert   //가방에서 id를 꺼내 꺼낸값을 value로 insert시킴
		ps.setString(2, bag.getPw()); //가방에서 pw를 꺼내 꺼낸값을 value로 insert시킴
		ps.setString(3, bag.getName()); //가방에서 name를 꺼내 꺼낸값을 value로 insert시킴
		ps.setString(4, bag.getTel()); //가방에서 tel를 꺼내 꺼낸값을 value로 insert시킴
		ps.setString(5, bag.getEmail()); //가방에서 email를 꺼내 꺼낸값을 value로 insert시킴
		ps.setString(6, bag.getAddr()); //가방에서 addr를 꺼내 꺼낸값을 value로 insert시킴
		ps.setString(7, bag.getBirth()); //가방에서 birth를 꺼내 꺼낸값을 value로 insert시킴
		System.out.println("3. sql문을 만들기 성공.");

		ps.executeUpdate();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공.");

	}// create
	
	public userVO read(String id) throws Exception {  //입력값을 id로 해서 read 메서드 실행시킬 것. 반환값은 userVO로 가방에 넣어 반환.
	
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");


		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db연결 성공. <br>");

		String sql = "select * from user_information where id = ?"; //id가 ?인 데이터를 user_information 테이블에서 검색
		PreparedStatement ps = con.prepareStatement(sql);
		// sql인식하게 만들어주는 것 (java sql)
		ps.setString(1, id); //id는 입력값으로 ?자리에 입력
		System.out.println("3. sql문을 만들기 성공. <br>");


		ResultSet rs = ps.executeQuery();
		//read는  executeupdate 아니고 query임
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");
		
		// 1.검색결과가 있는지 체크해야한다.
		//System.out.println(rs.next()); //true = 있다, false = 없다.
		
		// 2.만약에 결과가 있으면, 테이블에서 원하는 데이터 항목을 꺼내온다.
		
		userVO bag = new userVO();  //데이터를 담을 가방 생성
		if (rs.next()) { //rs.next값이 true(있다)일 경우
			String id2 = rs.getString(1); //데이터값을 변수에 넣어줌
			String pw = rs.getString(2); 
			String name = rs.getString(3);
			String tel = rs.getString(4);
			String email = rs.getString(5);
			String addr = rs.getString(6);
			String birth = rs.getString(7);
			bag.setId(id2);  //변수로 넣어 가져온 데이터값들을 가방에 넣어줌
			bag.setPw(pw);
			bag.setName(name);
			bag.setTel(tel);			
			bag.setEmail(email);			
			bag.setAddr(addr);			
			bag.setBirth(birth);			
		}
		return bag; //가방으로 결과값 반환

	}//read
	
	public void update(userVO bag) throws Exception {  //입력값이 데이터가 모여있는 가방으로 update메서드 실행
		
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");
		
		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db연결 성공. <br>");

	
		String sql = "update user_information set pw =?, name =?, tel =?, email =?, addr =?, birth =? where id =?"; //id가 조건인 데이터의 다른 칼럼값들을 set시킴
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, bag.getPw()); //왼쪽부터 순서대로 가방에서 데이터 꺼내와 입력
		ps.setString(2, bag.getName());
		ps.setString(3, bag.getTel());
		ps.setString(4, bag.getEmail());
		ps.setString(5, bag.getAddr());
		ps.setString(6, bag.getBirth());
		ps.setString(7, bag.getId());
		System.out.println("3. sql문을 만들기 성공. <br>");

		ps.executeUpdate();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");
		
		
	}//update
	

	public void delete(String id) throws Exception {  //입력값을 id로 받아 delete메서드 실행
		

		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");

		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";

		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db연결성공. <br>"); 

		String sql = "delete from user_information where id = ?"; //id가 조건인 데이터를 delete
		PreparedStatement ps = con.prepareStatement(sql); // sql문 인식

		ps.setString(1, id); // id조건에 입력 id 넣어주기
	
		System.out.println("3. sql문을 만들기 성공. <br>");

		ps.executeUpdate();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");

	}// delete

	public boolean check(String id, String pw) throws Exception { //id,pw 입력값을 가져와 check 메서드 실행. 반환값은 boolean으로 결과값이 true나 false.
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");

		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";

		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db연결성공. <br>");

		String sql = "select * from user_information where id = ? and pw = ?";  //입력된 데이터의 id 와  pw가 일치하는것을 select
		PreparedStatement ps = con.prepareStatement(sql); // sql문 인식
		ps.setString(1, id);
		ps.setString(2, pw);
		System.out.println("3. sql문을 만들기 성공. <br>");

		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");

		boolean result = false; // result라는 boolean변수 생성 및 값 초기화. 
		

		if (rs.next()) { // rs.next()로 찾는 데이터값들이 있으면 
			result = true;  //result값을 true로 입력
		}
		return result; //result 반환
	} // check


}// class
