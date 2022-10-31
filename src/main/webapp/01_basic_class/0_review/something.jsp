<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "member.dao.*" %>   
<%
// 0. 한글처리
request.setCharacterEncoding("utf-8");


// 1. 이전 폼의 입력 값 얻어오기
String name = request.getParameter("realname");
String ename = request.getParameter("nickname");
String email = request.getParameter("myemail");
String age = request.getParameter("myage");
  

// 2. vo객체에 저장하기
MemberVO vo = new MemberVO();
   
   vo.setName(name);
   vo.setEname(ename);
   vo.setEmail(email);
   vo.setAge(Integer.parseInt(age));

// 3. db 입력
MemberDAO dao = MemberDAO.getInstance();
   dao.insert(vo);

// 4. 출력 알아서
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
성공적으로 입력되었는지 DB에서 확인합니다.
    <hr/>
    <!-- 1-2) 얻어온 입력값 출력 -->
    이름: <%= name %> <br/>
    별명: <%= ename %> <br/>
    이메일: <%= email %> <br/>
    나이: <%= age %> 

</body>
</html>