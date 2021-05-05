<%@page import="jeju.ReservationVO"%>
<%@page import="jeju.ReservationDB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 임시 아이디 세션연결 -->
<%--  <% session.setAttribute("id", "whaone2"); %> <!-- 데이터타입 : Object --> --%>

<!-- 예약테이블로 부터 예약정보를 받아온다. -->
<%
	// 로그인 세션
	String id = (String)session.getAttribute("id");
	ReservationDB db = new ReservationDB();
	ArrayList<ReservationVO> list = db.read(id); //id 정보를 주면 그 id에 해당하는 예약정보를 받아온다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
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
				margin: 0px 0px 5px -22px;
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
				width: 790px;
				height: 450px;
				background: white;
				overflow: auto; /* MyPagecenter영역에 overflow 기능 사용하여 초과되는게 있으면 스크롤 처리 */
				margin: 0px 20px 0px -20px
			}
			#td{
				align = "center";
			}
		</style>
</head>
<body>
	<nav id = "myMain">
		<nav id = "MyTop">
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
		</nav>
		<nav id = "MyPageContent">
			<nav id="Content">
				<div id="MyPageleft">
					<ul type="circle">
						<li class="part">
							<!-- class속성은 CSS에서 내가 li태그에 해당하는 부분을 공통적으로 수정하고자 할 때 class사용 -->
							<a href="MyPageContentInquiry.jsp">예약조회</a>
						</li>
						<li class="part"><a href="MyPageContentBasket.jsp">장바구니</a>
						</li>
					</ul>
				</div>
				<!-- 예약조회를 보여주는 화면부분 -->
				<div id="MyPageright">
					<p class = "a">예약조회</p>
					<hr id = "MyPagehr" color = "#16b4f7" size = 6 style="width : 113%">
					<div id="MyPagecenter" >
						<!-- 위에서 디비처리를 통해 read해온 예약정보리스트를 불러오기 -->
						<!-- 예약정보가 들어있는 리스트 활용 -->
						<% for( int i = 0; i<list.size(); i++){
							ReservationVO bag = list.get(i); %>
												
						<!-- 예약정보에 대한 것과 값들을 넣을 테이블 생성 -->
						<table border="1">
							<tr> <!-- tr: table row 한 행에 해당하는 테이블 -->
							<td align = "center">예약번호</td>
							<td align = "center">아이디</td>
							<td align = "center">예약자이름</td>
							<td align = "center">예약자번호</td>
							<td align = "center">예약일</td>
							<td align = "center">결제방법</td>
							<td align = "center">방정보</td>
							<td align = "center">비용</td>
							<td colspan="2" align = "center">예약관리</td>
							
							</tr>
							<tr>
							<td align = "center"><%= bag.getRes_num()%></td>
							<td align = "center"><%= bag.getRes_id()%></td>
							<td align = "center"><%= bag.getRes_name()%></td>
							<td align = "center"><%= bag.getRes_tel()%></td>
							<td align = "center"><%= bag.getRes_date()%></td>
							<td align = "center"><%= bag.getRes_payment()%></td>
							<td align = "center"><%= bag.getRes_room()%></td>
							<td align = "center"><%= bag.getRes_cost()%>원</td>
							
							<!-- form태그 안에서 여러개의 주소로 보내야 할 경우 formaction을 활용하면된다. -->
							<!-- 상품 수정/ 취소를 위해 버튼 생성하고 버튼을 누를 시 예약번호를 수정/취소해주는 db처리 페이지로 보내준다. -->
							<form>
							<td><button name = "upd" value = <%= bag.getRes_num()%> formaction="ReservationUpdate.jsp">수정</button></td>
							<td><button name = "del" value = <%= bag.getRes_num()%> formaction="ReservationDeleteDB.jsp">취소</button> </td>
							</form>
							</tr>
							</table>
							<br>
							<% }%>
						
					</div><!-- div id="MyPageright" 닫기 -->
				</div>
			</nav>		
		</nav>
	</nav>

</body>
</html>