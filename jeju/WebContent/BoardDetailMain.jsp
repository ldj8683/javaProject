<%@page import="jeju.Notice_BoardVO"%>
<%@page import="jeju.notice_board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String id = (String)session.getAttribute("id");
    int no = Integer.parseInt(request.getParameter("notice_no"));
    // 넘겨준 값을 받는다!(메인페이지에서)
    notice_board db = new notice_board();
    Notice_BoardVO bag = db.read(no);
    
    
	%>
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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
			<div style="width:750px; background: white; padding-top: 5em; padding-left: 7em; background-clip: content-box;">
				<h3>공지사항 세부내용</h3>
			<hr color="blue">
				<table border="1" style="width:745px;border-collapse: collapse;">
					<tr>
						<td>번호</td><!-- 각 row값의 세부 내용 보여주는 페이지! -->
						<td>제목</td>
						<td style="width:350px;">내용</td>
						<td>작성일</td>
						<td>작성자</td>
						<td>첨부파일</td>
						<td>비고</td>
					</tr>
					<tr>
		                <td><%=bag.getNo() %></td>
		                <td><%=bag.getTitle() %></td>
		                <td><%=bag.getContent() %></td>
		                <td><%=bag.getDate()%></td>
		                <td><%=bag.getWriter() %></td>
		                <td><%=bag.getFile() %></td>
		                <%if (id == null || !(id.equals("admin"))) { %>
		                <!-- 로그인한 id에 따라서 버튼 활성화 시키기 admin만 삭제 가능-->
		                <td></td>
		                <%} else if(id.equals("admin")) {%>
		                <td><button onclick="location.href='BoardDetail.jsp'">수정하기</button></td>
						<!-- 수정하기 페이지로 넘어가는것 -->
		                <%} %>
	            	</tr>
				</table>
				<form action="ServiceMain.jsp"> <!-- 수정하지 않으면 main으로 돌아가기 -->
					<button>돌아가기</button>
				</form>
			</div>
		</nav> <!-- 본문 닫음 -->
</body>
</html>