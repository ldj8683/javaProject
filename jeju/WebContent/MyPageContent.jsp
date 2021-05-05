<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- MyPage에서 참조하는 부분으로 이미 body안에 있는 내용이므로 Html, head, body 등 태그사용할 필요x -->
<nav id="Content">
	<div id="MyPageleft">
		<ul type="circle">
			<li class = "part">  <!-- class속성은 CSS에서 내가 li태그에 해당하는 부분을 공통적으로 수정하고자 할 때 class사용 -->
			<a href = "MyPageContentInquiry.jsp">예약조회</a>
			</li>
			<li class = "part">
			<a href = "MyPageContentBasket.jsp">장바구니</a>
			</li>
		</ul>
	</div>
	<!-- 마이페이지 디폴트 화면 -->
	<div id="MyPageright">
	<p class = "a">Mypage</p>
	<hr id = "MyPagehr" color = "#16b4f7" size = 6>
		<div id = "MyPagecenter"><!-- right라는 영역안에 center라는 영역을 만들기 위해 설정 -->
		환영합니다<br>
		저희 사이트를 사용해주셔서 감사합니다.
		</div>
	</div>
	
</nav>

