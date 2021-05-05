<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%
 // 로그인 세션
 	String id = (String)session.getAttribute("id");
	String res_room = request.getParameter("res_room");
	String res_cost = request.getParameter("res_cost");
    %>
    
<nav id="Content">
	<%/* 로그인 세션 체크를 통해 로그인이 안된 경우 로그인 페이지로 넘어가기 */
	if (session.getAttribute("id") == null) { //세션연결된 id가 없는 경우 null
	%>
			<a href="로그인세션.jsp">로그인하기</a>

			<%} else {%><!-- 로그인 세션이 유지된 경우 아래와 같이 결제 창 실행 -->
			
	<div id="Reservationleft">
		<p class = "a">예약자정보</p>
		<div id="leftbox">
		<!-- 예약정보를 다 작성하고 예약버튼을 눌러 정보를 예약테이블에 insert해주는 db처리 페이지로 넘겨준다 -->
		<form action="ReservationCreateDB.jsp" id = "reservationform"> 
			사용자 아이디<br> 
			<input name="res_id" value=<%=session.getAttribute("id")%> readonly="readonly"><br><!-- readonly : 수정 불가 읽기만 가능 -->
			예약자 이름<br> 
			<input name="res_name" required="required"><br><!-- required : 반드시 채워야함 -->
			예약자 전화번호<br> 
			<input name="res_tel" required="required"><br>
			예약일 <br> 
			<input type="date" name="res_date" required="required"><br>
			결제방식<br> 
			<input type="radio" name="res_payment" value="place" required="required">현장결제 
			<input type="radio" name="res_payment" value="card" required="required">카드결제<br> 
			<input type="radio" name="res_payment" value="transfer" required="required">계좌이체 
			<input type="radio" name="res_payment" value="phone" required="required">휴대폰결제<br>
	<div id="Reservationright">
		<p class = "a">숙소정보/가격정보</p><br>
		<div id="rightbox">
		<!-- 위에 자바소스 부분에서 상품이름 상품가격을 받아와서 화면에 보여준다. -->
		숙소이름<br>
				<input type ="hidden" name = "res_room" value =<%=res_room%>>
				<%=res_room%> 	
			<br>
		총 결제 금액(VAT포함)<br>
				<input type ="hidden" name ="res_cost" value =<%=res_cost%>>
				<%=res_cost%>원
			<ul>
				<li>
				해당 객실가는 세금, 봉사료가 포함된 금액입니다.
				</li>
				<li>
				결제완료 후 예약자 이름으로 바로 체크인 하시면됩니다.
				</li>
			</ul>
		</div>
	</div>
		</div>
	</div>
	<button type="submit" id = "b"><!-- 결제하기 버튼을 눌러주면 사용자 아이디, 예약자이름, 예약자번호,예약일, 결제방식, 숙소이름, 숙소가격을 reservationCreateDB.jsp로 보내준다 -->
	결제하기
	</button>
	</form>			
	<%} %>
</nav>
