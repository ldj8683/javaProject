<%@page import="jeju.ProductVO"%>
<%@page import="jeju.ProductDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/* 수정할 숙박업소의 등록번호의 파라미터 값을 받아와서 db에 저장된 다른 데이터들이 같이 수정되는 경우가 없도록 해주었습니다. */
	int num = Integer.parseInt(request.getParameter("num"));
	/* 저장된 이미지가 바뀔 수도 있기 때문에 그 경로를 설정해줄때 사용을 하였습니다. */
	String classification = request.getParameter("classification");
	
	// 로그인 세션입니다.
	String id = (String)session.getAttribute("id");
	
	// 수정을 하기 위해서 모든부분을 적는것은 비효율 적이기 때문에
	// 해당 등록 번호에 저장된 데이터들을 보여주어서 수정할 부분만 수정을 할 수 있도록 하기 위해서 bag을 설정해주었습니다.
	ProductDB db = new ProductDB();
	ProductVO bag = db.readSecond(num, classification);
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>숙소 정보 수정</title>
		<link rel="stylesheet" type="text/css" href="style.css"><!-- style.css와 연결 -->
	</head>
	<body>
		<header><!-- HTML 레이아웃 중 하나인 header 부분에 메뉴를 생성 -->
			<nav id = "logo">	<!-- HTML 레이아웃중 하나인 nav 부분에 생성, id는 logo 로 지정해서 style.css에서 logo를 이용해 style을 만들어줌  -->
				<a href="MainPage.jsp"> <!-- 로고를 누르면 메인페이지를 갈수 있도록 하는 a 태그 생성 -->
					<img src="pictures/MainLogo.png" width="80" height="80">	<!-- 80x80짜리 경로를 따라서 이미지를 가져옴 -->
				</a>
			</nav> <!-- 로고 레이아웃 완료 -->
			
			<nav id = "search">	<!-- search라는 id를 가진 검색부분 레이아웃을 생성 -->
				<form><!-- 이미지를 누르면 검색을 할수 있도록 하기위해서 form 형식으로 생성, 검색 하는것은 추후 추가 예정 -->
					<img id="SearchImage" src="pictures/Search.png" width="25" height="25"><!-- 검색모양 이미지 -->
					<!-- <input type="text" name="find"> -->
				</form>
			</nav> <!-- 검색 레이아웃 완료 -->
			
			<nav id = "menu" ><!-- menu라는 id를 가진 레이아웃을 생성 -->
				<table>	<!-- 테이블 생성 -->
					<tr>	<!-- 테이블의 한줄을 생성 -->
						<th colspan="4" style="text-align: right; height: 41px"> <!-- 4열이 합병되고 오른쪽 정렬, 높이가 41px인 테이블 헤더 생성 -->
							<% if( id == null) { %> <!-- 세션을 이용해 로그인이 되지 않고 있을 때 아래 구문을 수행 -->
								로그인을 해주세요.
							<% } else { %>	<!-- 로그인이 되었을 경우 아래 구문 수행 -->
							    <%= id %>님 환영합니다.<a href="Logout.jsp">로그아웃</a>	<!-- 로그인된 사용자의 아이디를 출력 -->
							<% } %>
						</th><!-- 테이블 헤더 완성 -->
					</tr><!-- 테이블의 한줄을 완성 -->
					<tr>
						<td><!-- 테이블 데이터 셀을 생성 -->
							<a class="menuLink" href="MainPage.jsp">메인페이지</a>	<!-- 세션을 이용해 메인페이지 셀을 눌렀을때 로그인된 아이디 값을 넘겨주면서 메인페이지로 감 -->
						</td><!-- 테이블 데이터 완성 -->
						<td>
							<a class="menuLink" href="MyPage.jsp">마이페이지</a>
						</td>
						<td>
							<a class="menuLink" href="ServiceMain.jsp">고객센터</a>
						</td>
						<td>
							<% if( id == null) {	%> <!-- 세션을 이용해 로그인이 되지 않았을때 로그인을 하기위해서 로그인페이지로 연결되는 데이터셀을 생성 -->
								<a class="menuLink" href="Login.jsp">로그인</a>
							<%} else {%>	<!-- 로그인이 성공 했을경우 로그아웃을 할 수 있게하는 로그아웃으로 연결되는 셀을 생성 -->
								<a class="menuLink" href="UserUpdate.jsp">회원 정보</a>
							<%} %>
						</td>						
					</tr>
				</table> <!-- 테이블 완성 -->
			</nav><!-- menu 레이아웃 완료 -->
		</header> <!-- 헤더 레이아웃 완료 -->
		
		<nav id="Content" style="background:#16b4f7;"> <!-- 각 조원들이 넣게될 본문 레이아웃 생성 -->
			<%-- <form action="ProductDbConnect2.jsp?num=<%= bag.getProductNum() %>&classification=<%= bag.getProductClassification() %>"> --%>
			<form action="ProductDbConnect2.jsp?num=<%= bag.getProductNum() %>&classification=<%= bag.getProductClassification() %>">
				<!-- 수정할 데이터들을 입력하는 테이블 입니다. 수정을 하기 쉽도록 db에 저장된 값들을 불러와서 입력창에 출력해 주었습니다. -->
				<table id="registerForm" style="padding:20px; font-size: 15px; font-weight: bold;">
					<tr>
						<td width="85" height="25" style="text-align:right">
							등록자 ID:
						</td>
						<td>
							<!-- 등록번호를 수정하면 안되기때문에 readonly를 이용해서 오로지 읽을수만 있도록 해주었습니다. -->
							<input type="text" name="productId" value="<%= bag.getProductId() %>" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td width="85" height="25" style="text-align:right">
							등록 번호:
						</td>
						<td>
							<!-- 등록번호를 수정하면 안되기때문에 readonly를 이용해서 오로지 읽을수만 있도록 해주었습니다. -->
							<input type="text" name="productNum" value="<%= bag.getProductNum() %>" readonly="readonly">
						</td>
					</tr>
					<tr>
						<td width="85" height="25" style="text-align:right">
							숙박 종류:
						</td>
						<td>
							<select name="productClassification">
								<option value="Hotel">호텔</option>
								<option value="Resort">리조트</option>
								<option value="Pension">펜션</option>
								<option value="GuestHouse">게스트하우스</option>
							</select>
						</td>
					</tr>
					<tr>
						<td width="85" height="25" style="text-align:right">
							이름:
						</td>
						<td>
							<input type="text" name="productName" value="<%= bag.getProductName() %>" >
						</td>
					</tr>
					<tr>
						<td width="85" height="25" style="text-align:right">
							이미지:
						</td>
						<td>
							<!-- <input type="file" id="HotelImage" accept="image/*"> -->
							<input type="text" name="productImage" value="pictures/<%=classification%>/">
						</td>
					</tr>
					<tr>
						<td width="85" height="25" style="text-align:right">
							가격:
						</td>
						<td>
							<input type="text" name="productPrice" value="<%= bag.getProductPrice() %>" >
						</td>
					</tr>
					<tr>
						<td width="85" height="25" style="text-align:right">
							위치:
						</td>
						<td>
							<input type="text" name="productLocation" value="<%= bag.getProductLocation() %>" >
						</td>
					</tr>
					<tr>
						<td width="85" height="25" style="text-align:right">
							공용 시설:
						</td>
						<td> 
							<input type="checkbox" id="Cafe" name="productCommon" value="Cafe">
							<label for="Cafe">카페</label>
							<input type="checkbox" id="Pool" name="productCommon" value="Pool">
							<label for="Pool">수영장</label>
							<input type="checkbox" id="Convenience" name="productCommon" value="Convenience">
							<label for="Convenience">편의점</label>
							<input type="checkbox" id="Parking" name="productCommon" value="Parking">
							<label for="Parking">주차장</label>
						</td>
					</tr>							
					<tr>
						<td width="85" height="25" style="text-align:right">
							객실 시설:
						</td>
						<td>
							<input type="checkbox" id="Wifi" name="productInternal" value="Wifi">
							<label for="Wifi">와이파이</label>
							<input type="checkbox" id="Tv" name="productInternal" value="Tv">
							<label for="Tv">TV</label>
							<input type="checkbox" id="Refrigerator" name="productInternal" value="Refrigerator">
							<label for="Refrigerator">냉장고</label>
							<input type="checkbox" id="Bathtub" name="productInternal" value="Bathtub">
							<label for="Bathtub">욕조</label>
						</td>
					</tr>
					<tr>
						<td width="85" height="25" style="text-align:right">
							룸 타입:
						</td>
						<td>
							<input type="radio" id="Single" name="productRoomType" value="Single">
							<label for="Single">싱글</label>
							<input type="radio" id="Double" name="productRoomType" value="Double">
							<label for="Double">더블</label>
							<input type="radio" id="Twin" name="productRoomType" value="Twin">
							<label for="Twin">트윈</label>
						</td>
					</tr>
					<tr>
						<td width="85" height="25" style="text-align:right">
							픽업 여부:
						</td>
						<td>
							<input type="radio" id="Yes" name="productPickup" value="Yes">
							<label for="Yes">가능</label>
							<input type="radio" id="No" name="productPickup" value="No">
							<label for="No">불가능</label>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							상세 정보:
						</td>						
					</tr>
					<tr>
						<td width="10">						
						</td>		
						<td>
							<textarea name = "productInfo" rows="20" cols="100"><%= bag.getProductInfo() %></textarea>
						</td>
					</tr>
				</table>
				<button name="regButton" type="submit" style="margin: 0px 30px 10px 30px; width: 150px; height: 40px; font-size: 20px;">숙소 정보 수정</button>
			</form>
			
			<!-- 다시 상세 페이지로 돌아갈 경우 사용하는 버튼 -->
			<a href="ProductDetail.jsp?productNum=<%= bag.getProductNum() %>">
				<button name="regButton" type="button" style="margin: 0px 30px 10px 30px; width: 150px; height: 40px; font-size: 20px;">돌아가기</button>
			</a>
		</nav> <!-- 본문 닫음 -->
	</body>
</html>