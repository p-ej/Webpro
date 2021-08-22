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
<style>
.a_style {
 color: white;
 text-decoration: none;
 transition: 1s;
}
.a_style:hover { text-shadow: 0 0 .1em, 0 0 .3em; }
</style>
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
        <div class="row">
         <c:forEach items="${list}" var="list">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="./productdetail?num=${list.SP_NUM}"><img width="150" height="120px" class="card-img-top" src="resources/${list.SP_IMG }" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="./productdetail?num=${list.SP_NUM}">${list.SP_NAME}</a>
                </h4>
                <h5><fmt:formatNumber value="${list.SP_PRICE}" pattern="###,###,###" /></h5>
                <c:choose>
                	<c:when test="${list.SP_STOCK != 0 }">
                		<span style="background-color:blue;"><font color="white"><b><a class="a_style">&nbsp;재고있음&nbsp;</a></b></font></span>
                	</c:when>
                	<c:when test="${list.SP_STOCK == 0 }">
                		<span style="background-color:red;"><font color="white"><b><a class="a_style">&nbsp;일시품절&nbsp;</a></b></font></span>
                	</c:when>
                </c:choose>
              </div>
              
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
        </c:forEach>

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