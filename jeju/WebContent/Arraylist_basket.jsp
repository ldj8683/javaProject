<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 메인페이지 오른쪽 최근방문기록을 위해 방문기록을 ArrayList에 담아 세션으로 설정 -->
    <!-- 방문한 상품에 대한 값을 arraylist에 담기 -->
    <!-- 방문한곳 페이지 주소 받아오기 -->
    <!-- 상품페이지에서 예매버튼이 있는 상세한 상품페이지로 넘어갈 때 이 페이지(arraylist_basket.jsp)로 상품페이지의 주소와 상품이름을 파라미터로 보내준다 -->

    <%
    String productpage1 = request.getParameter("productpage"); //방문한 상품 상세페이지 주소를 갖고있음 ex) A호텔에 대한 페이지주소
    String productNum = request.getParameter("productNum"); //방문한 상품 상세페이지 주소를 갖고있음 ex) A호텔에 대한 페이지주소
	String real_productpage = "ProductDetail.jsp?productNum="+productNum; //상품넘버를 통해 상품페이지 생성
	session.setAttribute("productsession", real_productpage); //productsession : 상품페이지 주소(세션) => 상품이름으로 변경할 예정, 주소는 하이퍼링크로 달 예정
	
    /* 조건문을 통해 상품의 상세페에지를 담을 ArrayList가 비어있는 경우 배열리스트를 생성해서 값을 담는다. */
    if(session.getAttribute("productlist")==null){ //
    	ArrayList<String> productlist = new ArrayList<>(); 
    	productlist.add((String)session.getAttribute("productsession"));
    	session.setAttribute("productlist", productlist); //productlist : 배열리스트로 상품페이지 주소가 들어있음 

    	
    }else{/* 상품의 상세페이지를 담는 배열리스트에 값이 들어 있는 경우 덧붙혀 사용한다. */
    	ArrayList<String> productlist1 = (ArrayList)session.getAttribute("productlist");
    	productlist1.add((String)session.getAttribute("productsession"));
    	session.setAttribute("productlist", productlist1); //productlist : 배열리스트로 상품페이지 주소가 들어있음 
    } 
    System.out.println(session.getAttribute("productlist")); 
    response.sendRedirect(real_productpage+"&productNum="+productNum); //현재 방문하기 위해 눌렀던 상품페이지로 다시 돌아감
    %>
    