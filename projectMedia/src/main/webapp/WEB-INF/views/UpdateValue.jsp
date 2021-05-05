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
		<link rel="stylesheet" type="text/css" href="resources/css/main/register.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		
		<script type="text/javascript">
			function notLogin() {
				alert("로그인 되지 않았습니다. 로그인을 해주세요!")
			}
			function checkPw() {
				upw = document.getElementById('upw')
				upw2 = document.getElementById('upw2')
				
				if( upw.value.length < 6 || upw.value.length > 20 ){
					alert('비밀번호는 6글자 이상, 20글자 이하만 입력하세요')
					upw.value='';
				}
				if(upw.value == upw2.value){
					document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
					document.getElementById('check').style.color='blue'
				} else {
					document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.'
					document.getElementById('check').style.color='red'
				}
			}
			
			$( function() {
			    $( "#ubirth" ).datepicker();
			});
			
			function execPostCode() {
		         new daum.Postcode({
		             oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		 
		                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
		 
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		                if(fullRoadAddr !== ''){
		                    fullRoadAddr += extraRoadAddr;
		                }
		 
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
//		                console.log(data.zonecode);
		                console.log(fullRoadAddr);
		                
		                
//		                $("[name=addr1]").val(data.zonecode);
		                $("[name=uaddrRoad]").val(fullRoadAddr);
		                
		                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
		                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
		            }
		         }).open();
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
			<div id = "inputForm">
				<h2>회원 정보를 수정하세요</h2>
				<hr color="black">
				<form action="update">
					<!-- 수정을 할때 다른 정보는 바뀌어도 아이디, 이름을 바꾸는 경우가 없기 때문에 아이디와 이름에 해당하는 입력란은 readonly를 해주었습니다. -->
					<label for="userid">아이디</label><br>
					<input value="${vo2.userid}" type="text" id="userid" name="userid" readonly="readonly"><br>
					
					<label for="upw">패스워드</label><br>
					<input placeholder="패스워드" type="password" id="upw" name="upw" onchange="checkPw()"><br>
					
					<label for="upw2">패스워드 확인</label><br>
					<input placeholder="패스워드 확인" type="password" id="upw2" name="upw2" onchange="checkPw()"><br>
					<p id="check"></p>
					
					<label for="uname">이름</label><br>
					<input value="${vo2.uname}" type="text" id="uname" name="uname" readonly="readonly"><br>
					
					주소 <button type="button" class="btn btn-default" onclick="execPostCode();">우편번호 찾기</button><br>
					<!-- <input type="text" id="uaddr" name="uaddr" placeholder="Enter Addr" required="required" readonly="readonly"><br> -->
					<input style="top: 5px;" value="${vo2.uaddrRoad}" name="uaddrRoad" id="uaddrRoad" type="text" readonly="readonly" />
					<input value="${vo2.uaddrDetail}" name="uaddrDetail" id="uaddrDetail" type="text"  />
					
					
					<label for="utel">전화번호</label><br>
					<input value="${vo2.utel}" type="text" id="utel" name="utel"><br>
					
					<!-- <label for="ugender">성별</label><br> -->
					<!-- <input type="text" id="ugender" name="ugender"><br><br> -->
					성별
					<select id="ugender" name="ugender">
						<option value="male">남자</option>
						<option value="female">여자</option>
					</select><br>
					
					<label for="uemail">이메일</label><br>
					<input value="${vo2.uemail}" type="text" id="uemail" name="uemail"><br>
					
					<label for="ubirth">생년월일</label><br>
					<input value="${vo2.ubirth}" type="text" id="ubirth" name="ubirth"><br><br>
					
					<input type="submit" value="등록하기">
				</form>
				<hr color="black">
			</div>
		</div>
	</body>
</html>