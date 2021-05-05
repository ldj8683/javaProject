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
		<%if( id == null) {%>
		<!-- 로그인을 하지 않은 경우 마이페이지 사용 불가 -> 로그인페이지로 넘겨준다 -->
		<script type="text/javascript">
			location.href = "Login.jsp"
		</script>
		<%}else{ %><!-- 로그인이 된경우 -->
		<nav id="MyTop">
			<jsp:include page="MyTop.jsp"></jsp:include>
		</nav>

		<nav id="MyPageContent">
			<jsp:include page="MyPageContent.jsp"></jsp:include>
		</nav>
		<%} %>
	</nav>

</body>
</html>