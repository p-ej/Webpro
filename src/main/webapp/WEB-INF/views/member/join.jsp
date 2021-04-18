<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/css/shop.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<body>
<!-- 네브바 시작 -->
<jsp:include page="../templates/top.jsp" flush="boolean"/>
<!-- 네브바 끝 -->

<!-- 들어갈 내용 시작 -->
   <div class="container">
      <h1 class="mt-4">Join Us!</h1>
      <hr>
       <form class="form-horizontal"  method="post" action="./join" id="regForm">
       <div class="form-group" id="id">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="s_id" name="S_ID"placeholder="아이디" maxlength="30">
                        <button class="btn btn-primary" type="button" id="idChk" onclick="fn_idChk();" value="N" >중복확인</button>
                    </div>
                </div>
                <div class="form-group" id="pw">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="s_pw" name="S_PW"  placeholder="패스워드" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="pw2">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="s_pw2" name="s_pw2" placeholder="패스워드 확인" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="name">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul" id="s_name" name="S_NAME" placeholder="한글만 입력 가능합니다." maxlength="15">
                    </div>
                </div>
                <div class="form-group" id="email">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" class="form-control" id="email" name="S_EMAIL" placeholder="이메일" maxlength="40">
                    </div>
                </div>
                <div class="form-group" id="phone">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="s_phone" name="S_PHONE" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                    </div>
                </div>
                  <div class="form-group" id="phone">
                   
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" id="submit" class="btn btn-primary">Sign in</button>
                    </div>
                </div>
                </form>
   </div>
   <!-- 들어갈 내용 끝 -->
   
   
   <script type="text/javascript">
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
   </script>
   
    
   <!-- footer start -->
   <jsp:include page="../templates/footer.jsp" flush="boolean"/>
   <!-- footer end -->
  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>