<%@page import="jeju.CustomerSoundVO"%>
<%@page import="jeju.CustomerSoundDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String id = (String)session.getAttribute("id");
	int customer_no = Integer.parseInt(request.getParameter("customer_no"));
	// 입력값을 받아오기! 입력값은 스트링이기 때문에 int 형태로 변경해주기!
	CustomerSoundDB db = new CustomerSoundDB(); // read 메서드를 쓰기위한 설정!
	CustomerSoundVO bag = db.read(customer_no); // read 메서드를 하용할때 bag에 있는 값을 꺼내기 위한 설정!

%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객의 소리 상세 페이지</title>
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
	
		<nav id="Content" style=""> <!-- 본문, 각 조원들이 넣게될 본문 레이아웃 생성 -->
			<div style="width:940px; background: white; padding-top: 2em; padding-left: 2em; background-clip: content-box;">
				<h3>고객의 소리 세부내용</h3>
				<hr color = "white">
				<table border="1" style="width:745px;border-collapse: collapse;">
				<!-- 고객의 소리 세부 페이지! -->
					<tr>
						<td>번호</td>
						<td>종류</td>
						<td>제목</td>
						<td>업소명</td>
						<td style="width:350px;">내용</td>
						<td>날짜</td>
						<td>작성자</td>
						<td>별점</td>
						<td>수정</td>
					</tr>
					<tr>
						<td><%=bag.getCustomer_no() %></td>
						<td><%=bag.getCustomer_type() %></td>
						<td><%=bag.getCustomer_title() %></td>
						<td><%=bag.getCustomer_accommodation_name() %></td>
						<td><%=bag.getCustomer_content()%></td>
						<td><%=bag.getCustomer_date() %></td>
						<td><%=bag.getCustomer_writer() %></td>
						<td><%=bag.getCustomer_grade() %></td>
						<td><button onclick="location.href='CsChange.jsp'">수정하기</button></td>
				</table>
			</div>
		</nav> <!-- 본문 닫음 -->
	
		
	
	</body>
</html>