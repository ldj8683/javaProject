<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String loginId = (String) session.getAttribute("userId");
%>
<!DOCTYPE html>
<html style="margin: 0px">
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	function notLogin() {
		alert("로그인 되지 않았습니다. 로그인을 해주세요!")
	}
	$(function() {
		$('#football').click(function() {
			$.ajax({
				url : "video_list_search",
				data : {
					video_category : "football",
					nowPage : "1",
					cntPerPage : "4"

				},
				success : function(x) {
					$('#video_list_search').html(x)
				}
			})
		})
		$('#baseball').click(function() {
			$.ajax({
				url : "video_list_search",
				data : {
					video_category : "baseball",
					nowPage : "1",
					cntPerPage : "4"
				},
				success : function(x) {
					$('#video_list_search').html(x)
				}
			})
		})
		$('#basketball').click(function() {
			$.ajax({
				url : "video_list_search",
				data : {
					video_category : "basketball",
					nowPage : "1",
					cntPerPage : "4"
				},
				success : function(x) {
					$('#video_list_search').html(x)
				}
			})
		})
		$('#esports').click(function() {
			$.ajax({
				url : "video_list_search",
				data : {
					video_category : "esports",
					nowPage : "1",
					cntPerPage : "4"
				},
				success : function(x) {
					$('#video_list_search').html(x)
				}
			})
		})
	}) //start
</script>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
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

#loginSession {
	color: white;
	background: #666666;
	font-size: 20px;
	font-family: bold;
}
}
</style>
</head>
<body id="body">
	<nav id="top">
		<!-- 로고 이미지를 넣고, 로고를 눌렀을 경우 메인페이지로 이동이 되록 설정 -->
		<div id="mainLogo">
			<a href="MainPage.jsp"> <img src="resources/img/MainLogo.png"
				width="90" height="90">
			</a>
		</div>
		<div>
			<form action="">
				<input type="text" name="search"> <input type="submit"
					value="검색">
			</form>
		</div>
		<!-- 로그인을 하지 않았을 경우는 로그인을 하라는 문구가 출력이 되고,
				  로그인을 했을 경우 세션이 설정이 되어서 로그인한 아이디님을 환영한다는 출력을 해줌
			-->
		<div id="loginSession">
			<%
				if (session.getAttribute("userId") == null) {
			%>
			로그인을 해주세요!
			<%
				} else {
			%>
			${userId}님 환영합니다.
			<%
				}
			%>
		</div>
	</nav>
	<nav id="leftMenu">
		<div>
			<h3>
				<a href="MainPage.jsp"> 메인페이지 </a>
			</h3>
		</div>
		<br>
		<hr color="white">
		<!-- 처음에 매뉴가 접혀져있고 로그인 버튼을 누르면 아래 '로그인, 회원정보, 로그아웃' 메뉴가 아래로 펼쳐짐 -->
		<button class="accordion">로그인</button>
		<div class="panel">
			<!-- 펼쳐지는 메뉴가 들어가는 부분, style 설정 -->
			<!-- 로그인 메뉴를 누를 경우 로그인 화면으로 넘어감 -->
			<div id="loginFaded" class="leftMenuContent">
				<a href="UserLogin.jsp"> 로그인 </a>
			</div>
			<!-- 로그인이 되지 않았을경우 로그인이 되지 않았음을 알리는 alert를 실행
					 로그인이 되었을 경우 해당 아이디의 회원정보를 출력하는 페이지로 넘어감
				 -->
			<%
				if (session.getAttribute("userId") == null) {
			%>
			<div class="leftMenuContent">
				<a href="javascript:notLogin();"> 회원정보 </a>
			</div>
			<%
				} else {
			%>
			<!-- 로그인을 해서 회원정보를 눌렀을 경우 UserInformation2로 매핑을 해서 컨트롤러로 넘겨줌 -->
			<div class="leftMenuContent">
				<a href="UserInformation2"> 회원정보 </a>
			</div>
			<%
				}
			%>
			<!-- 세션을 끊어줌 -->
			<div class="leftMenuContent">
				<a href="UserLogout.jsp"> 로그아웃 </a>
			</div>
		</div>
		<hr color="white">
		<button class="accordion">미디어</button>
		<div class="panel">
			<div class="leftMenuContent">
				<a href="all">축구 영상</a>
			</div>
			<%
				if (session.getAttribute("userId") == null) {
			%>
			<div class="leftMenuContent">
				<a href="javascript:notLogin();"> 내 동영상 </a>
			</div>
			<%
				} else {
			%>
			<!-- 로그인을 해서 회원정보를 눌렀을 경우 UserInformation2로 매핑을 해서 컨트롤러로 넘겨줌 -->
			<div class="leftMenuContent">
				<a href=myvideo?userid= <%=loginId%>> 내 동영상 </a>
			</div>
			<%
				}
			%>
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
	</nav>
	<!-- 복사 완료 -->
	<div id="content" style="height: 1400px;">
		<div id="video_recently">
			<div class="video_all">
				<div class="video_title">
					<br>
					<hr></hr>
					<h2 style="margin-left: 50px;">인기 동영상!</h2>
				</div>
				<ul class="video_cir" style="display: flex; list-style: none;">
					<c:forEach var="vo" items="${list}" begin="0" end="2">
						<li style="margin-right: 30px;">
							<div class="video_img">
								<a href="Videoplay.jsp?video_code=${vo.video_code}"><img
									src="${vo.video_img}"></a>
							</div>
							<div class="video_name">
								<a href="Videoplay.jsp?video_code=${vo.video_code}">${vo.video_name}</a><br>
								좋아요 : ${vo.video_good} 조회수 : ${vo.video_views}
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="video_category" style="width: 100%;">
			<button id="football"
				style="width: 220px; height: 60px; margin-top: 20px;">football</button>
			<button id="baseball"
				style="width: 220px; height: 60px; margin-top: 20px;">baseball</button>
			<button id="basketball"
				style="width: 220px; height: 60px; margin-top: 20px;">basketball</button>
			<button id="esports"
				style="width: 220px; height: 60px; margin-top: 20px;">e-sports</button>
		</div>
		<div id="video_list_search">
			<div id="video_contents">
				<div id="video_recently">
					<div class="video_all" style="margin-right: 300px;">
						<div class="video_title">
							<br>
							<hr></hr>
							<h2>선택한 동영상 : ${nae}</h2>
						</div>
						<ul class="video_cir" style="list-style: none;">
							<c:forEach var="vo" items="${viewAll}">
								<li>
									<div class="video_img">
										<a href="Videoplay.jsp?video_code=${vo.video_code}"><img
											src="${vo.video_img}"></a>
									</div>
									<div class="video_name">
										<a href="Videoplay.jsp?video_code=${vo.video_code}">${vo.video_name}</a><br>
										좋아요 : ${vo.video_good} 조회수 : ${vo.video_views}
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div style="display: block; text-align: center; color: black;">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="Videopaging?video_category=${nae}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a id="paging"
										href="Videopaging?video_category=${nae}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="Videopaging?video_category=${nae}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
</body>
</html>