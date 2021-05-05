<%@page import="java.util.ArrayList"%>
<%@page import="jeju.Notice_BoardVO"%>
<%@page import="jeju.notice_board"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String id = (String)session.getAttribute("id");
	// 로그인 아이디 세션 잡아주기!
	notice_board db = new notice_board();// list 메서드 사용을 위해 new(틀) 생성!
	ArrayList<Notice_BoardVO> list = db.list();
	// list 타입 arraylist 공지사항에 각 게시글을 노출하기 위해 list 메서드 사용!
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">
			.part { /* li태그에 대한 영역 */
				/* margin vs padding */
				/* margin: 바깥쪽 여백의 속성을 지정 => 쉽게 말해 박스와 박스 사이를 조절 위 오른쪽 아래 왼쪽 순으로 밀어주는 느낌 */
				/* padding: 안쪽 여백의 속성을 지정 */
				list-style: none;
				padding: 25px;
				background: #16b4f7; /* li 영역의 배경색 설정 */
				margin: 0px 40px 0px 0px;
				border-radius: 40px 80px; /* 각 li태그마다 둥글게 */
				text-align: center; /* 글씨를 중앙에 맞춤 */
			}
			
			.a {
				font-size: 20px;
			}
			
			#MyPagehr {
				margin: 0px 0px 5px 0px;
			}
			
			#MyPageleft { /* 왼쪽부분에 해당하는 화면 */
				float: left;
				width: 200px;
			}
			
			#MyPageright { /* 오른쪽부분에 해당하는 화면 */
				float: left;
				width: 700px;
				margin: 0px 0px 50px 0px;
			}
			
			#MyPagecenter { /* 내용이 들어갈 영역 */
				float: left;
				width: 700px;
				height: 450px;
				background: white;
			}
		</style>
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
	<nav id="Content">
		<div id="MyPageleft">
			<ul type="circle">
				<li class = "part">  <!-- class속성은 CSS에서 내가 li태그에 해당하는 부분을 공통적으로 수정하고자 할 때 class사용 -->
				<a href = "ServiceMain.jsp">공지사항</a>
				</li>
				<li class = "part">
				<a href = "CsMain.jsp">고객소리</a>
				</li>
			</ul>
		</div>
		<div id="MyPageright">
			<h3>공지사항</h3>
			<hr id = "MyPagehr" color = "#16b4f7" size = 6>
				<div id = "MyPagecenter"><!-- right라는 영역안에 center라는 영역을 만들기 위해 설정 -->
					<table>
						<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성일</td>
						<td>작성자</td>
						<td>첨부파일</td>
						<td>비고</td>
						</tr>
							<%
					for (int i = 0; i < list.size(); i++) {//최근등록사항이 상위노출(SQL문 order by 활용)
						//가방에 넣기
						Notice_BoardVO bag = list.get(i);
					%>
						<tr> <!-- 브라우저 노출 부분 -->
						<td><%=bag.getNo() %></td>
						<td><a href="BoardDetailMain.jsp?notice_no=<%=bag.getNo()%>"><%=bag.getTitle() %></a></td>
						<td><%=bag.getDate()%></td>
						<td><%=bag.getWriter() %></td>
						<td><%=bag.getFile() %></td>
						<%if (id == null || !(id.equals("admin"))) { %>
						<!-- 로그인한 id에 따라서 버튼 활성화 시키기 admin만 삭제 가능-->
						<%} else if(id.equals("admin")) {%>
						<td><button onclick="location.href='BoardDelete.jsp'">삭제</button></td>
						<%} %>
												
						</tr>
						
					<%}	%>
					</table>
		<%
			if (session.getAttribute("id") == null) {
		%>
		<!-- 세션이 잡혀 있지 않으면 로그인하기! -->
		<form action="Login.jsp">
			<button>로그인하기</button>
		</form>
		<%
			} else if (session.getAttribute("id").equals("admin")) {
		%>
		<!-- admin 관리자 계정으로 로그인시 등록하기 활성화 -->
		<form action="BoardEnroll.jsp">
			<button>등록하기</button>
		</form>
		<%
			} else {
		%>
		<!-- 관리자외 다른 세션 설정시 등록권한이 없습니다! -->
		등록권한이 없습니다.
		<%
			}
		%>
				</div>
		</div>
	</nav>

</body>
</html>