		$(".modal_modify_btn").click(function(){
			var modifyConfirm = confirm("정말로 수정하시겠습니까?");
			
			if(modifyConfirm){
				var data = {
						s_reqNum : $(this).attr("data-S_reqNum"),
						s_repCon : $(".modal_repCon").val()
				};
				
				$.ajax({
					url : "./modifyReply",
					type : "post",
					data : data,
					dataType : "text",
					success : function(result){
						if(result == 1){
							replyList();
							$(".replyModal").fadeOut(200);
						} else {
							alert("작성자 본인만 할 수 있습니다.");
						}
					},
					error : function(){
						alert("로그인 하시기 바랍니다.");
					}
				});
			}
		});