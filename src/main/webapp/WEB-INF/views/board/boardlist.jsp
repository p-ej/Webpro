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

			<!-- /.col-lg-3 -->

			<div class="col-lg-9">
				<header>
					<h2>QNA게시판</h2>
				</header>
				<table class="table table-horver" border="1">
					<tr align="center">
						<td>번호</td>
						<td>제목</td>
						<td>날짜</td>
						<td>작성자</td>
						<td>조회수</td>
					</tr>
					
					<!-- 데이터가 삽입될 자리 -->
					<c:forEach items="${list }" var="list">
						<tr>
							<td align="center">${list.SB_NUM }</td>
							<td>
							<c:forEach begin="1" end="${list.SB_INDENT }">RE: </c:forEach>							
							<a href="./boarddetail?num=${list.SB_NUM }">${list.SB_TITLE }</a></td>
							<td align="center">${list.SB_DATE }</td>
							<td align="center">${list.SB_NAME }</td>
							<td align="center">${list.SB_HIT }</td>
						</tr>
					</c:forEach>
					
					<tr align=center height=20>
						<td colspan=7 style=font-family:Tahoma;font-size:10pt;>

						<c:choose>
							<c:when test="${nowpage <= 1 }">
								[이전]&nbsp;
							</c:when>
							<c:otherwise>
								<a href="./boardlist?page=${nowpage-1 }">[이전]</a>&nbsp;
							</c:otherwise>
						</c:choose>
							
						<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
							<c:choose>
								<c:when test="${a == nowpage }">
									[${a }]
								</c:when>
								<c:otherwise>
									<a href="./boardlist?page=${a }">[${a }]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:choose>
							<c:when test="${nowpage >= maxpage }">
								[다음]
							</c:when>
							<c:otherwise>
								<a href="./boardlist?page=${nowpage+1 }">[다음]</a>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					

				</table>
					<c:choose>
						<c:when test="${mid eq null}">
						</c:when>
						
						<c:otherwise>
								<div align="right">
									<a href="./boardwriteView" >글쓰기</a>
								</div>
						</c:otherwise>
					</c:choose>
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
