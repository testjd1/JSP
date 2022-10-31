window.onload = function(){

		var frm = document.getElementById('frm');
		//var inputs = document.querySelectorAll("input");
	
	
		frm.onsubmit = function(evt){
			evt.stopPropagation();
			evt.preventDefault();
			
			if(!frm.agree.checked){
				alert('체크해')
				return;
			}
			frm.submit();
		}		


	}