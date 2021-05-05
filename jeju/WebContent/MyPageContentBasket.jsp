<%@page import="jeju.ShoppingBagVO"%>
<%@page import="jeju.ShoppingBagDB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 로그인 세션
String id = (String)session.getAttribute("id");

/* 장바구니에 담은 상품을 보여주기 위해 db처리해주는 코드 */
ShoppingBagDB db = new ShoppingBagDB();
ArrayList<ShoppingBagVO> list = db.read(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">
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
	<nav id="myMain">
		<nav id="MyTop">
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
					<% if( id == null) {%> <!-- 세션을 이용해 로그인이 되지 않았을때 로그인을 하기위해서 로그인페이지로 연결되는 데이터셀을 생성 -->
						<a class="menuLink" href="Login.jsp">로그인</a>
					<% } else {%>	<!-- 로그인이 성공 했을경우 로그아웃을 할 수 있게하는 로그아웃으로 연결되는 셀을 생성 -->
						<a class="menuLink" href="UserUpdate.jsp">회원 정보</a>
					<%} %>
				</td>						
			</tr>
		</table> <!-- 테이블 완성 -->
	</nav><!-- menu 레이아웃 완료 -->
</header> <!-- 헤더 레이아웃 완료 -->
		</nav>
		<nav id="MyPageContent">
			<nav id="Content">
				<!-- 마이페이지 목록부분 -->
				<div id="MyPageleft">
					<ul type="circle">
						<li class="part">
							<!-- class속성은 CSS에서 내가 li태그에 해당하는 부분을 공통적으로 수정하고자 할 때 class사용 -->
							<a href="MyPageContentInquiry.jsp">예약조회</a>
						</li>
						<li class="part"><a href="MyPageContentBasket.jsp">장바구니</a></li>
					</ul>
				</div>
				<!-- 장바구니 화면부분 -->
				<div id="MyPageright">
					<p class="a">장바구니</p>
					<hr id="MyPagehr" color="#16b4f7" size=6>
					<div id="MyPagecenter">
						<!-- right라는 영역안에 center라는 영역을 만들기 위해 설정 -->
						<!-- 세션 설정해서 장바구니 만들기 ArrayList -->
						<!-- 장바구니페이지(session필요x + arraylist)-상품창에서 장바구니담기 버튼 누름 -> java서버에서 버튼 누른 페이지에 대한 주소값 받아오기  -->
						<%
							for (int i = 0; i < list.size(); i++) {
							ShoppingBagVO bag = list.get(i);
						%>
						<form>
						<table border="1">
							<tr>
								<td>관심상품</td>
								<td><a href=<%=bag.getProduct()%>><%=bag.getProduct_name()%></a></td><!-- 장바구니 내에 상품이름을 클릭하면 상품페이지로 이동하기 위해 a태그활용 -->
								<!-- Line 146~147 삭제버튼을 눌렀을 때 삭제기능처리가 있는 페이지로 넘어간다 -->
								<input type = "hidden" name = "id" value =<%=bag.getId()%>>
								<input type = "hidden" name = "product" value =<%=bag.getProduct()%>>
								<td><button formaction="ShoppingbagDelete.jsp">장바구니삭제</button></td>
							</tr>
						</table>
						</form>
						<%
							}
						%>
					</div>
				</div>
			</nav>
		</nav>
	</nav>

</body>
</html>