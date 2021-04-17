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
<jsp:include page="../templates/top.jsp" flush="boolean"/>
	<div class="container">
		<h1 class="mt-4">Join Us!</h1>
		<hr>
		 <form class="form-horizontal" role="form" method="post" action="./join">
		 <div class="form-group" id="id">
                    <label for="inputId" class="col-lg-2 control-label">아이디</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="id" name="id"placeholder="아이디" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="pw">
                    <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="pw" name="pw"  placeholder="패스워드" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="pw2">
                    <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="pw2"  placeholder="패스워드 확인" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="name">
                    <label for="inputName" class="col-lg-2 control-label">이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul" id="name" name="name" placeholder="한글만 입력 가능합니다." maxlength="15">
                    </div>
                </div>
                <div class="form-group" id="email">
                    <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
                    <div class="col-lg-10">
                        <input type="email" class="form-control" id="email" name="email" placeholder="이메일" maxlength="40">
                    </div>
                </div>
                <div class="form-group" id="phone">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="phone" name="phone" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
                    </div>
                </div>
                  <div class="form-group" id="phone">
                    <label for="inputBirth" class="col-lg-2 control-label">생년 월일</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyNumber" id="year" name="year" placeholder="년" maxlength="4">
                        <input type="text" class="form-control onlyNumber" id="month" name="month" placeholder="월" maxlength="2">
                        <input type="text" class="form-control onlyNumber" id="day" name="day" placeholder="일" maxlength="2">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                        <button type="submit" class="btn btn-primary">Sign in</button>
                    </div>
                </div>
                </form>
	</div>
	
  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>