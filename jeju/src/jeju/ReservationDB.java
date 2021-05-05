package jeju;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.jndi.url.corbaname.corbanameURLContextFactory;
//DAO : 데이터베이스의 데이터에 접근하기 위해 생성하는 객체
public class ReservationDB {
	Connection con;
	public ReservationDB() throws Exception {
		Class.forName("com.mysql.jdbc.Driver"); //드라이버(java <-> db사이 통신을 위한것)로드
		
		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";
		con = DriverManager.getConnection(url,"root","1234"); //드라이버메니저를 통해 db연결(커넥션 생성)
	}
	
	//
	public void create(ReservationVO bag) throws Exception {
		String sql = "insert into reservation values (null,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql); //sql 구문 작성
		
		ps.setString(1, bag.getRes_id());
		ps.setString(2, bag.getRes_name());
		ps.setString(3, bag.getRes_tel());
		ps.setString(4, bag.getRes_date());
		ps.setString(5, bag.getRes_payment());
		ps.setString(6, bag.getRes_room());
		ps.setInt(7, bag.getRes_cost()); //int형으로 형변환 필요
		ps.executeUpdate();//4.mysql로 생성한 sql문 보냄 -> 쿼리문 처리
		
		con.close(); //커넥션 해제
	}
	
	public ArrayList<ReservationVO> read(String res_id) throws Exception { //입력값이 하나이기 때문에 bag을 받아오지않음
		String sql = "select * from reservation where res_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1,res_id);
		
		ResultSet rs = ps.executeQuery(); //ResultSet => db에서 테이블셋을 뜻함(순서를 가지고 꺼낼수 있고, 컬럼명을 가지고 꺼낼수 있음)
				
		
		ArrayList<ReservationVO> list = new ArrayList<ReservationVO>(); //예약정보에 대한 VO형태
		while(rs.next()) { //rs.next() => 테이블셋의 첫번째 행에 값이 있으면 true이기 때문에
						// Record pointer 이동 : Rec Pointer가 있는 지점 자료만 참조 가능 레코드는 한줄씩(row)만 읽어올수 있음
						// Record pointer의 처음 위치는 0번째이기 때문에 next() 로 1번째 레코드로 이동해야 첫번째 자료를 읽어올수있음
			int res_num = rs.getInt(1);
			String res_id1 = rs.getString(2);
			String res_name = rs.getString(3);
			String res_tel = rs.getString(4);
			String res_date = rs.getString(5);
			String res_payment = rs.getString(6);
			String res_room = rs.getString(7);
			int res_cost = rs.getInt(8);
			
			ReservationVO bag = new ReservationVO(); //반환값이 여러개 이기 때문에 bag(VO)을 생성
			bag.setRes_num(res_num);
			bag.setRes_id(res_id1);
			bag.setRes_name(res_name);
			bag.setRes_tel(res_tel);
			bag.setRes_date(res_date);
			bag.setRes_payment(res_payment);
			bag.setRes_room(res_room);
			bag.setRes_cost(res_cost);
			
			
			list.add(bag);//VO를 통해 만든 bag을 list에 쌓는다
		}
		
		return list; //여러개의 레코드를 가져오기 위해 리스트에 담아온다 => 하나의 레코드는 bag이라는 VO에 담겨져있다. 현재 이런 bag이 여러개기 때문에 이 bag을 담을 list생성
	}
	
	public ArrayList<ReservationVO> list() throws Exception {
		ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
		String sql = "select * from reservation";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			ReservationVO bag = new ReservationVO();
			//테이블에 저장되어있는 데이터를 추출해서 각 변수에 저장
			int res_num = rs.getInt(1);
			String res_id = rs.getString(2);
			String res_name = rs.getString(3);
			String res_tel = rs.getString(4);
			String res_date = rs.getString(5);
			String res_payment = rs.getString(6);
			String res_room = rs.getString(7);
			int res_cost = rs.getInt(8);
			
			//추출한 row에 해당하는 값들을 VO에 저장
			bag.setRes_num(res_num);
			bag.setRes_id(res_id);
			bag.setRes_name(res_name);
			bag.setRes_tel(res_tel);
			bag.setRes_date(res_date);
			bag.setRes_payment(res_payment);
			bag.setRes_room(res_room);
			bag.setRes_cost(res_cost);
			
			//위 와같이 전체 로우를 bag담고 하나 씩 bag을 list에 넣어둠
			list.add(bag);
		}
		con.close(); //커넥션 해제
		return list;
	}
	public void update(ReservationVO bag) throws Exception {
		String sql = "update reservation set res_name = ?, res_tel = ? where res_num = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bag.getRes_name());
		ps.setString(2, bag.getRes_tel());
		ps.setInt(3, bag.getRes_num());
		
		ps.executeUpdate();
		con.close();
		
	}
	public void delete(int res_num) throws Exception {
		//예약번호를 통해서 삭제 
		String sql = "delete from reservation where res_num = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, res_num);
		
		ps.executeUpdate(); //return = void
		con.close(); //커넥션 해제
		
	}
}
