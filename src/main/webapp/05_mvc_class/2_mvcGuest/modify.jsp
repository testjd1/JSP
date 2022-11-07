<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board_ex.model.*,board_ex.service.*" %>

<%
	// 0. 넘겨받는 데이타의 한글 처리
	response.setCharacterEncoding("UTF-8");
	
	Integer result = (Integer)request.getAttribute("result"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글수정</title>
</head>
<body>
<% if( result == 0  ) { %>
		암호가 잘못 입력되었습니다.
	<% } else { %>
		수정이 성공되었습니다.
	<% } %>
<%  // 게시글 수정이 성공적으로 되었다면 그 해당 게시글을 보여주는 페이지로 이동하고
    // 그렇지 않다면, "암호가 잘못 입력되었습니다"를 출력
	
%>
<a href="GuestControl?cmd=list-page"> [ 목록보기 ] </a>
</body>
</html>