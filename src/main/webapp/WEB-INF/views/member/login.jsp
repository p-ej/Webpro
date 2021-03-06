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
<!-- 상단 네브바 시작 -->
<jsp:include page="../templates/top.jsp" flush="boolean"/>
<!-- 상단 네브바 끝 -->
	
	<!-- 중앙 들어갈 내용 시작 -->
	<div class="container my-5" align="center">
		<h1 class="mt-4">Log in</h1>
		<hr>
		<br>
		 <form class="form-horizontal" >
		 <div class="form-group" id="id">
                    <div class="col-lg-5">
                        <input type="text" class="form-control onlyAlphabetAndNumber" id="S_ID" name="S_ID"placeholder="아이디" maxlength="30">
                    </div>
                </div>
                <div class="form-group" id="pw">
                    <div class="col-lg-5">
                        <input type="password" class="form-control" id="S_PW" name="S_PW"  placeholder="패스워드" maxlength="30">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                    	<a href="javascript:;" onclick="userCheck()" class="btn btn-primary" >로그인</a>
                        <a href="./joinView" class="btn btn-primary">회원가입</a>
                    </div>
                </div>
                </form>
	</div>
	<!-- 중앙 들어갈 내용 끝 -->
	
	<!-- ajax 데이터 전송 로그인 체크 스크립트-->
	<script src="resources/js/member/login.js"></script>

	<!-- footer start -->
	<jsp:include page="../templates/footer.jsp" flush="boolean"/>
	<!-- footer end -->
	<!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>