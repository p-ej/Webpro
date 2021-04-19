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
   
<body>
<!-- 네브바 부분 -->
<jsp:include page="../templates/top.jsp" flush="boolean"/>
<!-- 네브바 끝 -->

<!-- 해당 페이지 안에 들어갈 내용 시작 -->
	<div class="container">
		<h1 class="mt-4">INFO!</h1>
		<hr>
		 <form class="form-horizontal" role="form" method="post" action="./memberModify">
		 <div class="form-group" id="id">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" value="${member.s_ID}" id="S_ID" name="S_ID" placeholder="아이디" maxlength="30" readonly="readonly"/>
                    </div>
                </div>
                <div class="form-group" id="pw">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control"  name="S_PW"  value="${member.s_PW}" placeholder="패스워드" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="pw2">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control"  value="${member.s_PW}" placeholder="패스워드 확인" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="name">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul"  name="S_NAME" value="${member.s_NAME}" placeholder="한글만 입력 가능합니다." maxlength="15">
                    </div>
                </div>
                <div class="form-group" id="email">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" class="form-control" value="${member.s_EMAIL}" name="S_EMAIL" placeholder="이메일" maxlength="40">
                    </div>
                </div>
                <div class="form-group" id="phone">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label" >휴대폰 번호</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" value="${member.s_PHONE}"name="S_PHONE" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                    </div>
                </div>
                  
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary">회원정보 수정</button>
                    </div>
                </div>
                </form>
	</div>
	<!-- 해당 페이지 안에 들어갈 내용 끝 -->
	
	<!-- footer start -->
	<jsp:include page="../templates/footer.jsp" flush="boolean"/>
	<!-- footer end -->
	
  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>