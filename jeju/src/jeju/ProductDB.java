package jeju;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ProductDB {
	Connection con;

	public ProductDB() throws Exception {
		// 1. 커넥터를 사용하겠다고 설정.
		Class.forName("com.mysql.jdbc.Driver"); // 클래스는 처음 대문자를 써줘야한다
		// PrintWriter out = new PrintWriter();
		System.out.println("1. 커넥터 사용 설정 성공."); // 연결이 성공 하면 브라우저에 성공했음을 띄워준다.

		// 2. db 연결을 해보기 - shop, root, 1234
		String url = "jdbc:mysql://localhost:3306/jeju?useUnicode=true&characterEncoding=utf8";
		// 포트번호를 확인하자, localhost는 내 컴퓨터 안에서 사용할때 쓴다.
		// jsp 자동 import : ctrl + shift + m
		con = DriverManager.getConnection(url, "root", "1234"); // 설정한 곳이 위치한 주소를 가져온다.
		System.out.println("2. DB 연결 성공.");
		
	}
	
	// temp
	public ProductVO readSecond(int productNum, String productClassification) throws Exception {
		// 3. SQL문을 만듬 => 해당 부품을 써서 SQL로 인식하게 해야한다.
		// 아래 sql문은 mySQL이 사용한다. 서버는 만들어 주기만 함.
		String sql = "select * from product where productNum = ? and productClassification =?"; // ?는 입력값을 모를 때 넣어둠(입력받은 값을 넣어줄때 사용)
		PreparedStatement ps = con.prepareStatement(sql);// PreparedStatement => sql을 담당하는 부품
		ps.setInt(1, productNum);
		ps.setString(2, productClassification);
		System.out.println("3. SQL문을 만들기 성공.");
		
		// 4. 만든 SQL문을 mySQL 서버로 부터 가져옴
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문을 이용해 mySQL 서버로부터 가져오기 성공.");
		
		// 1. 검색결과가 있는지 체크해야한다.
		//System.out.println(rs.next()); // true이면 있다는 예기
		
		// 2. 만약에 결과가 있으면, 테이블에서 원하는 데이터 항목을 꺼내주면 된다.
		ProductVO bag = new ProductVO();
		if(rs.next()) {
			// 꺼내주는 방법은 2가지
			// 1. 항목명을 가지고 꺼내기
			// 2. 항목의 인덱스를 가지고 꺼내기
			int productNum2 = rs.getInt(1);
			String productClassification2 = rs.getString(2);
			String productName = rs.getString(3);
			String productImage = rs.getString(4);
			int productPrice = rs.getInt(5);
			String productLocation = rs.getString(6);
			String productCommon = rs.getString(7);
			String productInternal = rs.getString(8);
			String productRoomType = rs.getString(9);
			String productPickup = rs.getString(10);
			String productInfo = rs.getString(11);
			String productId = rs.getString(12);
			
			bag.setProductNum(productNum2);
			bag.setProductClassification(productClassification2);
			bag.setProductName(productName);
			bag.setProductImage(productImage);
			bag.setProductPrice(productPrice);
			bag.setProductLocation(productLocation);
			bag.setProductCommon(productCommon);
			bag.setProductInternal(productInternal);
			bag.setProductRoomType(productRoomType);
			bag.setProductPickup(productPickup);
			bag.setProductInfo(productInfo);
			bag.setProductId(productId);
		}
		return bag;
	}
	
	
	
	
	
	// ArrayList
	public ArrayList<ProductVO> summaryList() throws Exception {
		ArrayList<ProductVO> summaryList = new ArrayList<>();
		
		String sql = "select * from product";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. SQL문 만들기 성공");
		
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문을 이용해 mySQL 서버의 데이터를 가져오는 것에 성공");
		
		while (rs.next()) {
			String productClassification = rs.getString(2);
			String productName = rs.getString(3);
			String productImage = rs.getString(4);
			int productNum = rs.getInt(1);
			String productLocation = rs.getString(6);
			int productPrice = rs.getInt(5);
			String productId = rs.getString(12);
			
			ProductVO bag = new ProductVO();
			bag.setProductClassification(productClassification);
			bag.setProductName(productName);
			bag.setProductImage(productImage);
			bag.setProductNum(productNum);
			bag.setProductLocation(productLocation);
			bag.setProductPrice(productPrice);
			bag.setProductId(productId);
			
			summaryList.add(bag);			
		}
		
		return summaryList;
	}
	
	// CRUD
	public void create(ProductVO bag) throws Exception {

		// 3. SQL문을 만듬 => 해당 부품을 써서 SQL로 인식하게 해야한다.
		// 아래 sql문은 mySQL이 사용한다. 서버는 만들어 주기만 함.
		String sql = "insert into product values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; // ?는 입력값을 모를 때 넣어둠(입력받은 값을 넣어줄때 사용)
		PreparedStatement ps = con.prepareStatement(sql);// PreparedStatement => sql을 담당하는 부품
		ps.setString(1, bag.getProductClassification());
		ps.setString(2, bag.getProductName());
		ps.setString(3, bag.getProductImage());
		ps.setInt(4, bag.getProductPrice());
		ps.setString(5, bag.getProductLocation());
		ps.setString(6, bag.getProductCommon());
		ps.setString(7, bag.getProductInternal());
		ps.setString(8, bag.getProductRoomType());
		ps.setString(9, bag.getProductPickup());
		ps.setString(10, bag.getProductInfo());
		ps.setString(11, bag.getProductId());
		System.out.println("3. SQL문을 만들기 성공.");
		// 4. 만든 SQL문을 mySQL 서버로 전송
		ps.executeUpdate();
		System.out.println("4. SQL문을 mySQL 서버로 전송 성공.");
				
		con.close();
		
	}
	

	public void update(ProductVO bag) throws Exception {
		// 3. SQL문을 만듬 => 해당 부품을 써서 SQL로 인식하게 해야한다.
		// 아래 sql문은 mySQL이 사용한다. 서버는 만들어 주기만 함.
		String sql = "update product set productClassification = ?, productName = ?, productImage = ?, productPrice = ?, productLocation = ?, productCommon = ?, productInternal = ?, productRoomType = ?, productPickup = ?, productInfo = ?, productId = ? where productNum = ?"; // ?는 입력값을 모를 때 넣어둠(입력받은 값을 넣어줄때 사용)
		PreparedStatement ps = con.prepareStatement(sql);// PreparedStatement => sql을 담당하는 부품
		ps.setString(1, bag.getProductClassification());
		ps.setString(2, bag.getProductName());
		ps.setString(3, bag.getProductImage());
		ps.setInt(4, bag.getProductPrice());
		ps.setString(5, bag.getProductLocation());
		ps.setString(6, bag.getProductCommon());
		ps.setString(7, bag.getProductInternal());
		ps.setString(8, bag.getProductRoomType());
		ps.setString(9, bag.getProductPickup());
		ps.setString(10, bag.getProductInfo());
		ps.setString(11, bag.getProductId());
		ps.setInt(12, bag.getProductNum());
		System.out.println("3. SQL문을 만들기 성공.");
		// 4. 만든 SQL문을 mySQL 서버로 전송
		ps.executeUpdate();
		System.out.println("4. SQL문을 mySQL 서버로 전송 성공.");
				
		con.close();

	}

	public void delete(int productNum) throws Exception {
		// 3. SQL문을 만듬 => 해당 부품을 써서 SQL로 인식하게 해야한다.
		// 아래 sql문은 mySQL이 사용한다. 서버는 만들어 주기만 함.
		String sql = "delete from product where productNum = ?"; // ?는 입력값을 모를 때 넣어둠(입력받은 값을 넣어줄때 사용)
		PreparedStatement ps = con.prepareStatement(sql);// PreparedStatement => sql을 담당하는 부품
		ps.setInt(1, productNum);
		System.out.println("3. SQL문을 만들기 성공.");

		// 4. 만든 SQL문을 mySQL 서버로 전송
		ps.executeUpdate();
		System.out.println("4. SQL문을 mySQL 서버로 전송 성공.");
				
		con.close();
	}
	
	public ProductVO read(int productNum) throws Exception {		

		// 3. SQL문을 만듬 => 해당 부품을 써서 SQL로 인식하게 해야한다.
		// 아래 sql문은 mySQL이 사용한다. 서버는 만들어 주기만 함.
		String sql = "select * from product where productNum = ?"; // ?는 입력값을 모를 때 넣어둠(입력받은 값을 넣어줄때 사용)
		PreparedStatement ps = con.prepareStatement(sql);// PreparedStatement => sql을 담당하는 부품
		ps.setInt(1, productNum);;
		System.out.println("3. SQL문을 만들기 성공.");

		// 4. 만든 SQL문을 mySQL 서버로 부터 가져옴
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문을 이용해 mySQL 서버로부터 가져오기 성공.");
		
		// 1. 검색결과가 있는지 체크해야한다.
		//System.out.println(rs.next()); // true이면 있다는 예기
		
		// 2. 만약에 결과가 있으면, 테이블에서 원하는 데이터 항목을 꺼내주면 된다.
		ProductVO bag = new ProductVO();
		if(rs.next()) {
			// 꺼내주는 방법은 2가지
			// 1. 항목명을 가지고 꺼내기
			// 2. 항목의 인덱스를 가지고 꺼내기
			int productNum2 = rs.getInt(1);
			String productClassification = rs.getString(2);
			String productName = rs.getString(3);
			String productImage = rs.getString(4);
			int productPrice = rs.getInt(5);
			String productLocation = rs.getString(6);
			String productCommon = rs.getString(7);
			String productInternal = rs.getString(8);
			String productRoomType = rs.getString(9);
			String productPickup = rs.getString(10);
			String productInfo = rs.getString(11);
			String productId = rs.getString(12);
			
			bag.setProductNum(productNum2);
			bag.setProductClassification(productClassification);
			bag.setProductName(productName);
			bag.setProductImage(productImage);
			bag.setProductPrice(productPrice);
			bag.setProductLocation(productLocation);
			bag.setProductCommon(productCommon);
			bag.setProductInternal(productInternal);
			bag.setProductRoomType(productRoomType);
			bag.setProductPickup(productPickup);
			bag.setProductInfo(productInfo);
			bag.setProductId(productId);
		}
		return bag;
		
		//con.close();
	}
}
