<%@page import="jeju.CustomerSoundVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jeju.CustomerSoundDB"%>
<%@page import="jeju.ProductVO"%>
<%@page import="jeju.ProductDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 로그인 세션
	String id = (String)session.getAttribute("id");


	// 등록된 번호를 받아서 해당 번호의 상세 정보를 보여주도록 등록번호 파라미터를 받아 저장하는 변수를 생성
	int productNum = Integer.parseInt(request.getParameter("productNum"));
	String productName = request.getParameter("productName");
	
	// 해당 등록 번호의 데이터가 들어있는 데이터 묶음(가방)을 만들어 줌
	ProductDB db = new ProductDB();
	ProductVO bag = db.read(productNum);
		
%>
<%
	// 그림을 저장을 할 때 숙박명1.jpg 이런식으로 등록이 되도록 하였습니다.
	// 같은 숙박장소의 사진을 같은 형식으로 숙박명2.jpg, 숙박명3.jpg 이런식으로 저장을 두었고
	// 출력을 하기 위해서 각각 img2, img3 변수를 만들어서 숙박명1.jpg에서 1의 부분을 2, 3으로 바꾸어서
	// 저장되어있는 사진들의 경로를 만들어 주었습니다.
	String str = bag.getProductImage();
	String img2 = str.replace("1", "2");
	String img3 = str.replace("1", "3");
%>

<%
	// ProductSummart.jsp 에서 평점을 가져오는 것과 같은 코드입니다.
	CustomerSoundDB db2 = new CustomerSoundDB();
	ArrayList<CustomerSoundVO> list = db2.list();
	int grade = 0;
	for(int i = 0; i< list.size(); i++){
		CustomerSoundVO bag2 = list.get(i);
		if(bag2.getCustomer_accommodation_name().equals(productName)){
			grade = bag2.getCustomer_grade();
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지 테스트</title>
<link rel="stylesheet" type="text/css" href="style.css">
<!-- style.css와 연결 -->
<style type="text/css">
#ButtonTable {/* 상세 정보 페이지의 본문의 맨위에 있는 숙소 수정, 숙소 삭제 등의 버튼이 들어갈 테이블의 css 설정입니다. */
	width: 1000px;
	height: 50px;
	/* border: 1px solid black; */
	padding-left: 450px;
}

.button {/* 버튼의 모양을 설정해 줍니다. */
	background-color: blue;
	width: 100px;
	height: 40px;
	font-size: 18px;
	font-weight: bold;
	color: white;
}

#ProductS { /* 호텔 사진이 저장될 테이블의 크기 설정입니다. */
	width: 1000px;
	text-align: center;
	/* border: 1px solid black; */
}

#ProductDetailImage { /* 상품 요약에 있던 사진을 가장 크게 보게 하기 위해서 그 이미지가 들어갈 부분의 크기를 설정해 주었습니다. */
	width: 600px;
	height: 450px;
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
			
			<nav id = "search">	<!-- search라는 id를 가진 검색부분 레이아웃을 생성 -->
				<form><!-- 이미지를 누르면 검색을 할수 있도록 하기위해서 form 형식으로 생성, 검색 하는것은 추후 추가 예정 -->
					<img id="SearchImage" src="pictures/Search.png" width="25" height="25"><!-- 검색모양 이미지 -->
					<!-- <input type="text" name="find"> -->
				</form>
			</nav> <!-- 검색 레이아웃 완료 -->
			
			<nav id = "menu" ><!-- menu라는 id를 가진 레이아웃을 생성 -->
				<table>	<!-- 테이블 생성 -->
					<tr>	<!-- 테이블의 한줄을 생성 -->
						<th colspan="4" style="text-align: right; height: 41px"> <!-- 4열이 합병되고 오른쪽 정렬, 높이가 41px인 테이블 헤더 생성 -->
							<% if(id == null) { %> <!-- 세션을 이용해 로그인이 되지 않고 있을 때 아래 구문을 수행 -->
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



	<nav id="FixedBasket">
		<!-- 오른쪽에 고정될 장바구니 디스플레이를 만들기위해서 FixedBasket 아이디를 가진 nav 레이아웃 생성 -->
		<table id="BasketContent" style="width: 100%">
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
		</table>
		<!-- 테이블을 닫음 -->
	</nav>
	<!-- 장바구니 레이아웃을 닫아줌 -->



	<nav id="Content" style="background: #95fceb;">
		<!-- 각 조원들이 넣게될 본문 레이아웃 생성 -->
		<table id="ButtonTable">
			<tr>
				<td style="width: 80%;">
					<% if( id != null ) {%>	<!-- 로그인이 되었을 경우 숙소를 예약, 수정, 삭제가 가능하도록 설정-->
						<!-- 예약하기와 장바구니는 로그인한 사람 모두가 가능하여야 하기때문에 로그인만 된다면 버튼이 나오도록 해줬습니다. -->
						<a href="ReservationPage.jsp?res_room=<%=bag.getProductName()%>&res_cost=<%=bag.getProductPrice()%>">
								<button class="button">예약하기</button>
						</a>
						<a href="Shoppingbag.jsp?name=<%=bag.getProductName()%>&page=<%=bag.getProductNum()%>">
								<button class="button">장바구니</button>
						</a>
						<% if( id.equals(bag.getProductId())) {%>
						<!-- 	등록을 할 때 숙박업소에 대한 정보와 같이  로그인을 한 아이디가 같이 저장이 됩니다.
								이때 비교구문을 통해서 현재 로그인 하고 있는 아이디와 저장된 아이디가 같을 경우에만 숙소 수정과 삭제를 할 수있는 버튼이 나오도록 했습니다.
						 -->
							<a href="ProductUpdate.jsp?num=<%=bag.getProductNum()%>&classification=<%=bag.getProductClassification()%>">
									<button class="button">숙소 수정</button>
							</a>
							<a href="ProductDelete.jsp?num=<%=bag.getProductNum()%>&classification=<%=bag.getProductClassification()%>">
									<button class="button">숙소 삭제</button>
							</a>
						<%} %>
					<%} %>
				</td>
				<td style="width: 19%;">
					<!-- 다시 요약 페이지로 돌아가기 위한 버튼 -->
					<a href="ProductSummary.jsp?&num=<%=bag.getProductNum()%>&classification=<%=bag.getProductClassification()%>">
							<button class="button">뒤로가기</button>
					</a>
				</td>
			</tr>
		</table>
		<table id="ProductS"><!-- 상세 정보의 사진들을 사진이 저장되어있는 경로를 이용해서 출력 해주는 테이블-->
			<tr>
				<td id="ProductDetailImage" colspan="2"><img
					src="<%=bag.getProductImage()%>" width="600"></td>			
				<td>
					<img src="<%=img2%>" width="350" height="200">
					<br>
					<img src="<%=img3%>" width="350" height="200">
				</td>
			</tr>
		</table>
		<!-- 사진이 출력되어있는 테이블의 아래 왼쪽에 들어갈 상세 정보가 출력되는 구역 -->
		<div style="float: left; width:50%; font-size: 20px; padding-left: 25px">
			<!-- <table style="border:1px solid black;"> -->
			<table style="width:100%; text-align: left; font-weight: bold;">
				<tr>
					<td colspan="2">
						등록자 ID >> <%=bag.getProductId()%>
					</td>					
				</tr>
				<tr>					
					<td>
						<%=bag.getProductName()%>(등록번호:<%=bag.getProductNum()%>)
					</td>
					<td>평점 >><%= grade %> </td>
				</tr>
				<tr>
					<td>
						가격 >> <%=bag.getProductPrice()%>
					</td>				
					<td>
						룸 타입 >> <%=bag.getProductRoomType()%>
					</td>					
				</tr>
				<tr>
					<td colspan="2">
						주소 >> <%=bag.getProductLocation()%>
					</td>					
				</tr>
			</table>
		</div>
		<!-- 사진 테이블 아래 오른쪽에 들어갈 상세 정보가 출력되는 구영 -->
		<div style="float: left; width:45%; font-size: 20px;">
			<!-- <table style="border:1px solid black;"> -->
			<table style="width:100%; text-align: left; font-weight: bold;">
				<tr>
					<td>
						공용 시설 >> <%=bag.getProductCommon()%>
					</td>					
				</tr>
				<tr>
					<td>
						객실 내부 시설 >> <%=bag.getProductInternal()%>
					</td>					
				</tr>
				<tr>
					<td>
						픽업 가능 >> <%=bag.getProductPickup()%>
					</td>
				</tr>
			</table>
		</div>
		<!-- 숙소 정보에 대한 부분을 출력해주는 구역 -->
		<div style="float: left; width:90%; font-size: 20px; font-weight: bold;  padding-left: 25px; padding-top: 25px">
			숙소 정보<br>
			<%=bag.getProductInfo()%>
		</div>
	</nav>
	<!-- 본문 닫음 -->
</body>
<!-- body 닫음 -->
</html>