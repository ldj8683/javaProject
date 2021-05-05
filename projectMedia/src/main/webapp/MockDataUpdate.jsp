<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차 차량 등록여부 확인</title>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#btn2').click(function() {
				$.ajax({
					// Mock Data가 있는 곳으로 경로를 설정해줌
					url: "resources/data/PROJECT_MOCK_DATA.json",
					success: function(json) {
						// 연결이 성공했음을 알려주는 구문
						alert('Json 연결 성공.!!! ---> ' + json.length)
						// ajax의 for-each 기능을 가진 each 함수를 이용해서 처음부터 끝까지 한줄한줄 반복함
						// index는 증가하는 부분, userInfo는 그 한줄 안에 있는 데이터를 가져올 DTO와 같은 역할을 해줌
						$(json).each(function(index, userInfo) {
							// 각각의 데이터를 변수로 저장
							userid = userInfo.USERID
							upw = userInfo.UPW
							uname = userInfo.UNAME
							uaddr = userInfo.UADDR
							utel = userInfo.UTEL
							uemail = userInfo.UEMAIL
							ubirth = userInfo.UBIRTH
							ugender = userInfo.UGENDER
							// 가져온 것을 확인하기 위해서 console 창에 출력
							console.log(userid, upw, uname, uaddr, utel, uemail, ubirth, ugender)
							$.ajax({
								// 위에 저장된 변수들을 DB에 넣기위해서 insertUserId 라는 가상의 주소를 mapping해줌
								url: "insertUserId",
								// 위의 변수를 각 DB에 넣어줌
								data:{
									userid : userid,
									upw : upw,
									uname : uname,
									uaddr : uaddr,
									utel : utel,
									uemail : uemail, 
									ubirth : ubirth,
									ugender : ugender
								},
								success: function(result) { // 성공했을때 성공했음을 알기위해 콘솔로 출력
									console.log(result)
								}
							})
						})
					}
				})
			})
			
		})//start($function)
	</script>
</head>
<body>
	<h2>JSON MOCK 데이터 등록</h2>
	<hr color="blue">
	<button id="btn2">MOCK 데이터 등록</button>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
	<hr color="red">
	<a href="MainPage.jsp"><button>메인페이지</button></a>
</body>
</html>