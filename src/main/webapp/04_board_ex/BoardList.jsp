<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="board_ex.model.*, board_ex.service.*" %>
<%@ page import="java.util.List" %>

<%  //웹브라우저가 게시글 목록을 캐싱할 경우 새로운 글이 추가되더라도 새글이 목록에 안 보일 수 있기 때문에 설정
	// 목록보기부분은 항상 어떤 브라우저로 들어올지 모르므로 추가하기
	response.setHeader("Pragma","No-cache");		// HTTP 1.0 version
	response.setHeader("Cache-Control","no-cache");	// HTTP 1.1 version
	response.setHeader("Cache-Control","no-store"); // 일부 파이어폭스 버스 관련
	response.setDateHeader("Expires", 1L);			// 현재 시간 이전으로 만료일을 지정함으로써 응답결과가 캐쉬되지 않도록 설정
%>

<%
String pageNum = request.getParameter("page");
String prevBtn = request.getParameter("prevBtn");
String nextBtn = request.getParameter("nextBtn");
String sPage   = request.getParameter("startPage");
// 전체 메세지 레코드 검색 

ListArticleService service = ListArticleService.getInstance();
List <BoardVO> mList =  service.getArticleList(pageNum);
//페이지 계산
if( pageNum == null ) pageNum = "1";
if( sPage == null ) sPage = "1";

int totalPageCount    = service.getTotalPage();
int pages          = 5;
int startPage       = Integer.parseInt(sPage);
int endPage       = startPage + pages - 1 ;
int k =startPage + pages;

if(k>totalPageCount){
	endPage =startPage + pages - 1 ;
	
}
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

<HTML>
<head><title> 게시글 목록 </title>
</head>

<BODY>

	<h3> 게시판 목록 </h3>
	
	<table border="1" bordercolor="darkblue">
	<tr>
		<td> 글번호 </td>
		<td> 제 목 </td>
		<td> 작성자 </td>
		<td> 작성일 </td>
		<td> 조회수 </td>
		<td> 삭제칸 </td>
	</tr>
	
	<% if( mList.isEmpty() ) { %>
		<tr><td colspan="5"> 등록된 게시물이 없습니다. </td></tr>
	<% } else { %>
	<!--  여기에 목록 출력하기  -->
	<%for(BoardVO vo : mList){ %>
	
		<tr>
			<td><%= vo.getSeq() %></td>	
			<td><a href="BoardView.jsp?seq=<%=vo.getSeq()%>"><%= vo.getTitle() %></a></td>
			<td><%= vo.getWriter() %></td>
			<td><%= vo.getRegdate() %></td>
			<td><%= vo.getCnt() %></td>
			<td><a href="BoardDeleteForm.jsp?seq=<%=vo.getSeq()%>">[삭제]</a></td>
		</tr>

		<%} //end of for%>
	<% }  %>
		<tr>
			<td colspan="6">
				<a href="BoardInputForm.jsp">글쓰기</a>
			</td>
		</tr>
	</table>
	<hr/>
	
	<span><a href="BoardList.jsp?startPage=<%=startPage%>&prevBtn=on"><button class="prevBtn">이전</button></a></span>
	
   <% for(int i=startPage; i<=endPage; i++) { %>
      <a href="BoardList.jsp?page=<%=i%>&startPage=<%=startPage%>">[ <%= i %> ]</a>
   <% } %>
   <span><a href="BoardList.jsp?startPage=<%=startPage%>&nextBtn=on"><button class="nextBtn">다음</button></a></span>
	
	
</BODY>
</HTML>
