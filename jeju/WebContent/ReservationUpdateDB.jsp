<%@page import="jeju.ReservationVO"%>
<%@page import="jeju.ReservationDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /* 예약정보 수정하기 */
    /* 예약자이름 및 전화번호 수정하기 */
    /* 변경사항 작성하는 페이지(reservationUpdate.jsp)에서 무엇을 변경할지 결정하기 위해 예약번호(res_num)과 변경을 하고자 하는 것 (res_name, res_tel)을 받아온다 */
    String res_num1 = request.getParameter("upd1"); //입력은 문자열
    int res_num = Integer.parseInt(res_num1); //정수값으로 변경
    String res_name = request.getParameter("upd_name");
    String res_tel = request.getParameter("upd_tel");
	
    ReservationDB db = new ReservationDB();
    ReservationVO bag = new ReservationVO();
    bag.setRes_num(res_num);
    bag.setRes_name(res_name);
    bag.setRes_tel(res_tel);
    db.update(bag);
    
    response.sendRedirect("MyPageContentInquiry.jsp"); //예약조회페이지로 넘어감
    %>
    