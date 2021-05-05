<%@page import="jeju.CustomerSoundDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- CsEnroll에서 입력받은 값을 가져와서 SQL문으로 변경한 후 mySQL서버로 보낸뒤 db저장! -->
<%
// 각각의 변수 타입에 맞게 입력된 값을 받아준다!
String customer_title = request.getParameter("customer_title");
String customer_type = request.getParameter("customer_type");
String customer_accommdation_name = request.getParameter("customer_accommdation_name");
String customer_date = request.getParameter("customer_date");
String customer_writer = request.getParameter("customer_writer");
String customer_content = request.getParameter("customer_content");
int customer_grade = Integer.parseInt(request.getParameter("customer_grade"));

// 로그인 세션
String id = (String)session.getAttribute("id");

// 입력된 값을 메서드를 사용하여 SQL문으로 변경한뒤 서버로 전송해준다(create메서드 사용)
// 새로운 메서드 사용하기 위해서 new 만들어주기
CustomerSoundDB db = new CustomerSoundDB();
db.create(customer_type, customer_title, customer_accommdation_name, customer_date, customer_writer, customer_content, customer_grade);
// SQL문으로 보내기!
%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>등록완료</title>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		<header><!-- HTML 레이아웃 중 하나인 header 부분에 메뉴를 생성 -->
			<nav id = "logo">	<!-- HTML 레이아웃중 하나인 nav 부분에 생성, id는 logo 로 지정해서 style.css에서 logo를 이용해 style을 만들어줌  -->
				<a href="MainPage.jsp"> <!-- 로고를 누르면 메인페이지를 갈수 있도록 하는 a 태그 생성 -->
					<img src="pictures/MainLogo.png" width="80" height="80">	<!-- 80x80짜리 경로를 따라서 이미지를 가져옴 -->
				</a>
			</nav> <!-- 로고 레이아웃 완료 -->
			
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
		<nav id="Content"> <!-- 본문, 각 조원들이 넣게될 본문 레이아웃 생성 -->
			등록이 완료되었습니다.
			<form action="CsMain.jsp"> <!-- 등록완료 후 메인으로 -->
				<button>돌아가기</button>
			</form>
		</nav> <!-- 본문 닫음 -->
	</body>
</html>