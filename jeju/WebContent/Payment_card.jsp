<%@page import="com.sun.xml.internal.ws.api.ha.StickyFeature"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- 상품명 + 가격받아오기 -->    
    <%
    String room = request.getParameter("room");
	String cost = request.getParameter("cost");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- https://www.iamport.kr/getstarted 에서 참조하기 -->
<!-- Line16~17 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
/* getParameterByName함수란?
	html파일에서 url을 통해 파라미터값을 보내고 javascript에서 값을 받기 위해 사용한 함수
*/
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
</script>
<script type="text/javascript">
room_name = getParameterByName('room');
cost = getParameterByName('cost');
</script>
<script type="text/javascript">
var IMP = window.IMP; // 생략가능
IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

/* 주문명, 가격, 주문자 이름, 전화번호 등 받아오기  */

		/* 버튼을 눌렀을 떄  결제가 가능하도록 설정하기 위해 pay()라는 함수 생성*/
  		function pay() {
		IMP.request_pay({   /* IMP.requests_pay : 결제요청함수 Line26~51  */
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : room_name, //상품명
			amount : cost,//상품가격
			buyer_email : 'iamport@siot.do',
			buyer_name : '구매자이름',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, 
		function(rsp) {
			if (rsp.success) { /* 결제성공시 */
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				location.href="MainPage.jsp"; //결제 성공시 메인화면으로 넘어가기
			} else { /* 결제실패시 */
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				location.href="ReservationPage.jsp"; //결제 실패시 다시 결제화면으로 넘어가기
			}
			alert(msg);
		});
	}
</script>

</head>
<body>
<script type="text/javascript"> /* 위에 설정해둔 결제함수 사용을 위한 스크립트문안에 함수호출 */
pay();
</script>

</body>
</html>