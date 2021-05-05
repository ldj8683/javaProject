<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String video_category = request.getParameter("video_category");
	String nowPage = request.getParameter("nowPage");
	String cntPerPage = request.getParameter("cntPerPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VideoMain</title>
</head>
<body>
	<jsp:forward page="Videopaging"></jsp:forward>
</body>
</html>