<%@page import="jeju.ReservationDB"%>
<%@page import="jeju.ReservationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
/* 예약창(ReservationSection.jsp)에서 입력한 모든 예약정보를 받아온다. */
String res_id = request.getParameter("res_id");
String res_name = request.getParameter("res_name");
String res_tel = request.getParameter("res_tel");
String res_date = request.getParameter("res_date");
String res_payment = request.getParameter("res_payment");
String res_room = request.getParameter("res_room");
int res_cost = Integer.parseInt(request.getParameter("res_cost"));

ReservationVO bag = new ReservationVO(); // VO생성

/* 위 에서 받아온 모든 값들을 VO에 저장 */
bag.setRes_id(res_id);
bag.setRes_name(res_name);
bag.setRes_tel(res_tel);
bag.setRes_date(res_date);
bag.setRes_payment(res_payment);
bag.setRes_room(res_room);
bag.setRes_cost(res_cost);

/* create를 통해 db에 있는 예약테이블에 담는다. */
ReservationDB db = new ReservationDB();
db.create(bag);// 보낼 데이터가 많기 때문에 가방에 담아서 보내줌
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- if문 통해서 결제방식에 따라 카드결제시 카드결제 페이지로 넘겨준다. -->
<%if(bag.getRes_payment().equals("card")){ %>
	<script type="text/javascript">        
		/* url을 통해 자바스크립트로 상품명과 상품가격에 대한 파라미터값 보냄 */
		/* location.href : 페이지이동메서드 */
		/* 카드결제서버로 이동 */
		/* 파라미터값으로 상품명과 상품가격을 보내준다 */
        location.href="Payment_card.jsp?room=<%=request.getParameter("res_room")%>&cost=<%=request.getParameter("res_cost")%>";
    </script>
	<%
		} else {/* 카드결제 제외 예약등록  */
	%>
	<script type="text/javascript">
		alert("예약이 완료되었습니다. 결제관련해서 따로 연락드립니다.")
		location.href="MainPage.jsp"
	</script>
	<%
		}
	%>
</body>
</html>