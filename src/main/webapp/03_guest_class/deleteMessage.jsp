<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String mId = request.getParameter("messageId");	// 보통 파라미터 값 그대로 변수 선언 (messageId)



%>    
    
    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 삭제 </title>
</head>
<body>
	<%=mId %>번 메세지를 삭제하려면 암호를 입력하세요. <br/><br/>
	<form action="deleteConfirm.jsp" method="post">
	<input type = 'hidden' name ='messageId' value='<%=mId%>'/>
		암호 : <input type="password" name="password" />		<!-- 받은 파라미터 값 안보이게 함 -->
		<input type="submit" value="메세지 삭제"/>
	</form>
</body>
</html>