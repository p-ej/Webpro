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
      <jsp:include page="../templates/cate.jsp" flush="boolean"/>
      <!-- 카테고리 끝 -->
      
      <!-- /.col-lg-3 -->
		<!-- 댓글 기능을 위한..(미구현) -->
		<form role="form" method="post">
			<input type="hidden" id="SP_NUM"name="SP_NUM" value="${productDetail.SP_NUM}" />
		</form>

			<div class="col-lg-9">
	
	        <div class="card mt-4">
	          <img class="card-img-top img-fluid" width=900px height=400px src="resources/${productDetail.SP_IMG }" alt="">
	          <div class="card-body">
	          	
	            <h4 class="card-title">상품 이름</h4>
	            <p>${productDetail.SP_NAME}</p>
	            
	            <h4 class="card-title">상품 가격</h4>
	            <p>${productDetail.SP_PRICE}</p>
	            
	            <h4 class="card-title">상품 수량</h4>
	            <p class="card-text">${productDetail.SP_STOCK}</p>
	            
	            <h4 class="card-title">상품 설명</h4>
	            <p class="card-text">${productDetail.SP_DES}</p>
	            
	            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
	            4.0 stars
	          </div>
	        </div>
	        
	        <!-- 수량 제이쿼리 -->
	        <div align="right">
				<span>구입 수량</span> 
				<button type="button" class="plus">+</button>
				<input type="number" class="numBox" min="1" max="${productDetail.SP_STOCK}" value="1" readonly="readonly" />
				<button type="button" class="minus">-</button>
				<script>
				  $(".plus").click(function(){
				   var num = $(".numBox").val();
				   var plusNum = Number(num) + 1;
				   
				   if(plusNum >= ${productDetail.SP_STOCK}) {
				    $(".numBox").val(num);
				   } else {
				    $(".numBox").val(plusNum);          
				   }
				  });
				  
				  $(".minus").click(function(){
				   var num = $(".numBox").val();
				   var minusNum = Number(num) - 1;
				   
				   if(minusNum <= 0) {
				    $(".numBox").val(num);
				   } else {
				    $(".numBox").val(minusNum);          
				   }
				  });
				 </script>
				 
				 <!-- 카트 담기 -->
				<button type="button" class="addCart_btn">카트에 담기</button>
				 <script>
				  $(".addCart_btn").click(function(){
				   var SP_NUM = $("#SP_NUM").val();
				   var S_CSTOCK  = $(".numBox").val();
				      
				   var data = {
						   SP_NUM : SP_NUM,
						   S_CSTOCK : S_CSTOCK
				     };
				   
					   $.ajax({
					    url : "./addCart",
					    type : "post",
					    data : data,
					    success : function(result){
					    	if(result == 1) {
					    	     alert("카트 담기 성공");
					    	     $(".numBox").val("1");
					    	    } else {
					    	     alert("회원만 사용할 수 있습니다.")
					    	     $(".numBox").val("1");
					    	    }
					    	   },
					    error : function(){
					     alert("카트 담기 실패");
					    }
					   });
				  });
				 </script>
	        </div>
	        
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