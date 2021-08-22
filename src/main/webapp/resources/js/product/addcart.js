				  $(".addCart_btn").click(function(){
				   var SP_NUM = $("#SP_NUM").val();
				   var SP_STOCK  = $(".numBox").val();
				      
				   var data = {
						   SP_NUM : SP_NUM,
						   SP_STOCK : SP_STOCK
				     };
				   
					   $.ajax({
					    url : "./addCart",
					    type : "post",
					    data : data,
					    success : function(result){
					    	if(result == 1) {
					    	     alert("카트 담기 성공");
					    	     $(".numBox").val("1");
					    	    } else {
					    	     alert("회원만 사용할 수 있습니다.")
					    	     $(".numBox").val("1");
					    	    }
					    	   },
					    error : function(){
					     alert("카트 담기 실패");
					    }
					   });
				  });