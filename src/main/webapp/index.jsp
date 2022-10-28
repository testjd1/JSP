<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%!String msg; %>   
 <%
 	msg = "gd\n"
 	+ "asd ";
 %>
 
 <!-- html 주석 -->
 <%-- jsp주석 --%>
 <% // 자바 주석 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
메세지 : <%= msg  %>
</body>
</html>