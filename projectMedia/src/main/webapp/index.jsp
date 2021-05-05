<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginId = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html style="margin: 0px">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="resources/css/style.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- <style>
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
		</style> -->
		<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
			function notLogin() {
				alert("로그인 되지 않았습니다. 로그인을 해주세요!")
			}
			$(function() {
				$('#btn1').click(function() {
					$.ajax({
						url: "userAgeInformation",
						success: function(json) {
							cAge0 = 0;
							cAge10 = 0;
							cAge20 = 0;
							cAge30 = 0;
							cAge40 = 0;
							cAge50 = 0;
							cAge60 = 0;
							for(var i = 0; i < json.length; i++){
								birth = json[i].ubirth		// 형식이  월/일/년 인 생년월일 데이터를 birth에 저장
								birthSplit = birth.split("/")[2] // birth에  저장된 데이터를 나이를 계산하기 위해서 split 함수를 이용해서 분리후 맨마지막 2째 인덱스를 가져옴
								if(birthSplit > 2011){
									console.log("0~9세")
									cAge0 = cAge0 + 1
								} else if(birthSplit > 2001){
									console.log("10~19세")
									cAge10 = cAge10 + 1
								} else if(birthSplit > 1991){
									console.log("20~29세")
									cAge20 = cAge20 + 1
								} else if(birthSplit > 1981){
									console.log("30~39세")
									cAge30 = cAge30 + 1
								} else if(birthSplit > 1971){
									console.log("40~49세")
									cAge40 = cAge40 + 1
								} else if(birthSplit > 1961){
									console.log("50~59세")
									cAge50 = cAge50 + 1
								} else {
									console.log("60세 이상")
									cAge60 = cAge60 + 1
								}
							}
							
							google.charts.load("current", {packages:["corechart"]});
							google.charts.setOnLoadCallback(drawChart);
							function drawChart() {
								var data = google.visualization.arrayToDataTable([
									['UserAge', 'Population'],
									['10세 이하', cAge0],
									['10대', cAge10],
									['20대', cAge20],
									['30대', cAge30],
									['40대', cAge40],
									['50대', cAge50],
									['60세 이상', cAge60]
								]);
								var options = {
									legend: 'none',
									pieSliceText: 'label',
									title: '가입자의 연령대',
									pieStartAngle: 100,
								};
								
								var chart = new google.visualization.PieChart(document.getElementById('chartResult'));
								chart.draw(data, options);
								}
							},
							error: function() {
								alert("userAgeInfo 연결 실패")
							}
						})
					})
				
					$('#btn2').click(function() {
					$.ajax({
						url: "userAgeInformation",
						success: function(json) {
							mAge0 = 0;
							fAge0 = 0;
							mAge10 = 0;
							fAge10 = 0;
							mAge20 = 0;
							fAge20 = 0;
							mAge30 = 0;
							fAge30 = 0;
							mAge40 = 0;
							fAge40 = 0;
							mAge50 = 0;
							fAge50 = 0;
							mAge60 = 0;
							fAge60 = 0;
							mAgeAll = 0;
							fAgeAll = 0;
							
							for(var i = 0; i < json.length; i++){
								birth = json[i].ubirth		// 형식이  월/일/년 인 생년월일 데이터를 birth에 저장
								birthSplit = birth.split("/")[2] // birth에  저장된 데이터를 나이를 계산하기 위해서 split 함수를 이용해서 분리후 맨마지막 2째 인덱스를 가져옴
								gender = json[i].ugender
								if(gender == "Male" || gender == "male"){
									if(birthSplit > 2011){
										console.log("0~9세 남자")
										mAge0 = mAge0 +1
									} else if(birthSplit > 2001) {
										console.log("10~19세 남자")
										mAge10 = mAge10 +1
									} else if(birthSplit > 1991) {
										console.log("20~29세 남자")
										mAge20 = mAge20 +1
									} else if(birthSplit > 1981) {
										console.log("30~39세 남자")
										mAge30 = mAge30 +1
									} else if(birthSplit > 1971){
										console.log("40~49세 남자")
										mAge40 = mAge40 +1
									} else if(birthSplit > 1961){
										console.log("50~59세 남자")
										mAge50 = mAge50 +1
									} else {
										console.log("60세 이상 남자")
										mAge60 = mAge60 +1
									}
								}else{
									if(birthSplit > 2011){
										console.log("0~9세 여자")
										fAge0 = fAge0 + 1
									} else if(birthSplit > 2001) {
										console.log("10~19세 여자")
										fAge10 = fAge10 + 1
									} else if(birthSplit > 1991) {
										console.log("20~29세 여자")
										fAge20 = fAge20 + 1
									} else if(birthSplit > 1981) {
										console.log("30~39세 여자")
										fAge30 = fAge30 + 1
									} else if(birthSplit > 1971){
										console.log("40~49세 여자")
										fAge40 = fAge40 + 1
									} else if(birthSplit > 1961){
										console.log("50~59세 여자")
										fAge50 = fAge50 + 1
									} else {
										console.log("60세 이상 여자")
										fAge60 = fAge60 + 1
									}
								}
							}
							
						    google.charts.load("current", {packages:["corechart"]});
						    google.charts.setOnLoadCallback(drawChart);
						    function drawChart() {
						    	var data = google.visualization.arrayToDataTable([
						            ['Age', 'Male', 'Female', { role: 'annotation' }],
						            ['10세 이하', mAge0, fAge0, ''],
						            ['10대', mAge10, fAge10, ''],
						            ['20대', mAge20, fAge20, ''],
						            ['30대', mAge30, fAge30, ''],
						            ['40대', mAge40, fAge40, ''],
						            ['50대', mAge50, fAge50, ''],
						            ['60세 이상', mAge60, fAge60, '']
						        ]);
	
						        var options = {
						        	width: 900,
						            height: 500,
						            legend: { position: 'top', maxLines: 3 },
						            bar: { groupWidth: '75%' },
						            isStacked: true
						        };
						          
						      	var chart = new google.visualization.BarChart(document.getElementById("chartResult"));
						      	chart.draw(data, options);
						  	}
						},
						error: function() {
							alert("userAgeInfo 연결 실패")
						}
					})
				})
				
			})//start($function)
		</script>
	</head>
	<body id="body">
		<nav id="top">
			<div id="mainLogo">
				<a href="MainPage.jsp">
					로고
				</a>
			</div>
			<div>
				<form action="">
					<input type="text" name="search">
					<input type="submit" value="검색">
				</form>
			</div>
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
			<button class="accordion">로그인</button>
			<div class="panel">
				<!-- <div class="leftMenuTitle">
					로그인
				</div> -->
				
				<div id="loginFaded" class="leftMenuContent">
					<a href="UserLogin.jsp">
						로그인
					</a>
				</div>
				<% if(session.getAttribute("userId") == null) {%>
					<div class="leftMenuContent">
						<a href="javascript:notLogin();">
							회원정보
						</a>
					</div>
				<%} else {%>
					
					<div class="leftMenuContent">
						<a href="UserInformation2">
							회원정보
						</a>
					</div>
				<%} %>
				<div class="leftMenuContent">
					<a href="UserLogout.jsp">
						로그아웃
					</a>
				</div>
			</div>
			<hr color="white">
			<button class="accordion">미디어</button>
			<div class="panel">
				<!-- <div class="leftMenuTitle">미디어</div> -->
				<div class="leftMenuContent">
					미디어 메뉴1
				</div>
				<div class="leftMenuContent">
					Video Gallery
				</div>
				<% if(session.getAttribute("userId") == null) {%>
					<div class="leftMenuContent">
						<a href="javascript:notLogin();">
							최근 본 동영상
						</a>
					</div>
				<%} else {%>
					<div class="leftMenuContent">
						<a href="VideoTest">
							최근 본 동영상
						</a>
					</div>
				<%} %>
			</div>
			<hr color="white">
			<button class="accordion">쇼핑몰</button>
			<div class="panel">
				<!-- <div class="leftMenuTitle">쇼핑몰</div> -->
				<div class="leftMenuContent">
					쇼핑몰 메뉴1
				</div>
				<div class="leftMenuContent">
					쇼핑몰 메뉴2
				</div>
			</div>
			<hr color="white">
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
		<div id="content">
			<h2>JSON data 확인</h2>
			<hr color="black">
			<button id="btn1">연령대별 가입자 현황</button>
			<button id="btn2">연령대별 남/여 가입자 현황</button>
			<br>
			<div id="chartResult" style="width: 900px; height: 500px;"></div>
			<hr color="black">
		</div>
	</body>
</html>