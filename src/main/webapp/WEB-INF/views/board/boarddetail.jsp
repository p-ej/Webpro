<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Shop Homepage - Start Bootstrap Template</title>
  
  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/css/shop.css" rel="stylesheet">
  
  <!-- jquery 반응 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script>
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
		
		// 수정
		$(".update_btn").on("click",function(){
			formObj.attr("action","./boardupdateView");
			formObj.attr("method","get");
			formObj.submit();
		})
		
		// 삭제
		$(".delete_btn").on("click",function(){
			formObj.attr("action","./boarddelete");
			formObj.attr("method","get");
			formObj.submit();
		})
		
		// 목록
		$(".list_btn").on("click",function(){
			location.href= "./boardlist";
		})
		
		// 답변
		$(".reply_btn").on("click",function(){
			formObj.attr("action","./boardreply");
			formObj.attr("method","get");
			formObj.submit();
		})
		
	})
</script>
<body>
	<jsp:include page="../templates/top.jsp" flush="boolean"/>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

	  <!-- 카테고리 시작 -->
		<jsp:include page="../templates/cate.jsp" flush="boolean"/>
      <!-- 카테고리 끝 -->

	  
      <div class="col-lg-9">
      			<header>
					<h2>게시글 등록</h2>
				</header>
		<!-- 들어갈내용 시작 -->
			<form name="readForm" role="form" >
				<input type="hidden" id="num" name="num" value="${board.SB_NUM }">
			</form>	
			<table class="table table-bordered" width=450>
				<tr>
					<td>작성자</td>
					<td>${board.SB_NAME }</td>
				</tr>
				
				<tr>
					<td>제목</td>
					<td>${board.SB_TITLE }</td>
				</tr>	
				
				<tr height="100">
					<td>내용</td>
					<td>${board.SB_CONTENT }</td>
				</tr>
				
				<tr>
					<td>날짜</td>
					<td>${board.SB_DATE }</td>
				</tr>
				
				<tr>
					<td>조회수</td>
					<td>${board.SB_HIT }</td>
				</tr>
			</table>
			<div align="center">
			<button type="button" class="list_btn btn btn-primary">목록</button>
			<c:choose>
				<c:when test="${mid eq board.SB_NAME }">
					<button type="button" class="update_btn btn btn-primary">수정</button>
					<button type="button" class="delete_btn btn btn-primary">삭제</button>
				</c:when>
				<c:when test="${mid eq 'admin' }">
					<button type="button" class="delete_btn btn btn-primary">삭제</button>
					<button type="button" class="reply_btn btn btn-primary">답변</button>
				</c:when>
				<c:when test="${!empty mid }">
					<button type="button" class="reply_btn btn btn-primary">답변</button>
				</c:when>
			</c:choose>
			</div>
        <!-- 들어갈내용 끝 -->
	</div>
</div>
</div>


	<!-- footer start -->
	<jsp:include page="../templates/footer.jsp" flush="boolean"/>
	<!-- footer end -->

  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
