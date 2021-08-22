											 $(".delete_${cartList.s_CNUM}_btn").click(function(){
											  var confirm_val = confirm("정말 삭제하시겠습니까?");
											  
											  if(confirm_val) {
											   var checkArr = new Array();
											   
											   checkArr.push($(this).attr("data-S_CNUM"));
											              
											   $.ajax({
											    url : "./deleteCart",
											    type : "post",
											    data : { chbox : checkArr },
											    success : function(result){
											     if(result == 1) {            
											      location.href = "./cartList";
											     } else {
											      alert("삭제 실패");
											     }
											    }
											   });
											  } 
											 });