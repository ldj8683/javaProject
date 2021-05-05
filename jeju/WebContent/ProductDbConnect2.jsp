<%@page import="jeju.ProductVO"%>
<%@page import="jeju.ProductDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// ProductRegister에서 입력되어 받아온 파라미터값들을 각 데이터 형식에 맞게 선언된 변수들에게 저장, bag이라는 변수에 넣어서 한번에 전달함
	int productNum = Integer.parseInt(request.getParameter("productNum"));
	String productClassification = request.getParameter("productClassification");
	String productName = request.getParameter("productName");
	String productImage = request.getParameter("productImage");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productLocation = request.getParameter("productLocation");
	String[] productCommonList = request.getParameterValues("productCommon");
	String[] productInternalList = request.getParameterValues("productInternal");
	String productRoomType = request.getParameter("productRoomType");
	String productPickup = request.getParameter("productPickup");
	String productInfo = request.getParameter("productInfo");	
	String productId = request.getParameter("productId");
	
	// 로그인의 세션 설정을 사용
	String id = (String)session.getAttribute("id");
	
	// productCommon, productInternal의 배열로 저장된 데이터들을 하나로 합쳐주는 코드
	String productCommon = "";
	for(int i = 0 ; i < productCommonList.length ; i++ ){
		if(i == productCommonList.length-1){
			productCommon += productCommonList[i];
		} else {
			productCommon += productCommonList[i] + ",";
		}
	}
	
	String productInternal = "";
	for(int i = 0 ; i < productInternalList.length ; i++ ){
		if(i == productInternalList.length-1){
			productInternal += productInternalList[i];
		} else {
			productInternal += productInternalList[i] + ",";
		}
	}
	
	// 한번에 저장하기 위해서 bag라는 변수를만들어서 받은 파라미터 값들을 저장
	ProductVO bag = new ProductVO();
	bag.setProductNum(productNum);
	bag.setProductClassification(productClassification);
	bag.setProductName(productName);
	bag.setProductImage(productImage);
	bag.setProductPrice(productPrice);
	bag.setProductLocation(productLocation);
	bag.setProductCommon(productCommon);
	bag.setProductInternal(productInternal);
	bag.setProductRoomType(productRoomType);
	bag.setProductPickup(productPickup);
	bag.setProductInfo(productInfo);
	bag.setProductId(productId);
	
	// 저장된 bag를 이용해서 수정을 하기 위해서 update 메서드를 사용
	ProductDB db = new ProductDB();	
	db.update(bag);
		
%>
<html>
<head>
		<meta charset="UTF-8">
		<title>숙소 정보 등록 완료</title>
		<link rel="stylesheet" type="text/css" href="style.css"><!-- style.css와 연결 -->
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
		
		<nav id="Content" style="background:#16b4f7;"> <!-- 각 조원들이 넣게될 본문 레이아웃 생성 -->
			<div style="padding-top: 4em; padding-left: 4em;">
				숙소 정보 수정이 완료 되었습니다.<br><br>
				<!-- 수정 완료후 요약 페이지로 돌아갈때 파라미터 값을 넘겨줘서 등록된 곳의 요약을 보여주도록 href를 설정 -->
				<a href="ProductSummary.jsp?classification=<%= bag.getProductClassification() %>">
					<button>돌아가기</button>
				</a>
			</div>
		</nav> <!-- 본문 닫음 -->
	</body>
</html>