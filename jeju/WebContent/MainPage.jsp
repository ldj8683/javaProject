<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 세션
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인 페이지 테스트</title>
		<link rel="stylesheet" type="text/css" href="style.css"><!-- style.css와 연결 -->
		<style>
			/* 테이블로 만든 메뉴의 메인페이지, 마이페이지, 고객의소리, 로그인의 글자뿐만이 아니라 셀을 눌러도 링크로 넘어갈 수 있도록 하기 위해서 설정 */
			.cellIconBox{ /* 셀 전부에 설정을 해주기 위해서 클래스를 cellIconBox로 정해서 이 것만 설정을 해줌 */
				display:block;	/* 한셀 전부를 클릭해도 되게 했음 */
				width:100%;	/* 해당 셀의 넓이를 꽉채워주려고 100%를 주었습니다. */
				text-decoration:none;	/* 밑줄을 없애줍니다. */
				text-align: center;	/* 가운데 정렬 */
				font-size:30px;	/* 글자크기 */
				font-weight: bold;	/* 글자를 굵게 해줬습니다 */
				color:black;	/* 글자색 */
			}			
		</style>
	</head>
	
	<body>
	
		<!-- header 테그 부분 전체를 복사해주세여 그리고 style.css도 교체해주세요 -->	
		
		<!-- 
			header : 웹 문서 맨 윗부분에 있으며 웹사이트 이름, 로그인이나 회원가입, 사이트맵과 같은 글로벌 링크가 구성된 영역
			nav : 본문의 요소들 중에서 세션을 구성하는 요소중 하나로, 링크 중 메뉴와 같이 중요도가 높은 링크를 체계적으로 구성해 놓은 것
			div : division의 약자, 경계나 영역을 분활한다는 의미로 브라우져의 화면에 구현되는 영역을 나누고 표현할때 사용
				
			태그 안의 id, name, class의 차이
			id는 하나의 페이지에서 이름이 유일한 것으로, 화면을 구성하는 것들에게 모두 따로따로 접근할 때 이용. style 적용시 #id값 으로 쓴다.
			class는 자주 사용되는 스타일에 적용하는 것으로 생각하면 됨. 여러개를 사용할 수 있습니다. style 적용시 .class값 으로 쓴다.
			name 중목이 가능하며, 그룹으로 접근하고 싶을 때 활용
			 -->
	
		<header><!-- HTML 레이아웃 중 하나인 header 부분에 메뉴를 생성 -->
			<nav id = "logo">	<!-- HTML 레이아웃중 하나인 nav 부분에 생성, id는 logo 로 지정해서 style.css에서 logo를 이용해 style을 만들어줌  -->
				<a href="MainPage.jsp"> <!-- 로고를 누르면 메인페이지를 갈수 있도록 하는 a 태그 생성 -->
					<img src="pictures/MainLogo.png" width="80" height="80">
						<!-- 80x80짜리 크기를 가진 이미지를 생성, src에 입력한 경로를 따라서 이미지를 가져옴 -->
				</a>
			</nav> <!-- 로고 레이아웃 완료 -->
			
			<nav id = "menu" ><!-- menu라는 id를 가진 레이아웃을 생성 -->
				<table>	<!-- 테이블 생성 -->
					<tr>	<!-- 테이블의 한줄을 생성 -->
						<th colspan="4" style="text-align: right; height: 41px">
								 <!-- 4열이 합병되고 오른쪽 정렬, 높이가 41px인 테이블 헤더 생성 -->
							<% if( id == null) { %> <!-- 세션을 이용해 로그인이 되지 않고 있을 때 아래 구문을 수행 -->
								로그인을 해주세요.
							<% } else { %>	<!-- 로그인이 되었을 경우 아래 구문 수행 -->
							    <%= id %>님 환영합니다.<a href="Logout.jsp">로그아웃</a>	<!-- 로그인된 사용자의 아이디를 출력 -->
							<% } %>
						</th><!-- 테이블 헤더 완성 -->
					</tr><!-- 테이블의 한줄을 완성 -->
					<tr>
						<td>
							<!-- 테이블 데이터 셀을 생성 -->
							<a class="menuLink" href="MainPage.jsp">메인페이지</a>
									<!-- 세션을 이용해 메인페이지 셀을 눌렀을때 로그인된 아이디 값을 넘겨주면서 메인페이지로 감 -->
						</td>
							<!-- 테이블 데이터 완성 -->
						<td>
							<a class="menuLink" href="MyPage.jsp">마이페이지</a>
						</td>
						<td>
							<a class="menuLink" href="ServiceMain.jsp">고객센터</a>
						</td>
						<td>
							<% if( id == null) {	%>
							<!-- 세션을 이용해 로그인이 되지 않았을때 로그인을 하기위해서 로그인페이지로 연결되는 데이터셀을 생성 -->
								<a class="menuLink" href="Login.jsp">로그인</a>
							<%} else {%>
							<!-- 로그인이 성공 했을경우 로그아웃을 할 수 있게하는 로그아웃으로 연결되는 셀을 생성 -->
								<a class="menuLink" href="UserUpdate.jsp">회원 정보</a>
							<%} %>
						</td>						
					</tr>
				</table> <!-- 테이블 완성 -->
			</nav><!-- menu 레이아웃 완료 -->
		</header> <!-- 헤더 레이아웃 완료 -->
		
		
		
		<nav id="FixedBasket"><!-- 오른쪽에 고정될 장바구니 디스플레이를 만들기위해서 FixedBasket 아이디를 가진 nav 레이아웃 생성 -->
			<table id="BasketContent" style="width:100%" >	<!-- 장바구니는 아래로 쭉 나와야 하기 때문에 하나의 열을 가진  테이블을 생성-->
				<% if (session.getAttribute("productlist")!=null){ 
					/* arraylist_basket.jsp에서 세션으로 설정한 productlist를 담을 새로운 리스트를 생성 */
				 	ArrayList<String> productlist1 = (ArrayList)session.getAttribute("productlist"); /* object -> arraylist */
						if(productlist1.size()<5){ /* 최근방문페이지가 5개 보다 작은경우  */
							switch(productlist1.size()) {/* switch-case문을 통해 방문페이지가 1개 2개 3개 4개 인경우 나눔 */
							case 1:%>
			<tr>
				<th>최근 본 상품</th>
			</tr>
			<tr><!-- 방문한페이지주소 (링크)+ 이름으로 표현-->
				<td><a href=<%=productlist1.get(productlist1.size()-1) %>>1.최근본상품</a></td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<%break;
			case 2:%>
			<tr>
				<th>최근방문페이지</th>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-1) %>>1.최근본상품</a></td>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-2) %>>2.최근본상품</a></td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<%break;
							case 3: %>
			<tr>
				<th>최근 본 상품</th>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-1) %>>1.최근본상품</a></td>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-2) %>>2.최근본상품</a></td>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-3) %>>3.최근본상품</a></td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<%break;
							case 4:%>
			<tr>
				<th>최근 본 상품</th>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-1) %>>1.최근본상품</a></td>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-2) %>>2.최근본상품</a></td>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-3) %>>3.최근본상품</a></td>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-4) %>>4.최근본상품</a></td>
			</tr>
			<tr>
				<td>최근 본 상품</td>
			</tr>
			<%break;}%><!-- 스위치문 닫기 -->
			<!-- if문닫기(배열리스트길이가 5보다 작은경우) -->

			<!-- 방문한 페이지가 5개 이상인 경우 -->
			<%}else if(productlist1.size()>=5){ %><!-- 길이가 5이상인경우 -->
			<tr>
				<th>최근 본 상품</th>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-1) %>>1.최근본상품</a></td>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-2) %>>2.최근본상품</a></td>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-3) %>>3.최근본상품</a></td>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-4) %>>4.최근본상품</a></td>
			</tr>
			<tr>
				<td><a href=<%=productlist1.get(productlist1.size()-5) %>>5.최근본상품</a></td>
			</tr>
			<%}%><!-- 길이가 5이상인경우 닫기 -->
			<!-- 방문한 페이지가 없는 경우 기본값으로 비워둠 -->
			<%}else{%>
			<tr>
				<th>최근 본 상품</th>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<tr>
				<td>호텔이름</td>
			</tr>
			<%}%>
			</table><!-- 테이블을 닫음 -->
		</nav> <!-- 장바구니 레이아웃을 닫아줌 -->
		
		
		
		<nav id="Content"> <!-- 본문, 각 조원들이 넣게될 본문 레이아웃 생성 -->
			<!-- 메인 페이지의 기본 이미지 -->
			<div style="width=85%;"><!-- Content라는 id를 가진 넓이를 지정한 본문의 넓이의 85%를 사용하도록 설정 -->
				<img id="mainPicture" src="pictures/MainJeju.jpg" width="800" height="400"> <!-- 일단 잘 나오는지 보기위해서 이미지 삽입 -->
			</div>
			<table style="width: 80%; margin-left:100px;">
			<!-- 각 아이콘들의 정렬을 하기 위해서 1x4의 하나의 테이블을 만들어서 각 데이터셀에 저장 -->
				<tr>
					<td>
						<a class="cellIconBox" href="ProductSummary.jsp?classification=Hotel" >
						<!-- 상품요약페이지로 이동을 할떼 Hotel이라는 파라미터를 같이 넘겨줍니다. -->
							<img name="Hotel" id="HotelIcon" src="pictures/HotelIcon.png" width="100" height="100">
							 <!-- 가로,세로 크기 100짜리의 그림을 출력 -->
							<br>호텔
						</a>
					</td>
					<td>
						<a class="cellIconBox" href="ProductSummary.jsp?classification=Resort" > <!-- 상품요약페이지로 이동을 할떼 Resort이라는 파라미터를 같이 넘겨줍니다. -->
							<img name="Resort" id="ResortIcon" src="pictures/ResortIcon.png" width="100" height="100">
							<br>리조트
						</a>
					</td>
					<td>
						<a class="cellIconBox" href="ProductSummary.jsp?classification=Pension" >	<!-- 상품요약페이지로 이동을 할떼 Pension이라는 파라미터를 같이 넘겨줍니다. -->
							<img name="Pension" id="PensionIcon" src="pictures/PensionIcon.png" width="100" height="100">
							<br>팬션
						</a>
					</td>
					<td>
						<a class="cellIconBox" href="ProductSummary.jsp?classification=GuestHouse" > <!-- 상품요약페이지로 이동을 할떼 GuestHouse이라는 파라미터를 같이 넘겨줍니다. -->
							<img name="GuestHouse" id="GuestHouseIcon" src="pictures/GuestHouseIcon.png" width="100" height="100">
							<br>게/하
						</a>
					</td>
				</tr>
			</table>
		</nav> <!-- 본문 닫음 -->
	</body><!-- body 닫음 -->
</html>