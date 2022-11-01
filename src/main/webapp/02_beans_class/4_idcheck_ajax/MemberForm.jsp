<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입  </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" >
$(function(){
   $('#check_id').click(function(){   //데이터낭비 심하므로 요즘 쓰지 않는다.
      //alert('ddd')
      $.ajax({
         url  : 'IdCheck.jsp',
         data : {id : $('.userinput').val()},
         success  : function(data){
            //alert('<'+data+'>');
            if(data.trim()=='true'){
               $('#result').text('이미 존재함');
               $('#result').show();
            }else if(data.trim()=='false'){
               $('#result').text('사용 가능함');               
            }
         }   
            
      });
   });
   
   
   
   
})
</script>
</head>
<body>

<h1>회원가입서 작성하기</h1>
 
   <form action="InsertMember.jsp" method="post" name="frm">
      <table>
         <tr>
            <td width="100">
            <font color="blue">아이디</font>
            </td>
            <td width="100">
            <input type="text" name="id" class='userinput'>
            <input type="button" value="중복확인" id='check_id'>
            <span id='result'></span>
            </td>
         </tr>
         <tr>
            <td width="100">
            <font color="blue">비밀번호</font>
            </td>
            <td width="100">
            <input type="password" name="password"/><br/>
            </td>
         </tr>
         <tr>
            <td width="100">
            <font color="blue">비밀번호확인</font>
            </td>
            <td width="100">
            <input type="password" name="repassword"/><br/>
            </td>
         </tr>
         <tr>
            <td width="100">
            <font color="blue">이름</font>
            </td>
            <td width="100">
            <input type="text" name="name"/><br/>
            </td>
         </tr>
         <tr>
            <td width="100">
            <font color="blue">전화번호</font>
            </td>
            <td>
            <input type="text" size="15" name="tel"/>
            <br/>
            </td>
         </tr>
         <tr>
            <td width="100">
            <font color="blue">주소</font>
            </td>
            <td>
            <input type="text" size="50" name="addr"/><br/>
            </td>
         </tr>
         <tr>
            <td width="100">
             <!--로그인 버튼-->
             <input type="submit" value="회원가입">
            </td>
            <td width="100">
            <input type="reset" name="cancel" value="취소"><br/>
            </td>
         </tr>
      </table>
   </form>



 </body>
</html>
    