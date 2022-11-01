<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 아이디 중복 검사 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	//$('.userinput').keyup(function(){ -> 키 입력마다, 서버 넘김 요즘 잘안씀
	$('#id_check').click(function(){	
		$.ajax({
			url : 'IdCheck.jsp',
			data : { id : $('.userinput').val()},
			success : function(data){
				//	 alert('<' + data + '>')
				if(data.trim() == 'YES'){ // 통신상 공백 발생 가능성 있음.)
					$('#idmessage').text("이미 존재하는 아이디 입니다.");
					$('#idmessage').show();
				}else if(data.trim()=='NO'){
					$('#idmessage').text("사용 가능한 아이디 입니다.");
					$('#idmessage').show();
				}
					
			}
		});
	});
})


</script>

</head>
<body>

<input name="id" type="text" class="userinput" size="15" />
<button type="button" id="id_check">중복체크</button><br/><br/>
<div id="idmessage" style="display:none;"></div>

</body>
</html>