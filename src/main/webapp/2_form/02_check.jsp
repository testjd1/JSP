<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	// 1) 이전화면에서 사용자 입력 값 받아오기
	//    1개 : request.getParameter('');
	// 	  여러개 : request.getParameterValues('');

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String op = request.getParameter("occupation");
	String[] hobby = request.getParameterValues("hobby");
	String hobbyTxt = "";
	/*
	if(hobby!=null){
		for(int i=0; hobby!=null && i<hobby.length; i++){
			hobbyTxt += hobby[i] +", ";
		}
	}
	*/

	
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--   2) 얻어온 입력값 화면에 출력 -->
			<h2>폼의 입력값 넘겨받아 처리</h2>
	입력한 이름 :  <%= name %><br/>
	입력한 성별 : <%= gender %><br/>
	입력한 직업 : <%= op %><br/>
	<!--  1. if문 내방식 -->
	입력한 취미 : <% if(hobby == null) {%>
			<%= "취미가 없습니다."  %>
			<% }else{%>
	<% for( int i =0; i<hobby.length; i++){%>
		<%= hobby[i] + ", " %>
	<% }}%>
	
	<!--  2 if문 강사님 방식 
	입력한 취미 : <%= hobbyTxt%>
	-->
	
</body>
</html>