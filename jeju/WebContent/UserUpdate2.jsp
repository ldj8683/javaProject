<%@page import="jeju.userVO"%>
<%@page import="jeju.userDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    userDB db = new userDB();
	/* userupdate에서 입력된 수정값들을 변수로 받음 */
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");
    String addr = request.getParameter("addr");
    String birth = request.getParameter("birth");  
    
    /* 가방생성 */
    userVO bag = new userVO();
    
    /* 수정데이터들 가방에 넣기 */
    bag.setId(id);
    bag.setPw(pw);
    bag.setName(name);
    bag.setTel(tel);
    bag.setEmail(email);
    bag.setAddr(addr);
    bag.setBirth(birth);
	
    /* 가방으로 update메서드 실행 */
	db.update(bag);
	
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>회원정보 수정 및 탈퇴</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<script type="text/javascript" src="js/userdelete.js"></script>
<meta charset="UTF-8">
<title>회원정보 수정 및 탈퇴</title>
<!-- 스크립트로 회원정보 수정이 완료되었다는 알림창 띄우기 -->
	<script type ="text/javascript">
	alert("회원정보 수정이 완료되었습니다.")
	</script>
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
		
		<nav id="Content" style="text-align: center;" > <!-- 각 조원들이 넣게될 본문 레이아웃 생성 -->

			<b><font size = "7em" color = "black" >
				회원정보 수정 및 탈퇴
			</font></b> <br>
			<hr style = "border : solid 3px white;'">
			<br>
			<form action = "UserUpdate2.jsp">
				<!-- <b><font size = "4em" color = "black" > -->
				<table align="center" style="text-align: center;font-weight: 900;">
					<!-- *전체 항목 모두 필수 항목입니다.<br> -->
					<tr>
						<td colspan="2">
							*전체 항목 모두 필수 항목입니다.
							
						</td>
					</tr>
					<tr>
					<!-- 수정된 정보로  value 값이 변경되어 update메서드 실행 후 다시 회원정보수정화면 보여주기 -->
						<td>
							아이디  
						</td>
						<td>
							<input name = "id" type="text" value = <%=bag.getId()%> readonly style="text-align:center;width:200px; height:30px; letter-spacing: 1px"> <br>
						</td>
					</tr>
					<tr>
						<td>
							패스워드  
						</td>
						<td>
							<input name = "pw" type="text" required style="text-align:center; width:200px; height:30px; letter-spacing: 1px"><br>
						</td>
					</tr>
					<tr>
						<td>
							이름 
						</td>
						<td>
							<input name = "name" type="text" value = <%=bag.getName()%> style="text-align:center; width:200px; height:30px; letter-spacing: 1px"><br>
						</td>
					</tr>
					<tr>
						<td>
							핸드폰번호  
						</td>
						<td>
							<input name = "tel" type="text" maxlength = "11" value = <%=bag.getTel()%> style="text-align:center; width:200px; height:30px; letter-spacing: 1px"><br>
						</td>
					</tr>
					<tr>
						<td>
							E-mail 
						</td>
						<td>
							<input name = "email" type="text" value = <%=bag.getEmail()%> style="text-align:center; width:200px; height:30px; letter-spacing: 1px"><br>
						</td>
					</tr>
					<tr>
						<td>
							주소  
						</td>
						<td>
							<input name = "addr" type="text" value = <%=bag.getAddr()%> style="text-align:center; width:200px; height:30px; letter-spacing: 1px"><br>
						</td>
					</tr>
					<tr>
						<td>
							생년월일  
						</td>
						<td>
							<input name = "birth" type="text" maxlength = "8" value = <%=bag.getBirth()%> style="text-align:center; width:200px; height:30px; letter-spacing: 1px"><br>
						</td>
					</tr>
					<tr>
						<td >
							<button type = "submit">회원정보 수정</button>							
						</td>
						<td>
							<a href = "UserDelete.jsp">
							<button type = "button" >회원탈퇴</button>
							</a>
						</td>
						
					</tr>
					</table>
					</form>
					

		</nav>

	</body>
</html>