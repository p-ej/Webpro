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
  
</head>
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
			<form action="./reply" method="post">
		<input type="hidden" name="SB_NUM" value="${reply.SB_NUM}"> <input
			type="hidden" name="SB_GROUP" value="${reply.SB_GROUP}"> <input
			type="hidden" name="SB_STEP" value="${reply.SB_STEP}"> <input
			type="hidden" name="SB_INDENT" value="${reply.SB_INDENT}">

		<table width="500" class="table table-bordered">
			<tr>
				<td>번호</td>
				<td>${reply.SB_NUM}</td>
			</tr>
			<tr>
				<td>히트</td>
				<td>${reply.SB_HIT}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="hidden" name="SB_NAME" value="${mid}">${mid}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="SB_TITLE"
					value="${reply.SB_TITLE}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" name="SB_CONTENT">${reply.SB_CONTENT}</textarea></td>
			</tr>
			<tr align = "center">
				<td colspan="2">
				<input type="submit" value="답변" class="btn btn-dark"> 
				<a href="./boardlist">목록</a></td>
			</tr>

		</table>
	</form>
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
