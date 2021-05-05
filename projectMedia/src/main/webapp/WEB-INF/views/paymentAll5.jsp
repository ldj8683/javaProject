<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- 태그로 자바문법만들기 -->
<%
	String loginId = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html style="margin: 0px">
	<head>
		<meta charset="UTF-8">
		<title>상품 결제</title>
		<link rel="stylesheet" type="text/css" href="resources/css/style.css">
		<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style>
			.accordion {
				background-color: black;
				color: white;
				cursor: pointer;
				padding: 5px 0px 5px 10px;
				width: 100%;
				border: none;
				text-align: left;
				outline: none;
				font-size: 20px;
				transition: 0.4s;
			}
			.panel {
				color: white;
				font-size: 15px;
				text-align: right;
				display: none;
				background-color: black;
				overflow: hidden;
			}
			#loginSession{
				color: white;
				background: #666666;
				font-size: 20px;
				font-family: bold;
			}
			.btnStyle{
				background: white;
				font-size:20px;
				font-weight: bold;
				color: black;
				text-align: center;
				padding: 5px;
				border-radius: 5px;
			}
		</style>
		<script type="text/javascript">
			function notLogin() {
				alert("로그인 되지 않았습니다. 로그인을 해주세요!")
			}
		</script>
	</head>
	<body id="body">
		<nav id="top">
			<!-- 로고 이미지를 넣고, 로고를 눌렀을 경우 메인페이지로 이동이 되록 설정 -->
			<div id="mainLogo">
				<a href="MainPage.jsp">
					<img src="resources/img/MainLogo.png" width="90" height="90">
				</a>
			</div>
			<div>
				<form action="">
					<input type="text" name="search">
					<input type="submit" value="검색">
				</form>
			</div>
			<!-- 로그인을 하지 않았을 경우는 로그인을 하라는 문구가 출력이 되고,
				  로그인을 했을 경우 세션이 설정이 되어서 로그인한 아이디님을 환영한다는 출력을 해줌
			-->
			<div id="loginSession">
				<% if(session.getAttribute("userId") == null) {%>
					로그인을 해주세요!
				<%} else {%>
					${userId}님 환영합니다.
				<%} %>
			</div>
		</nav>
		<nav id="leftMenu">
			<div>
				<h3>
					<a href="MainPage.jsp">
						메인페이지
					</a>
				</h3>
			</div><br>
			<hr color="white">
			<!-- 처음에 매뉴가 접혀져있고 로그인 버튼을 누르면 아래 '로그인, 회원정보, 로그아웃' 메뉴가 아래로 펼쳐짐 -->
			<button class="accordion">로그인</button>
			<div class="panel">	<!-- 펼쳐지는 메뉴가 들어가는 부분, style 설정 -->
				<!-- 로그인 메뉴를 누를 경우 로그인 화면으로 넘어감 -->
				<div id="loginFaded" class="leftMenuContent">
					<a href="UserLogin.jsp">
						로그인
					</a>
				</div>
				<!-- 로그인이 되지 않았을경우 로그인이 되지 않았음을 알리는 alert를 실행
					 로그인이 되었을 경우 해당 아이디의 회원정보를 출력하는 페이지로 넘어감
				 -->
				<% if(session.getAttribute("userId") == null) {%>
					<div class="leftMenuContent">
						<a href="javascript:notLogin();">
							회원정보
						</a>
					</div>
				<%} else {%>
					<!-- 로그인을 해서 회원정보를 눌렀을 경우 UserInformation2로 매핑을 해서 컨트롤러로 넘겨줌 -->
					<div class="leftMenuContent">
						<a href="UserInformation2">
							회원정보
						</a>
					</div>
				<%} %>
				<!-- 세션을 끊어줌 -->
				<div class="leftMenuContent">
					<a href="UserLogout.jsp">
						로그아웃
					</a>
				</div>
			</div>
			<hr color="white">
			<button class="accordion">미디어</button>
			<div class="panel">
				<div class="leftMenuContent">
					<a href="all">축구 영상</a>
				</div>
				<% if(session.getAttribute("userId") == null) {%>
					<div class="leftMenuContent">
						<a href="javascript:notLogin();">
							내 동영상
						</a>
					</div>
				<%} else {%>
					<!-- 로그인을 해서 회원정보를 눌렀을 경우 UserInformation2로 매핑을 해서 컨트롤러로 넘겨줌 -->
					<div class="leftMenuContent">
						<a href=myvideo?userid=<%=loginId%>>
							내 동영상
						</a>
					</div>
				<%} %>
				<div class="leftMenuContent">
					<a href="VideoMain.jsp">Video Gallery</a> 
				</div>
			</div>
			<hr color="white">
			<button class="accordion">쇼핑몰</button>
			<div class="panel">
				<div class="leftMenuContent">
					<a href="sall">전체 쇼핑몰</a>
				</div>
				<div class="leftMenuContent">
					<a href="foot">축구 쇼핑몰</a>
				</div>
				<div class="leftMenuContent">
					<a href="base">야구 쇼핑몰</a>
				</div>
				<div class="leftMenuContent">
					<a href="basket">농구 쇼핑몰</a>
				</div>
				<div class="leftMenuContent">
					<a href="notice_all2.jsp">공지사항</a>
				</div>
				<div class="leftMenuContent">
					<a href="enquiries_all3.jsp">문의 사항</a>
				</div>
				<div class="leftMenuContent">
					<a href="cart_all4.jsp">장바구니</a>
				</div>
				<div class="leftMenuContent">
					<a href="payment_all5.jsp">결제</a>
				</div>
			</div>
			
			<!-- 실질적으로 펼쳐지게 해주는 부분-->
			<script>
			    var acc = document.getElementsByClassName("accordion");
			    var i;
			
			    for (i = 0; i < acc.length; i++) {
			      acc[i].addEventListener("click", function() {
			        this.classList.toggle("active");
			        var panel = this.nextElementSibling;
			        if (panel.style.display === "block") {
			          panel.style.display = "none";
			        } else {
			          panel.style.display = "block";
			        }
			      });
			    }
		    </script>
			<br>			
		</nav><!-- 복사 완료 -->
		<div id="content">
		<hr>
		<h3 style="font-weight: bold; background-color: white; width: 200px; text-align: center; border-radius: 5px; padding: 5px;">상품 결제</h3>
		<table border=1 bordercolor=grey style="margin: auto; width: 900px; font-size: 25px; background: white; border-radius: 5px; font-weight: bold; pading: 5px;">
			<tr align="center">
				<td>번호</td>
				<td>아이디</td>
				<td>이름</td>
				<td>연락처</td>
				<td>날짜</td>
				<td>상품</td>
				<td>코드</td>
				<td>수량</td>
				<td>금액</td>		
			</tr>
		<c:forEach var="vo" items="${list}">
			<tr align="center">
				<td>${vo.pnumber}</td>
				<td>${vo.userid}</td>
				<td>${vo.pname}</td>
				<td>${vo.ptel}</td>
				<td>${vo.pdate}</td>
				<td>${vo.pproduct}</td>
				<td>${vo.pcode}</td>
				<td>${vo.pquantity}</td>
				<td>${vo.ppayment}</td>
			</tr>
		</c:forEach>
		</table>
		<br>
			<div style="text-align: center">
				<a class="btnStyle" href="payment_insert5.jsp">등록</a>
				<a class="btnStyle" href="payment_select5.jsp">검색</a>
				<a class="btnStyle" href="payment_delete5.jsp">삭제</a>
			</div>
		</div>
	</body>
</html>