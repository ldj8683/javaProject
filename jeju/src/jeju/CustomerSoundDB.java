package jeju;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CustomerSoundDB {
	public void create(String customer_type, String customer_title, String customer_accommodation_name,
			String customer_date, String customer_writer, String customer_content, int customer_grade)
			throws Exception {
		// 1. 커넥트 연결!
		Class.forName("com.mysql.jdbc.Driver");// 경로위치 확인
		System.out.println("커넥트 연결 성공!"); // 확인 프린트

		// 2. DB연결!
		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";
		// 연결 url 확인
		Connection con = DriverManager.getConnection(url, "root", "1234");
		// DB 주소와 연결 메서드 connection 주소, 아아디, 비밀번호 일치!
		System.out.println("DB연결 성공");

		// 3. SQL문으로 변경
		String sql = "insert into customer_sound values	(null, ?, ?, ?, ?, ?, ?, ?)";
		// SQL문에 맞게 구문 생성!
		PreparedStatement ps = con.prepareStatement(sql);
		// sql 문으로 변경!
		ps.setString(1, customer_type);
		ps.setString(2, customer_title);
		ps.setString(3, customer_accommodation_name);
		ps.setString(4, customer_date);
		ps.setString(5, customer_writer);
		ps.setString(6, customer_content);
		ps.setInt(7, customer_grade);
		// 각 요소에 맞는 값을 넣어준다.
		System.out.println("SQL문으로 변경완료");

		// 4. mySQL db로 전송!
		ps.executeUpdate(); // mySQL 서버로 전송하는 메서드!
		System.out.println("mySQL 서버전송 성공!");

	}

	public ArrayList<CustomerSoundVO> list() throws Exception {
		ArrayList<CustomerSoundVO> list = new ArrayList<CustomerSoundVO>();
		// 1. 커넥트 연결
		Class.forName("com.mysql.jdbc.Driver"); // 경로지정
		System.out.println("연결완료!");
		// 안배운 오류 설정 해결 add ~~, exception 선택!

		// 2. db연결
		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";
		// 연결할 url 입력!
		Connection con = DriverManager.getConnection(url, "root", "1234");
		// 커넥션 메서드로 db연결 drivermanager.getConnenction(3번째꺼 전부 입력하는거)
		System.out.println("db연결 완료!");
		// 3. SQL으로 변경
		String sql = "select * from customer_sound order by customer_no desc";
		// 먼저 sql문 만들기! order by 컬럼명 desc 내림차순 정리!
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("SQL문 완성!");
		// sql문으로 변환하기!
		
		// 4. 서버로 전송 및 반환
		ResultSet rs = ps.executeQuery();
		// 리드 리스트 반환값이 있는 애들은  쿼리문을 사용!
		System.out.println("서버전송 성공!");
		//쿼기문은 true와 false로 나온다!
		
		//반복문을 통해 다수의 데이터를 가져온다(게시판 같은 한번에 많은 데이터를 가져와야할때 반복문 사용!
		while (rs.next()) {//rs문이 참일때를 의미 loop 루프문으로 사용!
			int customer_no = rs.getInt(1);
			String customer_type = rs.getString(2);
			String customer_title = rs.getString(3);
			String customer_accommodation_name = rs.getString(4);
			String customer_date = rs.getString(5);
			String customer_writer = rs.getString(6);
			int customer_grade = rs.getInt(8);
			// 가져올 값에 대한 변수를 지정!
			
			//가방 만들어주기!
			CustomerSoundVO bag = new CustomerSoundVO();
			bag.setCustomer_no(customer_no);
			bag.setCustomer_type(customer_type);
			bag.setCustomer_title(customer_title);
			bag.setCustomer_accommodation_name(customer_accommodation_name);
			bag.setCustomer_date(customer_date);
			bag.setCustomer_writer(customer_writer);
			bag.setCustomer_grade(customer_grade);
			// 가방에 각 값 넣어주기!
			
			// list만들어서 가방 전부 넣어주기! 가장위에 반복문 전에 변수로 선언해주기!
			list.add(bag); // bag으로 받은 값들을 전부 list에 넣어주기!
			
		}
		System.out.println(list.size()); // 리스트 안에 갯수가 잘 들어가 있는지 확인 하는 프린트!
		return list; // 리턴값은 list의 타입인 arraylist<입력받은 변수(bag)의 타입>이다!
	}
	public CustomerSoundVO read(int customer_no) throws Exception {//리턴받는 bag의 타입을 void 위치에 넣기!
		//1. 연결하기!
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("연결성공!"); // 확인!
		//2. DB연결하기
		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";
		//url 구문변수에 넣고 코딩 짧게 만들기!
		Connection con = DriverManager.getConnection(url, "root", "1234");
		//connection 메서드 사용!
		System.out.println("DB연결완료"); // 확인
		//3. SQL문 만들기!
		String sql = "select * from customer_sound where customer_no = ?";
		// sql문 변수로 만들어 놓기!
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, customer_no);
		// preparedStatement 메서드 사용해서 ps에 SQL로 변환된 구문 넣기!
		System.out.println("SQL문 완성!");
		//4. DB서버로 전송!
		ResultSet rs = ps.executeQuery(); // 가져오는 값은 resultset -> 익스큐트쿼리문 사용!
		System.out.println("DB서버 전공 성공!");
		
		// 가방에 각 노출값 넣기! bag은 VO 메서드
		CustomerSoundVO bag = new CustomerSoundVO();
		if (rs.next()) { // rs.next는 true, false 값이고 해당 조건은 true일때이다!
			// 가져와야하는 값을 전부 bag에 넣어준다!
			int customer_no1 = rs.getInt(1);
			String customer_type = rs.getString(2);
			String customer_title = rs.getString(3);
			String customer_accommodation_name = rs.getString(4);
			String customer_date = rs.getString(5);
			String customer_writer = rs.getString(6);
			String customer_content = rs.getString(7);
			int customer_grade = rs.getInt(8);
			// 변수에 먼저 담아둔 후 bag에 담기!
			bag.setCustomer_no(customer_no1);
			bag.setCustomer_type(customer_type);
			bag.setCustomer_title(customer_title);
			bag.setCustomer_accommodation_name(customer_accommodation_name);
			bag.setCustomer_date(customer_date);
			bag.setCustomer_writer(customer_writer);
			bag.setCustomer_content(customer_content);
			bag.setCustomer_grade(customer_grade);
			// 각각의 가방에 담기!
		}
		return bag;
	}
	public void update(CustomerSoundVO bag) throws Exception {// cud는 가져오는 값이 없기 때문에 void사용!
		//1. 연결하기!
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("연결확인");
		//2. DB연결하기
		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("DB연결완료");
		//3. SQL문 변경하기!
		String sql = "update customer_sound set customer_type = ?, customer_title = ?, customer_accommodation_name = ?, customer_content = ?, customer_grade = ? where customer_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bag.getCustomer_type());
		ps.setString(2, bag.getCustomer_title());
		ps.setString(3, bag.getCustomer_accommodation_name());
		ps.setString(4, bag.getCustomer_content());
		ps.setInt(5, bag.getCustomer_grade());
		ps.setInt(6, bag.getCustomer_no());
		System.out.println("SQL문 변경 및 입력 완료!");
		//4. 서버전송하기!
		ps.executeUpdate();
		System.out.println("서버전송완료!");
		
	}
	public void delete(int customer_no) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("연결성공!");
		
		String url = "jdbc:mysql://localhost:3306/jeju"; // 입력값이 숫자라서 인코딩 불필요!
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("db연결 성공!");
		
		String sql = "delete from customer_sound where customer_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, customer_no);
		System.out.println("SQL문 변경 완료!");
		
		ps.executeUpdate();
		System.out.println("서버전송 완료!");
		
	}
}
