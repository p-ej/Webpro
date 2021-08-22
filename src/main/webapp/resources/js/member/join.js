 $(document).ready(function(){
         $("#submit").on("click", function(){
            if($("#s_id").val()==""){
               alert("아이디를 입력해주세요.");
               $("#s_id").focus();
               return false;
            }
            if($("#s_pw").val()==""){
               alert("비밀번호를 입력해주세요.");
               $("#s_pw").focus();
               return false;
            }
            if($("#s_name").val()==""){
               alert("성명을 입력해주세요.");
               $("#s_name").focus();
               return false;
            }
            if($("#s_email").val()==""){
               alert("메일을 입력해주세요");
               $("s_email").focus();
               return false;
            }
            if($("#s_phone").val()==""){
               alert("핸드폰 번호를 입력해주세요");
               $("s_phone").focus();
               return false;
            }
            if($("#s_pw").val()!=$("#s_pw2").val()){
               alert("비밀번호 확인이 틀렸습니다.");
               $("input[name='s_pw2']").val('');
               $("#s_pw2").focus();
               
               return false;
               
            }
            
            var idChkVal = $("#idChk").val();
            if(idChkVal == "N"){
               alert("중복확인 버튼을 눌러주세요.");
            }else if(idChkVal == "Y"){
               $("#regForm").submit();
            }
         });
      })
      
      function fn_idChk(){
         $.ajax({
            url : "./idCheck",
            type : "post",
            dataType : "json",
            data : {"s_id": $("#s_id").val()},
            success : function(data){
               if(data == 1){
                     $("#s_id").css("background-color", "#FFCECE");
                     $("#s_id").focus();
                     $("input[name='s_id']").val('');

                  		alert("중복된 아이디입니다.");
               }else if(data == 0){
                  $("#idChk").attr("value","Y");
                     $("#s_id").css("background-color", "#B0F6AC");

                     
                  alert("사용가능한 아이디입니다.");
               }
            }
         })
      }