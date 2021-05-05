<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginId = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<!-- <html style="margin: 0px"> -->
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인페이지</title>
		<link rel="stylesheet" type="text/css" href="resources/css/style.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<style>
			/* 메뉴가 접히고 펼쳐지는 부분에 대한 css 설정 */
			.accordion {
				background-color: black;
				color: white;
				cursor: pointer;	/* 메뉴위로 마우스를 가져다 댈 경우 커서의 모양을 손가락 모양으로 바꿔줌 */
				padding: 5px 0px 5px 10px;
				width: 100%;
				border: none;		/* 버튼의 경계선을 없애줌 */
				text-align: left;	/* 왼쪽 정렬 */
				outline: none;		/* 아웃 라인을 없에줌 */
				font-size: 20px;
				transition: 0.4s;	/* 트렌지션을 완수하는데  걸리는 시간으로, 여기서는 펼쳐지는 시간을 의미함 */
			}
			.panel {
				color: white;
				font-size: 15px;
				text-align: right;
				display: none;		/* 해당 클래스의 요소들을 랜더링 하지 않도록 해줌 */
				background-color: black;
				overflow: hidden;	/* 넘쳐지는 부분이 잘려서 보이지 않도록 설정을 해줌 */
			}
			#loginSession{
				color: white;
				background: #666666;
				font-size: 20px;
				font-family: bold;
			}
		</style>
		<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
			function notLogin() {	/* 로그인이 되지 않았을 때 로그인이 필요한 페이지를 눌렀을 경우 로그인이 안됬다고 알려줌 */
				alert("로그인 되지 않았습니다. 로그인을 해주세요!")
			}
			$(function() {
				$('#btn1').click(function() {	// btn1이라는 id를 가진 버튼을 누를 경우 동작
					$.ajax({
						url: "userAgeInformation",	// DB에 있는 데이터를 가져오기 위해서 가상의 주소를 Controller로 Mapping
						success: function(json) {	// DB에서 데이터를 가져왔을경우 가져온 json 형식의 데이터를 'json'이라는 변수에 넣음
							// 연령대 별 인원수를 알기위해서 count로 쓸 변수를 선언
							cAge0 = 0;
							cAge10 = 0;
							cAge20 = 0;
							cAge30 = 0;
							cAge40 = 0;
							cAge50 = 0;
							cAge60 = 0;
							for(var i = 0; i < json.length; i++){	// 가져온 json의 크기만큼을 반복
								birth = json[i].ubirth		// 형식이  월/일/년 인 생년월일 데이터를 birth에 저장
								birthSplit = birth.split("/")[2] // birth에  저장된 데이터를 나이를 계산하기 위해서 split 함수를 이용해서 분리후 맨마지막 2째 인덱스를 가져옴
								if(birthSplit > 2011){	// 21년이기때문에 10살을 기준으로 나누기위해서는 2011, 2001, ... 10씩을 구분을 해줌
									console.log("0~9세")	// 제대로 되었는지 확인을 하기위해서 브라우저의 콘솔창에 출력을 해줌
									cAge0 = cAge0 + 1	// birthSplit 값이 2021~2012년도 사이의 값일 경우 1씩 증가 
								} else if(birthSplit > 2001){	// birthSplit 값이 2011~202 사이의 값일 경우 1씩 증가하는 구문
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
							
							// 가상화 API와 차트 패키지를 로드
							google.charts.load("current", {packages:["corechart"]});
							// 구글 가상화 API를 로드하기 위한 콜백 설정
							google.charts.setOnLoadCallback(drawChart);
							// 위와 마찬가지로, API와 테이블 패키지를 로드하고, 콜백을 설정
							google.charts.load('current', {'packages':['table']});
							google.charts.setOnLoadCallback(drawTable);
							
							// 데이터 테이블을 만들고 채우는 콜백, 파이 차트에 데이터를 넣고 차트를 그리는 함수
							function drawChart() {
								// 데이터 테이블로 위에서 10살을 기준으로 횟수를 증가시켜서 저장해 놓은 데이터들을 넣어줌
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
								// 차트의 옵션에 대한 설정
								var options = {
									// 너비와 높이 설정(기본 단위 px)
									width: 650,
							        height: 500,
							        
									pieSliceText: 'label',	// 해당 지역에 마우스를 올리면 나오는 정보형식
									title: '가입자의 연령대',	// 어떠한 것인지를 나타내주는 제목 설정
									fontSize: 20,		// 안의 font-size 설정
									pieStartAngle: 0,	// 파이차트의 데이터가 시작하는 각도를 설정
									// 차트의 크기를 설정
									chartArea:{left: 50, top: 50, width: 620, height: 620}
								};
								
								// 옵션을 전달해서 차트를 인스턴스화해서 그림을 그려줌
								// document.getElementById('chartResult') 그릴 위치를 지정해줌
								var chart = new google.visualization.PieChart(document.getElementById('chartResult'));
								chart.draw(data, options);
							};
							
							// 데이터 테이블을 만들고 채우는 콜백, 테이블에 데이터를 넣고 차트를 그리는 함수
							function drawTable() {
								// 데이터 테이블로 위에서 10살을 기준으로 횟수를 증가시켜서 저장해 놓은 데이터들을 넣어줌
								var data2 = new google.visualization.DataTable();
								// 데이터를 이용하기위해서 컬럼들을 추가해줌(데이터 형식, 컬럼명)의 형식으로 만들어 줌
								data2.addColumn('number', '번호');
								data2.addColumn('string', '연령대');
						        data2.addColumn('number', '인원수');
						        // 컬럼을 만들고 각 컬럼에 데이터를 넣기 위해서 레코드를 하나씩 채워줌
						        // v는 값이고, f는 출력 형식을 나타냄
						        data2.addRows([
						        	[1, '10세 이하',  {v: cAge0, f: cAge0 +' 명'}],
						            [2, '10대',  {v: cAge10, f: cAge10 + ' 명'}],
						            [3, '20대',  {v: cAge20, f: cAge20 + ' 명'}],
						            [4, '30대',  {v: cAge30, f: cAge30 + ' 명'}],
						            [5, '40대',  {v: cAge40, f: cAge40 + ' 명'}],
						            [6, '50대',  {v: cAge50, f: cAge50 + ' 명'}],
						            [7, '60세 이상',  {v: cAge60, f: cAge60 + ' 명'}]
								]);
						        // 테이블의 옵션을 설정
						        var option = {
						        	allowHtml: true,	// Html의 Style을 사용할수 있도록 설정
						        	width: '100%',	// 너비설정
						        	height: 400		// 높이 설정(기본단위는 px)
						        }
						        
						     	// 옵션을 전달해서 차트를 인스턴스화해서 그림을 그려줌
								// document.getElementById('tableResult') 그릴 위치를 지정해줌
						        var table = new google.visualization.Table(document.getElementById('tableResult'));
						        table.draw(data2, option);
							};
						},
						// DB에 연결이 실패했을경우 실패헀다는 것을 알려주기 위해서 alert를 띄워줌
						error: function() {
								alert("userAgeInfo 연결 실패")
						}
					})
				})
				
				$('#btn2').click(function() {	// btn2의 아이디를 가진 버튼을 눌렀을 경우 작동
					$.ajax({
						url: "userAgeInformation",	// 위에 btn1의 Json 데이터를 그대로 이용하기 때문에 같은 가상주소를 사용
						success: function(json) {	// 데이터를 가져와서 json에 저장
							// 각 연령대 별의 남녀 를 분리했기 때문에 각 연령대별로 남녀 카운트를 해줄 변수를 선언
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
							// 최종인원수를 확인해보기 위해서 선언을 해줌
							mAgeAll = 0;
							fAgeAll = 0;
							
							for(var i = 0; i < json.length; i++){
								birth = json[i].ubirth		// 형식이  월/일/년 인 생년월일 데이터를 birth에 저장
								birthSplit = birth.split("/")[2] // birth에  저장된 데이터를 나이를 계산하기 위해서 split 함수를 이용해서 분리후 맨마지막 2째 인덱스를 가져옴
								gender = json[i].ugender	// 성별 데이터를 가져와서 남,녀를 구분해줌
								if(gender == "Male" || gender == "male"){	// 남자일 경우 안의 구문을 수행
									// 위에 설정한 연령대별로 나눈 것과 같은 방식으로 남,녀의 숫자를 저장
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
								}else{	// 여자일 경우 아래 구문을 실행
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
							
							// 가상화 API와 차트 패키지를 로드, 콜백 설정
						    google.charts.load("current", {packages:["corechart"]});
						    google.charts.setOnLoadCallback(drawChart);
						    
						 	// 가상화 API와 테이블 패키지를 로드, 콜백 설정
						    google.charts.load('current', {'packages':['table']});
							google.charts.setOnLoadCallback(drawTable);
							
							// 바 차트를 그려주는 함수
						    function drawChart() {
								// 위에서 얻은 데이터를  넣어줌
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
								
								// 옵션을 설정
						        var options = {
									// 너비와 높이 설정
						        	width: 650,
						            height: 500,
						            // 범례를 설정, position은 차트위에 설정, maxLines는 범례에 최대 줄수설정
						            legend: { position: 'top', maxLines: 3 },
						            // 막대 그룹의 너비
						            bar: { groupWidth: '75%' },
						            fontSize: 20,
						            isStacked: true	// 모든 데이터들을 쌓아줌
						        };
						        
						     	// 옵션을 전달해서 차트를 인스턴스화해서 그림을 그려줌
								// document.getElementById('chartResult') 그릴 위치를 지정해줌
						      	var chart = new google.visualization.BarChart(document.getElementById("chartResult"));
						      	chart.draw(data, options);
						  	};
						  	
						  	// 위의 테이블 과 똑같지만 여기서는 남녀 구분을 했기 때문에 컬럼하나를 더 추가해줌
						  	function drawTable() {
								var data2 = new google.visualization.DataTable();
								data2.addColumn('number', '번호');
								data2.addColumn('string', '연령대');
						        data2.addColumn('number', '남자');
						        data2.addColumn('number', '여자');
						        data2.addRows([
						        	[1, '10세 이하',  {v: mAge0, f: mAge0 +' 명'},  {v: fAge0, f: fAge0 +' 명'}],
						            [2, '10대',  {v: mAge10, f: mAge10 + ' 명'},  {v: fAge10, f: fAge10 +' 명'}],
						            [3, '20대',  {v: mAge20, f: mAge20 + ' 명'},  {v: fAge20, f: fAge20 +' 명'}],
						            [4, '30대',  {v: mAge30, f: mAge30 + ' 명'},  {v: fAge30, f: fAge30 +' 명'}],
						            [5, '40대',  {v: mAge40, f: mAge40 + ' 명'},  {v: fAge40, f: fAge40 +' 명'}],
						            [6, '50대',  {v: mAge50, f: mAge50 + ' 명'},  {v: fAge50, f: fAge50 +' 명'}],
						            [7, '60세 이상',  {v: mAge60, f: mAge60 + ' 명'},  {v: fAge60, f: fAge60 + ' 명'}]
								]);
						        var table = new google.visualization.Table(document.getElementById('tableResult'));
						        table.draw(data2, {width: '100%', height: 400});
							};
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
				/* acoordion 이라는 클래스이름을 가진 클래스 속성을 사용해서 컬렉션 객체 반환 */
			    var acc = document.getElementsByClassName("accordion");
			    var i;
				
			    /* accordion이라는 클래스의 수만큼 반복
			    	여기서는 로그인, 미디어, 쇼핑몰로 acc.length는 3*/
			    for (i = 0; i < acc.length; i++) {
			    	/* 로그인, 미디어, 쇼핑몰 버튼을 클릭을 누를 경우 함수 작동 */
			      	acc[i].addEventListener("click", function() {/* 버튼을 누르면 fucntion이 동작 */
				        this.classList.toggle("active");		/* 클릭을 했을 경우 동작을 함 */
				        var panel = this.nextElementSibling;
				        if (panel.style.display === "block") { 	/* 펼쳐져 있을때 다시 누르면 접혀지게 하는 구문 */
				        	panel.style.display = "none";
			        	} else {
			          		panel.style.display = "block";		/* 접혀져 있을 경우 펼쳐지게 하는 구문 */
			        	}
			      	});
			    }
		    </script>
			<br>			
		</nav>
		<div id="content">
			<h2>가입자 현황</h2>
			<hr color="black">
			<button id="btn1" style="width: 200px; height: 30px; background-color: white; font-size: 15px; font-family: bold; border-radius: 5px;">
				연령대별 가입자 현황
			</button>
			<button id="btn2" style="width: 220px; height: 30px; background-color: white; font-size: 15px; font-family: bold; border-radius: 5px;">
				연령대별 남/여 가입자 현황
			</button>
			<br><br>
			<div id="chartResult" style="float:left;"></div>
			<div id="tableResult" style="text-align:right; font-size: 30; font-weight: bold; height: 500px; float:left; width:250px; margin-top: 50px;"></div>
		</div>
	</body>
</html>