	      					$("#allCheck").click(function(){
	      						 var chk = $("#allCheck").prop("checked");
	      						 if(chk) {
	      						  $(".chBox").prop("checked", true);
	      						 } else {
	      						  $(".chBox").prop("checked", false);
	      						 }
	      						});