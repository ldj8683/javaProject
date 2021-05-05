<%@page import="jeju.ReservationDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //delete : 예약번호를 통해 그에 해당하는 예약지울것
    //입력받아온 값은 문자열이기 때문에 정수형으로 변경해야함
    
    String res_num1 = request.getParameter("del");
    int res_num = Integer.parseInt(res_num1); //정수형으로 변환
    System.out.println(res_num);
    ReservationDB db = new ReservationDB();
	db.delete(res_num);
	
	response.sendRedirect("MyPageContentInquiry.jsp"); //delete를 수행하고 예약조회 페이지를 다시보여주기 위해 사용
    %>
