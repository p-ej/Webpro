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
	#container_box ul li { margin-bottom:20px; border:10px solid #eee; }
	.replyInfo { background:#eee; padding:10px; font-size:18px; }
	.replyInfo span { font-size:20px; font-weight:bold; margin-right:20px; }
	.replyContent { padding:10px; }
	
	.replyControll {text-align:right; padding:10px; }
	.replyControll button { border:2px solid #999; background:#fff; }
	</style>
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
				 <ul>
				  <c:forEach items="${reply}" var="reply">
				  <li>
				   <div class="replyInfo">
				    <p>
				     <span>작성자</span>${reply.s_NAME} (${reply.s_ID})
				    </p>
				    <p>
				     <span>작성된 상품</span> <a href="./productdetail?num=${reply.SP_NUM}">바로가기</a>
				    </p>
				   </div>
				   <div class="replyContent">
				    ${reply.s_repCon}
				   </div>
				   
				   <div class="replyControll">
				   <form role="form" method="post" action="./replyDelete">
				    <input type="hidden" name="S_reqNum" value="${reply.s_reqNum }"/>
				   	<button type="submit" class="delete_${reply.s_reqNum }_btn">삭제</button>
				   	</form>
				   </div>
				  </li>     
				  </c:forEach>
				 </ul>
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