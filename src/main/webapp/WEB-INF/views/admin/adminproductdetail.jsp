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

  <title>Shop Item - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/css/shop.css" rel="stylesheet">
  
  <!-- 중요 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
					<h2>Product Detail</h2>
				</header>
				<form role="form" method="post" autocomplete="off">
					<input type="hidden" name="num" value="${productDetail.SP_NUM}" />
					<div class="inputArea">
						<label><strong>1차 분류</strong></label> <span class="category1"></span> 
						<label><strong>2차 분류</strong></label> <span class="category2">${productDetail.SC_CODE}</span>
					</div>

					<div class="inputArea">
						<label for="SP_NAME"><strong>상품명</strong></label> <span>${productDetail.SP_NAME}</span>
					</div>

					<div class="inputArea">
						<label for="SP_PRICE"><strong>상품가격</strong></label> <span>
						<fmt:formatNumber value="${productDetail.SP_PRICE}" pattern="###,###,###" /></span>
					</div>

					<div class="inputArea">
						<label for="SP_STOCK"><strong>상품수량</strong></label> <span>${productDetail.SP_STOCK}</span>
					</div>

					<div class="inputArea">
						<label for="SP_DES">
						<strong>상품소개</strong></label> 
						<div class="SP_DES">${productDetail.SP_DES}</div>
					</div>
					
					<div class="inputArea">
						<label for="SP_IMG"><strong>이미지</strong></label> 
						<p>원본 이미지</p>
						<img src="resources/${productDetail.SP_IMG }"  class="oriImg" />
						
						<p>썸네일</p>
						<img src="resources/${productDetail.SP_THUMBIMG }" class="thumbImg" />
					</div>
					<div class="inputArea">
						<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
						<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
						<script>
							var formObj = $("form[role='form']");
													
								$("#modify_Btn").click(function(){
									formObj.attr("action","./adminproductmodify");
									formObj.attr("method","get");
									formObj.submit();
								});
													
								$("#delete_Btn").click(function(){
									var con = confirm("정말 삭제하시겠습니까?");
									if(con){
										formObj.attr("action","./admindelete");
										formObj.submit();
									}
								});
						</script>
					</div>
				</form>

			</div>
      <!-- /.col-lg-9 -->

    </div>

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