package jeju;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShoppingBagDB {
		Connection con;

		public ShoppingBagDB() throws Exception {
			Class.forName("com.mysql.jdbc.Driver"); // 드라이버(java <-> db사이 통신을 위한것)로드

			String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";
			con = DriverManager.getConnection(url, "root", "1234"); // 드라이버메니저를 통해 db연결(커넥션 생성)
		}
		
		public void create(ShoppingBagVO bag) throws Exception {
			
			String sql = "insert into shoppingbag values (null,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql); // sqljs  구문 작성
			// ps.setString(1, bag.getRes_num().toString()); //Ren_num은 db에서 int형으로 설정했지만
			// auto increment를 수행하기 위해서는 null이 들어와야함 따라서 integer -> string으로 형변환 시켜서 작성
			ps.setString(1, bag.getId());
			ps.setString(2, bag.getProduct());
			ps.setString(3, bag.getProduct_name());
			ps.executeUpdate();// 4.mysql로 생성한 sql문 보냄 -> 쿼리문 처리

			con.close(); // 커넥션 해제
		}
		// 해당 아이디와 제품이 있는지 파악을 위해 boolean형태의 메소드 생성 -> 만약 있으면 true로 넘겨짐 
		public boolean check(String id, String product_name) throws Exception {
			String sql = "select * from shoppingbag where id = ? and product_name = ?";
			PreparedStatement ps = con.prepareStatement(sql); // sql 구문 작성
			ps.setString(1, id);
			ps.setString(2, product_name);
			ResultSet rs = ps.executeQuery();// 4.mysql로 생성한 sql문 보냄 -> 쿼리문 처리
			boolean result = false;
			if(rs.next()) { //있는지 없는지 파악해주는 것 -> 있으면 들어가고 없으면 안들어감
				result = true;
			}
			return result;
		}
		
		public ArrayList<ShoppingBagVO> read(String id) throws Exception {
			String sql = "select * from shoppingbag where id = ?";
			PreparedStatement ps = con.prepareStatement(sql); // sql 구문 작성
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();// 4.mysql로 생성한 sql문 보냄 -> 쿼리문 처리
			ArrayList<ShoppingBagVO> list = new ArrayList<ShoppingBagVO>(); //bag을 담아줄 리스트
			while(rs.next()) {
				ShoppingBagVO bag = new ShoppingBagVO(); //전체를 테이블에 맞게 다 넣어야함
				int no = rs.getInt(1);
				String id1 = rs.getString(2);
				String product = rs.getString(3);
				String product_name = rs.getString(4);
				//db에 들어있는 데이터를 가방에 넣어준다
				bag.setNo(no);
				bag.setId(id1);
				bag.setProduct(product);
				bag.setProduct_name(product_name);
				
				list.add(bag);
			}
			con.close(); // 커넥션 해제
			return list;
		}
		
		public void delete(String id , String product_name) throws Exception {
			String sql = "delete from shoppingbag where id = ? and product = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, product_name);
			
			ps.executeUpdate();
			con.close();
		}
		
		
	}


