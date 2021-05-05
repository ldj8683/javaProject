<%@page import="jeju.ProductVO"%>
<%@page import="jeju.ProductDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//같은 숙박 종류들 모두가 지워지지 않도록 상품 등록번호를 넘겨 받아서 delete 메서드를 수행함
	int num = Integer.parseInt(request.getParameter("num"));

	String classification = request.getParameter("classification");
	String id = (String)session.getAttribute("id");
	
	ProductDB db = new ProductDB();
	ProductVO bag = db.readSecond(num, classification);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>숙소 정보 삭제</title>
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
			<!-- 삭제하기 전에 삭제하는 데이터가 맞는지를 확인하기 위해서 등록 번호, 이름, 주소를 출력해서 확인을 시켜줍니다. -->		
			<table id="registerForm" style="padding:20px; font-size: 15px; font-weight: bold;">
				<tr>
					<td width="85" height="25" style="text-align:right">
						등록된 번호:
					</td>
					<td>
						<%= bag.getProductNum() %>
					</td>
				</tr>
				<tr>
					<td width="85" height="25" style="text-align:right">
						등록된 이름:
					</td>
					<td>
						<%= bag.getProductName() %>						
					</td>
				</tr>
				<tr>
					<td width="85" height="25" style="text-align:right">
						등록된 주소:
					</td>
					<td>
						<%= bag.getProductLocation() %>
					</td>
				</tr>
									
			</table>
			<br>
				<h1 style="padding-left: 5em;">숙소를 정보 삭제 하시겠습니까?</h1><!-- 잘 보이게 하기 위해서 왼쪽에 여백을 줌 -->
			<br>
			<!-- 삭제할 데이터가 맞으면 삭제를 할 수있도록 하는 버튼을 만들어줌 -->
			<a href="ProductDbConnect3.jsp?num=<%= bag.getProductNum() %>&classification=<%= bag.getProductClassification() %>">
				<button name="regButton" type="submit" style="margin: 0px 30px 10px 30px; width: 150px; height: 40px; font-size: 20px;">삭제</button>
			</a>
			<!-- 삭제할 데이터의 정보가 맞지 않거나 잘못 눌렀을 경우 다시 돌아가기 위해서 돌아갈 수있는 버튼을 만들어 줌 -->
			<a href="ProductDetail.jsp?productNum=<%= bag.getProductNum() %>">
				<button name="regButton" type="button" style="margin: 0px 30px 10px 30px; width: 150px; height: 40px; font-size: 20px;">돌아가기</button>
			</a>
		</nav> <!-- 본문 닫음 -->
	</body>
</html>