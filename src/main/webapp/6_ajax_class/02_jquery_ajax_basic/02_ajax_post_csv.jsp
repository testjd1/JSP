<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
<script type="text/javascript">
$(function(){
	
    var param = {cate : 'book', name : 'hong'};      //jason = 이런 패턴으로 주고 받는걸 뜻함
	 $.ajax({
         type:'post',
         data:param,
         url : '02_server.jsp',
         success : parseData,
         error   : function(err){
            alert('error');
            console.log(err);
         }
      });
      
      //7. CSV포맷  데이터 처리.
      function parseData(strText){
         
      // alert( strText );
         
      var aryData = strText.split("|");
                  
         for(var i=0;i<aryData.length;i++){
            var param  = aryData[i].split("=");            
               if( param[0].trim() == 'cate'){  // 공백제거를 하지 않으면 처음에 공백에 들어와서 cate를 찾지 못함
                document.getElementById("cate").value = param[1];
               }
            
            if( param[0].trim() == 'name'){
               document.getElementById("name").value = param[1];
            }
         
         }
         
      }
   })
   </script>

</head>


<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


