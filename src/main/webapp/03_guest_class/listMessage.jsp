<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.model.*,guest.service.*" %>   
<%@ page import="java.util.List" %>
 
<%
   String pageNum = request.getParameter("page");
   String prevBtn = request.getParameter("prevBtn");
   String nextBtn = request.getParameter("nextBtn");
   String sPage   = request.getParameter("startPage");
   // 전체 메세지 레코드 검색 
   ListMessageService service = ListMessageService.getInstance();
   List <Message> mList =  service.getMessageList(pageNum);
   
   // 페이지 계산
   if( pageNum == null ) pageNum = "1";
   if( sPage == null ) sPage = "1";
   
   int totalPageCount    = service.getTotalPage();
   int pages          = 5;
   int startPage       = Integer.parseInt(sPage);
   int endPage       = startPage + pages - 1 ;
   
   if( totalPageCount <= pages ){
      endPage = totalPageCount;
   }
   
   if( prevBtn != null ){
      startPage -= pages;
      if ( startPage < 1 ) startPage = 1 ;
      endPage = startPage + pages - 1 ;
   }else if( nextBtn != null ){
      startPage += pages;
      endPage = startPage + pages - 1 ;
      if ( endPage > totalPageCount )   endPage = totalPageCount;
      if ( startPage > endPage )      startPage -= pages;
   }
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 목록 </title>
</head>
<body>

   <% if( mList.isEmpty() ) { %>
      남겨진 메세지가 하나도~~없습니다. <br>
   <% } else { %>
   <table border="1">
   <% for(Message m : mList) { %>
      
      <tr>   
         <td> <%= m.getMessageId() %> </td> 
         <td> <%= m.getGuestName() %></td> 
         <td> <a href="deleteMessage.jsp?messageId=<%=m.getMessageId()%>">[삭제]</a> </td>   
      </tr>
      <tr>
         <td colspan='3'> 
         <textarea cols=35 rows=3 style="font-family: '돋움', '돋움체'; font-size: 10pt; font-style: normal; line-height: normal; color: #003399;background-color:#D4EBFF;border:1 solid #00009C;"><%= m.getMessage() %></textarea>
         </td>
      </tr>
   <% } %>
   </table>
   
   <% } // end if-else %>

   <a href="insertMessage.jsp">글쓰기</a>
   <hr/>
   <span><a href="listMessage.jsp?startPage=<%=startPage%>&prevBtn=on"><button class="prevBtn">이전</button></a></span>
   <% for(int i=startPage; i<=endPage; i++) { %>
      <a href="listMessage.jsp?page=<%=i%>&startPage=<%=startPage%>">[ <%= i %> ]</a>
   <% } %>
   <span><a href="listMessage.jsp?startPage=<%=startPage%>&nextBtn=on"><button class="nextBtn">다음</button></a></span>

</body>
</html>