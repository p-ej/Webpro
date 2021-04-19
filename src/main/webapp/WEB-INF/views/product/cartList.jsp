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

      <div class="col-lg-9">
      					<div>
      					<label for="allCheck">모두 선택</label>
      					<input type="checkbox" name="allCheck" id="allCheck" />
      					<script>
	      					$("#allCheck").click(function(){
	      						 var chk = $("#allCheck").prop("checked");
	      						 if(chk) {
	      						  $(".chBox").prop("checked", true);
	      						 } else {
	      						  $(".chBox").prop("checked", false);
	      						 }
	      						});
      					</script>
						
						<button type="button" class="selectDelete_btn">선택 삭제</button>
						<script>
							 $(".selectDelete_btn").click(function(){
							  var confirm_val = confirm("정말 삭제하시겠습니까?");
							  
							  if(confirm_val) {
							   var checkArr = new Array();
							   
							   $("input[class='chBox']:checked").each(function(){
							    checkArr.push($(this).attr("data-s_CNUM"));
							   });
							    
							   $.ajax({
								   url : "./deleteCart",
								   type : "post",
								   data : { chbox : checkArr },
								   success : function(result){
								    if(result == 1) {          
								     location.href = "./cartList";
								    } else {
								     alert("삭제 실패");
								    }
								   }
								 });
							  	} 
							 });
						</script>

						</div>
					<div class="row">

						<div class="allCheck">
							
						</div>
	
						<div class="delBtn">
							
						</div>
						<c:forEach items="${cartList}" var="cartList">
							<div class="col-lg-4 col-md-6 mb-4">
	
								<div class="card h-100">
									<a href="./productdetail?num=${cartList.SP_NUM}"><img
										width="150" height="120px" class="card-img-top"
										src="resources/${cartList.SP_THUMBIMG }" alt=""></a>
									<div class="card-body">
										<h4>상품명</h4>
										<h4 class="card-title">
											<a href="./productdetail?num=${cartList.SP_NUM}">${cartList.SP_NAME}</a>
										</h4>
										<h5>개당 가격 :<fmt:formatNumber value="${cartList.SP_PRICE}" pattern="###,###,###" />
										</h5>
										<h5>구입 수량 : ${cartList.s_CSTOCK }</h5>
										<h5>최종 가격 :<fmt:formatNumber value="${cartList.SP_PRICE * cartList.s_CSTOCK}" pattern="###,###,###" />
										</h5>
									</div>
									<div class="card-footer">
										<small class="text-muted">
										<button type="button" class="delete_${cartList.s_CNUM}_btn btn btn-default" data-S_CNUM="${cartList.s_CNUM }">삭제</button></small>
										<input type="checkbox" name="chBox" class="chBox" data-S_CNUM="${cartList.s_CNUM }" />
										<script>
											 $(".delete_${cartList.s_CNUM}_btn").click(function(){
											  var confirm_val = confirm("정말 삭제하시겠습니까?");
											  
											  if(confirm_val) {
											   var checkArr = new Array();
											   
											   checkArr.push($(this).attr("data-S_CNUM"));
											              
											   $.ajax({
											    url : "./deleteCart",
											    type : "post",
											    data : { chbox : checkArr },
											    success : function(result){
											     if(result == 1) {            
											      location.href = "./cartList";
											     } else {
											      alert("삭제 실패");
											     }
											    }
											   });
											  } 
											 });
										</script>
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