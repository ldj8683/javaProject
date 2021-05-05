
<%@page import="jeju.ProductDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    



<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<style>
			/* 테이블로 만든 메뉴의 메인페이지, 마이페이지, 고객의소리, 로그인의 글자뿐만이 아니라 셀을 눌러도 링크로 넘어갈 수 있도록 하기 위해서 설정 */
			.cellIconBox{ /* 셀 전부에 설정을 해주기 위해서 클래스를 cellIconBox로 정해서 이 것만 설정을 해줌 */
				display:block;	/* 한셀 전부를 클릭해도 되게 했음 */
				width:100%;
				/* height:100%; */
				text-decoration:none;
				text-align: center;	
				font-size:30px;
				font-weight: bold;
				color:black;
			}			
		</style>
	</head>
	<body>
		<%-- 로그인 결과 <%= result %>
		<a href="MainPage.jsp?id=<%=id%>">메인페이지로</a> --%>
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
							<%-- <% if( id == null) { %> <!-- 세션을 이용해 로그인이 되지 않고 있을 때 아래 구문을 수행 -->
								로그인을 해주세요.
							<% } else { %>	<!-- 로그인이 되었을 경우 아래 구문 수행 -->
							    <%= id %>님 환영합니다.<a href="Logout.jsp">로그아웃</a>	<!-- 로그인된 사용자의 아이디를 출력 -->
							<% } %> --%>
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
							<%-- <% if( id == null) {	%> --%> <!-- 세션을 이용해 로그인이 되지 않았을때 로그인을 하기위해서 로그인페이지로 연결되는 데이터셀을 생성 -->
								<a class="menuLink" href="Login.jsp">로그인</a>
							<%-- <%} else {%>	<!-- 로그인이 성공 했을경우 로그아웃을 할 수 있게하는 로그아웃으로 연결되는 셀을 생성 -->
								<a class="menuLink" href="UserUpdate.jsp">회원 정보</a>
							<%} %> --%>
						</td>						
					</tr>
				</table> <!-- 테이블 완성 -->
			</nav><!-- menu 레이아웃 완료 -->
		</header> <!-- 헤더 레이아웃 완료 -->
		
			
		<nav id="Content" align="center"> <!-- 각 조원들이 넣게될 본문 레이아웃 생성 -->
			<% if(session.getAttribute("id") == null) { %>  <!-- 로그인 세션값이 입력이 되어있지 않을때 로그인입력화면 보이게 함 -->  <!-- 세션값이 있으면 로그인페이지말고 회원정보 페이지를 보여줘야 함 -->
				<form action = "LoginConnect.jsp"> <!-- 입력값 LoginConnect로 전송 -->
					
					<B><font size = "30em" color = "black" face = "돋움" > <!--  LOGIN글씨 폰트설정 -->
					LOGIN
					</font></B>
					
					<hr style = "border : solid 3px white;'"> <!-- LOGIN 글씨 밑에 밑줄 -->
					<br>
					<br>
					<br>
					
					<font size = "5em" color = "black"  >
					<input name = "id" placeholder = "아이디" type="text" required style="text-align:center;width:250px; height:30px; letter-spacing: 1px"><br>  
					<!--아이디인풋창 => placeholder(인풋창에 글씨써놓고 입력값이 생기면 글씨 사라지는 것), required(입력값이 없으면 전송이 안됨. 밑에 경고창띄우기), style(순서대로/중앙정렬/ input창 너비/높이/글자간 간격)  -->    
					<input name = "pw" type = "password" placeholder = "비밀번호" type="text" required style="text-align:center; width:250px; height:30px; letter-spacing: 1px"><br>   
					<!-- 패스워드 인풋창 => type을 패스워드로 설정해 입력시 어떤 글씨를 치고있는지 보이지 않게함 -->
					</font>
					
					<br>
					
					<button>LOGIN</button><br>  <!-- 버튼 타입 기본 submit -->
					<br>
					<br>
					<br>
					<br>
				</form>
				
				<form action = "User.jsp">  <!-- 회원가입창 연결을 위한 form -->
				회원이 아닌가요? 
				<button>회원가입</button>  <!-- 회원가입 버튼  -->
				<br> 
				</form> <!-- 회원가입 form닫기  -->
			<% } %> <!-- 세션조건 닫기 -->
		</nav> <!-- 본문 닫음 -->
	</body>
</html>