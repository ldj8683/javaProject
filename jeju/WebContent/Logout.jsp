<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 설정된 여러 세션 값들 중 하나만 제거하는 경우
		//session.removeAttribute("id");
	// 세션 자체를 끊어버리는 경우
		session.invalidate();
	
	// 서버가 브라우저에 무엇인가를 명령할 때 사용하는 내장된
	// 1) 쿠키 심을때, 2)특정 페이지를 요청하라고 할때
	response.sendRedirect("MainPage.jsp");
%>
