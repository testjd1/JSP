<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#submitBtn').click(function(){
		// 유효성 검사 [ 버튼 눌렀을 때 빈칸이면 알림 뜸 ]
		if($("input[name=guestName]").val() == ""){
		    alert(" 이름을 입력하세요");
		    $("input[name=guestName]").focus();
		    return false;
		}
		 
		if($("input[name=password]").val() == ""){
		    alert("암호를 입력하세요");
		    $("input[name=password]").focus();
		    return false;
		}
		
		if($("textarea[name=message]").val() == ""){
		    alert("메세지를 입력하세요");
		    $("textarea[name=message]").focus();
		    return false;
		}
		
		
	
		$('form[name="frm"]').submit();
	})
});
</script>






</head>
<body>

	<form action="saveMessage.jsp" name="frm" method="get">
		이름 : <input type="text" name="guestName" required /><br/><br/>
		암호 : <input type="password" name="password" required /><br/><br/>
		메세지 : <textarea name="message" rows="3" cols="30" required></textarea><br/><br/>
		<input id='submitBtn' type="button" value="메세지 남기기" >
	</form>
</body>
</html>