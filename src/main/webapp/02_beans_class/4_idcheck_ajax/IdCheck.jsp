<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="member.beans.MemberDao" %>        
<%
   String userId = request.getParameter("id");
   MemberDao dao = MemberDao.getInstance();
   boolean result = dao.isDuplicatedId(userId);
   out.print(result);
%>  