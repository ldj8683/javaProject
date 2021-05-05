<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String usingId = (String)session.getAttribute("userId");
	String loginId = (String)session.getAttribute("userId");
%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="margin: 0px">
	<head>
		<meta charset="UTF-8">
		<title>회원 정보</title>
		<link rel="stylesheet" type="text/css" href="resources/css/style.css">
		<link rel="stylesheet" type="text/css" href="resources/css/main/information.css">
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
		</style>
		<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
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
			<div id = "userInfoForm">
				<!-- 로그인한 아이디에 대한 정보를 가져와서 출력을 해줍니다. -->
				<table id="userInfoTable">
					<tr >
						<td style="text-align: right;">
							아이디:
						</td>
						<td style="text-align: left; padding-left: 10px;">
							${vo1.userid}
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">
							이름:
						</td>
						<td style="text-align: left; padding-left: 10px;">
							${vo1.uname}
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">
							주소:
						</td>
						<td style="text-align: left; padding-left: 10px;">
							${vo1.uaddr}
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">
							전화번호:
						</td>
						<td style="text-align: left; padding-left: 10px;">
							${vo1.utel}
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">
							이메일:
						</td>
						<td style="text-align: left; padding-left: 10px;">
							${vo1.uemail}
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">
							생년월일:
						</td>
						<td style="text-align: left; padding-left: 10px;">
							${vo1.ubirth}
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">
							성별:
						</td>
						<td style="text-align: left; padding-left: 10px;">
							${vo1.ugender}
						</td>
					</tr>
				</table>
				<hr color="black">
				<div style = "text-align: center;">
					<a href="UpdateValue">
						<button id="goUpdate" class="infoBtn">수정하기</button>
					</a>
					&nbsp;&nbsp;&nbsp;
					<a href="DeleteValue">
						<button id="goDelete" class="infoBtn">삭제하기</button>
					</a>
				</div>
				<hr color="black" size="7">
				<h2 style="font-weight: bold; background-color: white; width: 200px; text-align: center; border-radius: 5px; padding: 5px;">
					최근 본 동영상
				</h2>
				<hr color="black">
				<div id="resentVideo">
					<!-- 테이블을 만들어서 최근 본 동영상중 가장 최신 3개만을 출력해줍니다. -->
					<table style="text-align: center; background: white; font-size: 20px; font-weight: bold; padding: 10px; border-radius: 5px;">
						<tr>
							<!-- 최근 본 동영상들이 최신순으로(SQL문에서 order by를 이용) 리스트에 정렬이 되어 저장되었습니다. -->
							<!-- 3개만을 가져오고 싶기 때문에, 리스트의 0~2까지의 원하는 정보를 출력해 줍니다. -->
							<c:forEach var="voResent" items="${list}" begin="0" end="2">
								<td style="width:300px;">
									<!-- 최근 본 동영상에 대한 내용을 출력할때 해당 동영상의 이미지를 출력해주고 그 이미지를 눌렀을때 
											video_code를 이용해서 그 동영상을 볼 수 있는 페이지로 넘어가  줍니다.-->
									<a href="Videoplay.jsp?video_code=${voResent.video_code}">										
										<img src="${voResent.video_img}">
									</a><br>
									<!-- 로그인을 할 상태에서 동영상을 보았을 때, 그 동영상을 보기 시작한 날짜가  저장된 테이블에서
											Date 데이ㅓ를 가져와서 출력해줍니다. -->
									시청날짜<br> ${voResent.rvdate}<br>
								<td>
							</c:forEach>
						</tr>
					</table>
					<hr color="black">
				</div>
			</div>
		</div>
	</body>
</html>