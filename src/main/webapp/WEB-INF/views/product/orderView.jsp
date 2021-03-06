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
 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0; width:600px;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
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
			<section id="content">
			
			 <div class="orderInfo">
			  <c:forEach items="${orderView}" var="orderView" varStatus="status">
			   
			   <c:if test="${status.first}">
			    <p><span>수령인</span>${orderView.orderRec}</p>
			    <p><span>주소</span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</p>
			    <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
			  	<p><span>상태</span>${orderView.delivery}</p>
			   </c:if>
			   
			  </c:forEach>
			 </div>
			 
			 <ul class="orderView">
			  <c:forEach items="${orderView}" var="orderView">     
			  <li>
			   <div class="thumb">
			    <img src="${orderView.SP_THUMBIMG}" />
			   </div>
			   <div class="gdsInfo">
			    <p>
			     <span>상품명</span>${orderView.SP_NAME}<br />
			     <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.SP_PRICE}" /> 원<br />
			     <span>구입 수량</span>${orderView.SP_STOCK} 개<br />
			     <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.SP_PRICE * orderView.SP_STOCK}" /> 원                  
			    </p>
			   </div>
			  </li>     
			  </c:forEach>
			 </ul>
			</section>
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