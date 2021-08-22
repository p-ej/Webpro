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
  
  <!-- 장바구니 스타일 -->
  <link href="resources/css/cartList.css" rel="stylesheet"> 


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
      					<script src="resources/js/product/allCheck.js"></script>
						
						<button type="button" class="selectDelete_btn">선택 삭제</button>
						<script src="resources/js/product/selectCheck.js"></script>

						</div>
					<div class="row">
						<c:set var="sum" value="0"/>
					
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
										<h5>구입 수량 : ${cartList.SP_STOCK }</h5>
										<h5>최종 가격 :<fmt:formatNumber value="${cartList.SP_PRICE * cartList.SP_STOCK}" pattern="###,###,###" />
										</h5>
									</div>
									<div class="card-footer">
										<small class="text-muted">
										<button type="button" class="delete_${cartList.s_CNUM}_btn btn btn-default" data-S_CNUM="${cartList.s_CNUM }">삭제</button></small>
										<input type="checkbox" name="chBox" class="chBox" data-S_CNUM="${cartList.s_CNUM }" />
									<script src="resources/js/product/selectDelete.js"></script>
									</div>
								</div>
							</div>
							
						<c:set var="sum" value="${sum+(cartList.SP_PRICE * cartList.SP_STOCK)}" />
						</c:forEach>
	
					</div>
					<hr>
					<div class="listResult">
						<div class="sum">
							총 합계 : <fmt:formatNumber pattern = "###,###,###" value="${sum }"/>원
						</div>
						<div class="orderOpne">
							<button type="button" class="orderOpne_btn">주문 정보 입력</button>
							<script>
								$(".orderOpne_btn").click(function(){
									$(".orderInfo").slideDown();
									$(".orderOpne_btn").slideUp();
								});
							</script>
						</div>
					</div>
					
					<div class="orderInfo">
						<form role="form" method="post" autocomplete="off" action="./orderWrite">
							<input type="hidden" name="amount" value="${sum }"/>
							
							<div class="inputArea">
								<label for="">수령인</label>
								<input type="text" name="orderRec" id="orderRec" required="required"/>
							</div>
							
							<div class="inputArea">
							   <label for="orderPhon">수령인 연락처</label>
							   <input type="text" name="orderPhon" id="orderPhon" required="required" />
							</div>

							<div class="inputArea">
							<p>
								<input type="text" id="sample3_postcode" placeholder="우편번호">
								<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기">
							</p>
							<p>
								<input type="text" name="userAddr1" id="sample3_address" placeholder="주소">
								<input type="text" name="userAddr2" id="sample3_detailAddress" placeholder="상세주소">
								<input type="text" name="userAddr3" id="sample3_extraAddress" placeholder="참고항목">
							</p>
								<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
								</div>
							</div>
							
							<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
							<script src="resources/js/Daumaddr.js"></script>
<!-- 							<div class="inputArea">
							   <label for="userAddr1">우편번호</label>
							   <input type="text" name="userAddr1" id="userAddr1" required="required" />
							</div>
							
							<div class="inputArea">
							   <label for="userAddr2">1차 주소</label>
							   <input type="text" name="userAddr2" id="userAddr2" required="required" />
							</div>
							  
							<div class="inputArea">
							   <label for="userAddr3">2차 주소</label>
							   <input type="text" name="userAddr3" id="userAddr3" required="required" />
							</div> -->
							  
							<div class="inputArea">
							   <button type="submit" class="order_btn">주문</button>
							   <button type="button" class="cancel_btn">취소</button> 
							   
							   <script>
							   	$(".cancel_btn").click(function(){
							   		$(".orderInfo").slideUp();
							   		$(".orderOpne_btn").slideDown();
							   	});
							   </script>
							</div>
						</form>
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