package jeju;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class notice_board {
	public void create(String title, String date, String writer, String file, String content) throws Exception {
		// 매개변수 전부 넣어줘야한다!
		// 1.커넥트 연결하기
		Class.forName("com.mysql.jdbc.Driver");
		// 커넥트 연결 class는 Class.forName사용! 오류는 해결(아직 안배움)
		System.out.println("연결 확인!"); // 연결되는지 확인하는 프린트
		
		// 2. 커넥트 된것 DB연결하기
		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";
		// url 변수에 내가 연결할 DB의 주소값을 넣는다.
		// 해당 구문은 정해진 구문으로 항상 같게 사용!
		// (jdbc:연결프로그램://주소/db이름) 커넥션 구문(정해진 구문! 항상 저걸 사용해서 연결!)
		Connection con = DriverManager.getConnection(url, "root", "1234");
		// DB연결하는 class -> connection(내가 필요한걸 사용 java.sql)
		// 연갈하는 DB의 주소와 아이디 패스워드 전부 일치해야 연결이 된다.
		System.out.println("DB연결 성공"); // DB연결에 이상이 없는지 확인
		
		// 3. SQL문으로 만들기!
		String sql = "insert into notice_board values (null, ?, ?, ?, ?, ?)";
		// 변수 sql에 SQL문 중 create에 해당하는 insert문을 넣어준다.! table명을 사용!
		// 입력하지 않아도 되는 값이 있을때는 해당 부분에 null이라고 넣어주거나
		// 
		PreparedStatement ps = con.prepareStatement(sql);
		// 변수 con으로 메서드 prepareStatement를 사용해서 변수 sql에 있는 문자열을 SQL문으로 변경!
		ps.setString(1, title); // sql 변수에 입력되는 값을 각가 타입에 맞게 set메서드로 변경
		ps.setString(2, date);
		ps.setString(3, writer);
		ps.setString(4, file);
		ps.setString(5, content);
		System.out.println("SQL문으로 변경완료!"); // SQL문으로 변경위의 내용이 잘 처리되는지 확인
		
		// 4. SQL문을 mySQL 서버로 전송!
		ps.executeUpdate(); // ps의 메서드인 executeUpdate로 mySQL로 전송!
		System.out.println("전송완료!"); // 전송과정 문제 확인 출력!
		
	}

	public Notice_BoardVO read(int no) throws Exception {//받아오는 값이기 때문에 매개변수 없음
		
		//1. 케넉트 연결하기
		Class.forName("com.mysql.jdbc.Driver"); // 커넥트 연결! Class
		System.out.println("연결확인!");
		//2. DB로 연결하자!
		String url = "jdbc:mysql://localhost:3306/jeju";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		// DB랑 연결하기 DB주소 아이디 패스워드 필요!, connection 으로 연결!
		System.out.println("DB연결 성공!");
		//3. SQL문으로 바꾸자
		String sql = "select * from notice_board where notice_no = ?";
		//내가 필요한 SQL문을 활용
		PreparedStatement ps = con.prepareStatement(sql); // SQL문으로 변경!
		ps.setInt(1, no);
		System.out.println("SQL문 만들기 성공");
		
		//4. 서버로 보내기!
		ResultSet rs = ps.executeQuery(); //DB에 있는 테이블 쿼리 값을 rs에 넣는다!
		System.out.println("SQL문 서버로 전송 성공!");
		//검색결과가 잘 있는지 확인!
		// System.out.println(rs.next()); // 값이 들어있는지 확인 있으면 true 없으면 false
		
		//결과값이 true 이면 아래 진행!
		//가방을 만들고!
		Notice_BoardVO bag = new Notice_BoardVO();
		// System.out.println(rs.next());
		if(rs.next()) {//rs.next가 true 라면
			//가져올 값을 먼저 변수로 설정 꺼내주는 방법은 2가지 인덱스 or 항목명
			int no1 = rs.getInt(1);
			String title = rs.getString(2);
			String content = rs.getString(6);
			String date = rs.getString(3);
			String writer = rs.getString(4);
			String file = rs.getString(5);
			
			//가져올 값을 가방에 넣어줘
			bag.setNo(no1);
			bag.setTitle(title);
			bag.setContent(content);
			bag.setDate(date);
			bag.setWriter(writer);
			bag.setFile(file);
			
			//가방에 넣은 값을 더 큰 가방으로 옮겨(컨테이너)
		
		}
		return bag;
		
	}

	public void update(Notice_BoardVO bag) throws Exception {
		// 매개변수 전부 넣어줘야한다!
		// 1.커넥트 연결하기
		Class.forName("com.mysql.jdbc.Driver");
		// 커넥트 연결 class는 Class.forName사용! 오류는 해결(아직 안배움)
		System.out.println("연결 확인!"); // 연결되는지 확인하는 프린트
		
		// 2. 커넥트 된것 DB연결하기
		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";
		// url 변수에 내가 연결할 DB의 주소값을 넣는다.
		// 해당 구문은 정해진 구문으로 항상 같게 사용!
		// (jdbc:연결프로그램://주소/db이름) 커넥션 구문(정해진 구문! 항상 저걸 사용해서 연결!)
		Connection con = DriverManager.getConnection(url, "root", "1234");
		// DB연결하는 class -> connection(내가 필요한걸 사용 java.sql)
		// 연갈하는 DB의 주소와 아이디 패스워드 전부 일치해야 연결이 된다.
		System.out.println("DB연결 성공"); // DB연결에 이상이 없는지 확인
		
		// 3. SQL문으로 만들기!
		String sql = "update notice_board set notice_title = ?, notice_file = ?, notice_content = ? where notice_no = ?";
		// 변수 sql에 SQL문 중 create에 해당하는 insert문을 넣어준다.!
		PreparedStatement ps = con.prepareStatement(sql);
		// 변수 con으로 메서드 prepareStatement를 사용해서 변수 sql에 있는 문자열을 SQL문으로 변경!
		ps.setString(1, bag.getTitle()); // sql 변수에 입력되는 값을 각가 타입에 맞게 set메서드로 변경
		ps.setString(2, bag.getFile());
		ps.setString(3, bag.getContent());
		ps.setInt(4, bag.getNo());
		System.out.println("SQL문으로 변경완료!"); // SQL문으로 변경위의 내용이 잘 처리되는지 확인
		
		// 4. SQL문을 mySQL 서버로 전송!
		ps.executeUpdate(); // ps의 메서드인 executeUpdate로 mySQL로 전송!
		System.out.println("전송완료!"); // 전송과정 문제 확인 출력!
	}

	public void delete(int no) throws Exception {
		// 매개변수 전부 넣어줘야한다!
		// 1.커넥트 연결하기
		Class.forName("com.mysql.jdbc.Driver");
		// 커넥트 연결 class는 Class.forName사용! 오류는 해결(아직 안배움)
		System.out.println("연결 확인!"); // 연결되는지 확인하는 프린트
		
		// 2. 커넥트 된것 DB연결하기
		String url = "jdbc:mysql://localhost:3306/jeju";
		// url 변수에 내가 연결할 DB의 주소값을 넣는다.
		// 해당 구문은 정해진 구문으로 항상 같게 사용!
		// (jdbc:연결프로그램://주소/db이름) 커넥션 구문(정해진 구문! 항상 저걸 사용해서 연결!)
		Connection con = DriverManager.getConnection(url, "root", "1234");
		// DB연결하는 class -> connection(내가 필요한걸 사용 java.sql)
		// 연갈하는 DB의 주소와 아이디 패스워드 전부 일치해야 연결이 된다.
		System.out.println("DB연결 성공"); // DB연결에 이상이 없는지 확인
		
		// 3. SQL문으로 만들기!
		String sql = "delete from notice_board where notice_no = ?";
		// 변수 sql에 SQL문 중 create에 해당하는 insert문을 넣어준다.!
		PreparedStatement ps = con.prepareStatement(sql);
		// 변수 con으로 메서드 prepareStatement를 사용해서 변수 sql에 있는 문자열을 SQL문으로 변경!
		ps.setInt(1, no); // sql 변수에 입력되는 값을 각가 타입에 맞게 set메서드로 변경
		System.out.println("SQL문으로 변경완료!"); // SQL문으로 변경위의 내용이 잘 처리되는지 확인
		
		// 4. SQL문을 mySQL 서버로 전송!
		ps.executeUpdate(); // ps의 메서드인 executeUpdate로 mySQL로 전송!
		System.out.println("전송완료!"); // 전송과정 문제 확인 출력!
	}
	public ArrayList<Notice_BoardVO> list() throws Exception {//받아오는 값이기 때문에 매개변수 없음
		ArrayList<Notice_BoardVO> list = new ArrayList<>();
		//1. 케넉트 연결하기
		Class.forName("com.mysql.jdbc.Driver"); // 커넥트 연결! Class
		System.out.println("연결확인!");
		//2. DB로 연결하자!
		String url = "jdbc:mysql://localhost:3306/jeju";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		// DB랑 연결하기 DB주소 아이디 패스워드 필요!, connection 으로 연결!
		System.out.println("DB연결 성공!");
		//3. SQL문으로 바꾸자
		String sql = "select notice_no, notice_title, notice_date, notice_writer, notice_file from notice_board order by notice_no desc";
		//내가 필요한 SQL문을 활용
		PreparedStatement ps = con.prepareStatement(sql); // SQL문으로 변경!
		System.out.println("SQL문 만들기 성공");
		//4. 서버로 보내기!
		ResultSet rs = ps.executeQuery(); //DB에 있는 테이블 쿼리 값을 rs에 넣는다!
		System.out.println("SQL문 서버로 전송 성공!");
		
		//검색결과가 잘 있는지 확인!
		// System.out.println(rs.next()); // 값이 들어있는지 확인 있으면 true 없으면 false
		
		while (rs.next()) {//while반복문으로 테이블 row값만큼 값을 저장!
			//가져올 값을 먼저 변수로 설정
			int no = rs.getInt(1);
			String title = rs.getString(2);
			String date = rs.getString(3);
			String writer = rs.getString(4);
			String file = rs.getString(5);
			
			//가져올 값을 가방에 넣어줘
			Notice_BoardVO bag = new Notice_BoardVO();
			bag.setNo(no);
			bag.setTitle(title);
			bag.setDate(date);
			bag.setWriter(writer);
			bag.setFile(file);
			
			//가방에 넣은 값을 더 큰 가방으로 옮겨(컨테이너)
			list.add(bag);
		}
		System.out.println(list.size());
		return list; // 리스트 값을 반환!
	}
}
