
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
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
		
		<nav id="Content" align="center" > <!-- 각 조원들이 넣게될 본문 레이아웃 생성 -->
		
		
			
			<b><font size = "20em" color = "black" >
				회원가입
			</font></b> <br>
			<hr style = "border : solid 3px white;'">
			
			<form action = "UserCreate.jsp">  <!-- 하단 입력데이터를 UserCreate.jsp 로 전송해주기 위한 form -->
			<b><font size = "4em" color = "black" > <!-- font 설정 시작 -->
			<table align="center"> <!-- 회원가입 테이블 생성 / 테이블 위치 가운데 정렬 -->
				*전체 항목 모두 필수 항목입니다. <br>  <!-- 전체항목을 입력하지않으면 회원가입창이 넘어가지 않을 것임을 보여줌 -->
				<tr>
				<br>  <!-- 입력창과 알림문구 사이의 공백을 띄우기 위함   -->
				</tr>
				<tr>
					<td>
						아이디  
					</td>
					<td>
						<input name = "id" type="text" required style="text-align:center;width:200px; height:30px; letter-spacing: 1px; text-transform: lowercase"> <br>
						<!-- id 인풋창. required 필수항목, style 가운데정렬, input창의 너비, 높이, 글자간 간격, 입력된 글자를 소문자로 자동변환 해주는 것 -->
						<!-- 회원가입시 소문자,대문자 차이로 데이터 처리할때 오류가 생기는것을 없게하기 위함  -->
					</td>				
				</tr>
				<tr>
					<td>
						패스워드  
					</td>
					<td>
						<input name = "pw" type="text" required style="text-align:center; width:200px; height:30px; letter-spacing: 1px; text-transform: lowercase"><br>
						<!-- pw 인풋창. required 필수항목, style 가운데정렬, input창의 너비, 높이, 글자간 간격, 입력된 글자를 소문자로 자동변환 해주는 것   -->
						<!-- 로그인 시 패스워드 입력창에 글씨가 안보이게 설정해두었음 로그인 오류를 줄이기 위해 소문자로 자동변환  -->
					</td>
				</tr>
				<tr>
					<td>
						이름 
					</td>
					<td>
						<input name = "name" type="text" required style="text-align:center; width:200px; height:30px; letter-spacing: 1px"><br>
					</td>
				</tr>
				<tr>
					<td>
						핸드폰번호  
					</td>
					<td>
						<input name = "tel" type="text" maxlength = "11" required style="text-align:center; width:200px; height:30px; letter-spacing: 1px"><br>
						<!-- maxlength = 글씨수 제한을 두는것. 핸드폰번호는 11자리로 11개의 숫자만 입력가능  -->
					</td>
				</tr>
				<tr>
					<td>
						E-mail 
					</td>
					<td>
						<input name = "email" type="text" required style="text-align:center; width:200px; height:30px; letter-spacing: 1px"><br>
					</td>
				</tr>
				<tr>
					<td>
						주소  
					</td>
					<td>
						<input name = "addr" type="text" required style="text-align:center; width:200px; height:30px; letter-spacing: 1px"><br>
					</td>
				</tr>
				<tr>
					<td>
						생년월일  
					</td>
					<td>
						<input name = "birth" type="text" maxlength = "8" required style="text-align:center; width:200px; height:30px; letter-spacing: 1px"><br>
						<!-- maxlength = 생년월일 8글자만 입력가능 -->
					</td>
				</tr>	
							
				<table align="center"> <!-- 회원가입 전체테이블 안에 입력 테이블 생성 / 가운데 정렬 -->
				<tr>
					<td>
						<br><br><button type = "submit">회원가입</button>  <!-- form안에 입력된 값을 보내주는 버튼 생성 -->
					</td>
				</tr>
				</table> <!-- 입력 테이블 닫기 -->
			</font></b>
			</table> <!-- 회원가입 전체 테이블 닫기 -->
			</form>
			
			
		</nav> <!-- 본문 닫음 -->
	</body>
</html>