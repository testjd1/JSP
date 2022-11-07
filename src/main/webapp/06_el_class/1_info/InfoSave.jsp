<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>


<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="info" class="info.InfoBean">
	<jsp:setProperty name="info" property="name" />
  <jsp:setProperty name="info" property="id" />
</jsp:useBean>

<!DOCTYPE html>
<HTML>
<HEAD><TITLE> 자료 출력 </TITLE></HEAD>
<BODY>
	<!--  JSP 기초 문법의 표현식 -->
	<%= info.getName() %>
	<!--  action 태그의 출력 문법 -->
	<jsp:getProperty property="name" name = "info"/>
	<!--  화면 출력할 때 변수를 활용 -->
	<hr/>
	<H2>  당신의 신상명세서 확인 </H2>
	이   름  : ${info.name}<br/>
	주민번호 :  ${info.id}<br/>
	성  별   : ${info.gender}<br/>  
	맞습니까????
</BODY>
</HTML>