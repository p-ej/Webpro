	   function userCheck(){
	      var mid = $('#S_ID').val();
	      var mpw = $('#S_PW').val();
	      $.ajax({
	         type : "POST",
	         url : './loginpro',
	         data : {mid:mid, mpw:mpw},   
	         success : function(data){
	            if(data == "false"){
	               alert('정보가 맞지 않습니다. 아이디와 비밀번호를 다시 입력.');
	            }
	            else{
	               location.href="./main";
	            }
	         }
	      });
	   }