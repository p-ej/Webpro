<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
      <jsp:include page="../templates/admincate.jsp" flush="boolean"/>
      <!-- 카테고리 끝 -->
      
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
            	<header>
					<h2>Product List</h2>
				</header>
        <div class="row">
        	<!-- container_box .start -->
        	<div id="container_box">
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>카테고리</th>
							<th>가격</th>
							<th>수량</th>
						</tr>
					</thead>
					<tbody>
					
						<c:forEach items="${list}" var="list">
							<tr>
							
								<td><img src="resources/${list.SP_THUMBIMG }"></td>
								<td><a href="./adminproductdetail?num=${list.SP_NUM }">${list.SP_NAME }</a></td>
								<td>${list.SC_NAME }</td>
								<td>
									<fmt:formatNumber value="${list.SP_PRICE }" pattern="###,###,###"/>
								</td>
								<td>${list.SP_STOCK }</td>
							
							</tr></c:forEach>
						
						
					</tbody>
				</table>
			</div>
			<!-- container_box .end -->
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

   <!-- footer start -->
   <jsp:include page="../templates/footer.jsp" flush="boolean"/>
   <!-- footer end -->

  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>