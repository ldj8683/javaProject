<%@page import="jeju.ShoppingBagDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /* MyPageContentBasket.jsp에서 삭제를 위해 필요한 아이디와 상품관련페이지를 받아온다*/
    String id = request.getParameter("id");
    String product = request.getParameter("product");
    
    /* db를 생성하여 삭제기능 */
    ShoppingBagDB db = new ShoppingBagDB();
	db.delete(id, product);
	
	/* 삭제 후 삭제버튼을 눌렀던 페이지인 장바구니페이지로 다시 돌아간다 */
    response.sendRedirect("MyPageContentBasket.jsp");
    %>
