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
<script type="text/javascript">
function goPage(){
		// 링크가 눌려지면 해당 함수가 호출됨.
		document.modifyf.action = "./boardupdate";
		document.modifyf.method = "post";
		document.modifyf.submit();
}
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
		<form name="modifyf">
			<table class="table table-bordered" width=450>
				<tr>
					<td>번호</td>
					<td><input type="hidden" name="SB_NUM" value="${board.SB_NUM }">${board.SB_NUM }</td>
				</tr>
				
				<tr>
					<td>작성자</td>
					<td><input type="hidden" name="SB_NAME" value="${board.SB_NAME }">${board.SB_NAME }</td>
				</tr>
				
				<tr>
					<td>제목</td>
					<td><input name="SB_TITLE" value="${board.SB_TITLE }"></td>
				</tr>	
				
				<tr>
					<td>내용</td>
					<td><textarea cols="50" rows="10" name="SB_CONTENT">${board.SB_CONTENT }</textarea></td>
				</tr>
				
				<tr>
					<td>날짜</td>
					<td>${board.SB_DATE }</td>
				</tr>
				
				<tr>
					<td>조회수</td>
					<td>${board.SB_HIT }</td>
				</tr>
				
				<tr align="center">
					<td colspan="2">
						<a href="javascript:;" onclick="goPage()">수정완료</a>
						<a href="javascript:history.go(-1)">뒤로가기</a>
					</td>
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
