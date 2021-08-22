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
  <meta name="anuthor" content="">

  <title>Shop Item - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/css/shop.css" rel="stylesheet">
  
  <!-- 중요 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <!-- 소감css -->
  <link href="resources/css/productdetail.css" rel="stylesheet">

<script>
	function replyList(){
			var SP_NUM = ${productDetail.SP_NUM};
			console.log(SP_NUM);
			$.getJSON("./replyList?num="+SP_NUM,function(data){
				var str = "";
				console.log("data: ",data.length);
				$(data).each(function(){
					console.log("data : "+data);
					
					// 날짜 데이터
					var repDate = new Date(this.s_repDate);
					repDate = repDate.toLocaleDateString("ko-US");
				
					// html 코드 조합
					str += "<li data-SP_NUM='"+ this.SP_NUM +"'>"
					+ "<div class='userInfo'>"
					+ "<span class='userName'>" + this.s_NAME + "</span>"
					+ "<span class='date'>" + repDate + "</span>"
					+ "</div>"
					+ "<div class='replyContent'>" + this.s_repCon + "</div>"
					
					+ "<c:if test='${mid != null}'>"
					
					+ "<div class = 'replyFooter'>"
					+ "<button type='button' class='modify' data-S_reqNum='"+this.s_reqNum +"'>M</button>"
					+ "<button type='button' class='delete' data-S_reqNum='"+this.s_reqNum +"'>D</button>"
					+ "</div>"
					
					+ "</c:if>"
					
					+ "</li>";   
					
			});
			
			$("section.replyList ol").html(str);
		});
	}
</script>
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
	            <p>${productDetail.SP_PRICE} 원</p> 
	            
	            <h4 class="card-title">상품 수량</h4>
	            <p class="card-text">${productDetail.SP_STOCK} EA</p>
	            
	            
	            <h4 class="card-title">상품 설명</h4>
	            <p class="card-text">${productDetail.SP_DES}</p>
	            
	            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
	            4.0 stars
	          </div>
	        </div>
	        
	        <!-- 수량 제이쿼리 -->
	        <div align="right">
	        <c:if test="${productDetail.SP_STOCK != 0}">
	        	<span>구입 수량</span> 
				<button type="button" class="plus">+</button>
				<input type="number" class="numBox" min="1" max="${productDetail.SP_STOCK}" value="1" readonly="readonly" />
				<button type="button" class="minus">-</button>
				<input type="hidden" value="${productDetail.SP_STOCK}" class="stock_hidden"/>
				 <!-- 카트 담기 -->
				<button type="button" class="addCart_btn btn btn-primary">카트에 담기</button>
			</c:if>

			<c:if test="${productDetail.SP_STOCK == 0}">
				<p><b>상품 수량이 부족합니다.</b></p>
			</c:if>

				<script src="resources/js/product/cartstock.js"></script>
				<script src="resources/js/product/addcart.js"></script>
				
	        </div>
	        
	        <!-- 상품 댓글 시작 -->
	        <div id="reply">
	        	<c:if test="${mid == null }">
	        		<p>소감을 남기시려면<a href="./loginView">로그인</a>하세요</p>
	        	</c:if>
	        	
	        	<c:if test="${mid != null }">
		        <section class="replyForm">
		        	<form role="form" method="post" autocomplete="off" >
		        	
		        		<input type="hidden" name="SP_NUM" id="SP_NUM" value="${productDetail.SP_NUM }"/>
		        		
		        		 
		        		<div class="input_area">
		        			<textarea name="S_repCon" id="S_repCon"></textarea>
		        		</div>
		        		
		        		<div class="input_area">
		        			<button type="button" id="reply_btn">소감 남기기</button>
		        			<script>
		        				$("#reply_btn").click(function(){
		        					 var formObj = $(".replyForm form[role='form']");
		        					 var SP_NUM = $("#SP_NUM").val();
		        					 var S_repCon = $("#S_repCon").val();
		        					 
		        					 var data = {
		        							 SP_NUM : SP_NUM,
		        							 S_repCon : S_repCon
		        					 };
		        					 $.ajax({
		        						url : "./replyWrite",
		        						type : "post",
		        						data : data,
		        						success : function(){
		        							replyList();
		        							$("#S_repCon").val("");
		        						}
		        					 });
		        				});	
		        			
		        			</script>
		        		</div>
		        		
		        	</form>
		        </section>
	        	</c:if>
	        	
	        	<section class="replyList">
	        		<ol>
		        		
<%-- 		        		<c:forEach items="${reply}" var="reply">
		        		<li>
			        		<div class="userInfo">
			        			<span class="userName">${reply.s_NAME }</span>
			        			<span class="date"><fmt:formatDate value="${reply.s_repDate }" pattern="yyyy-MM-dd"/></span>
			        		</div>
			        		<div class="replyContent">${reply.s_repCon }</div>
		        		</li>
		        		</c:forEach> --%>
	        			
	        		</ol>
	        		<!-- ajax 소감 목록 조회 -->
	        		<script>
	        			replyList();
	        		</script>
	        		
	        		<script>
	        			$(document).on("click",".modify",function(){
	        				// $(".replyModal").attr("style", "display:block;");
	        				$(".replyModal").fadeIn(200);
	        				
	        				var repNum = $(this).attr("data-S_reqNum");
	        				var repCon = $(this).parent().parent().children(".replyContent").text();
	        				
	        				$(".modal_repCon").val(repCon);
	        				$(".modal_modify_btn").attr("data-S_reqNum",repNum);
	        			});
	        		</script>
	        		
	        		<script>
	        			$(document).on("click",".delete",function(){
	        				
	        				var deleteConfirm = confirm("정말로 삭제하시겠습니까?");
	        				if(deleteConfirm){
		        				var data =  { s_reqNum : $(this).attr("data-S_reqNum") };
		        				
		        				$.ajax({
		        					anyne:true,
		        					url  : "./deleteReply",
		        					data : data,
		        					type : "post",
		        					dataType : "text",
		        					success : function(result){
		        						if(result==1){
		        							replyList();	
		        						} else {
		        							alert("작성자 본인만 할 수 있습니다.");
		        						}
		        					},
		        					error : function(){
		        						alert("로그인하셔야합니다.");
		        					}
		        				});
	        				}
	        			});
	        		</script>
	        	</section>
	        </div>
	        <!-- 상품 댓글 끝 -->
	      </div>
      <!-- /.col-lg-9 -->

    </div>

  </div>
  <!-- /.container -->

   <!-- footer start -->
   <jsp:include page="../templates/footer.jsp" flush="boolean"/>
   <!-- footer end -->
   
   <!-- 소감 수정 창 -->
	<div class="replyModal">
	 <div class="modalContent">
	 
	  <div>
	   <textarea class="modal_repCon" name="modal_repCon"></textarea>
	  </div>
	  
	  <div>
	   <button type="button" class="modal_modify_btn">수정</button>
	   <button type="button" class="modal_cancel">취소</button>
	  </div>
	  
	 </div>
	
	 <div class="modalBackground"></div>
	</div>
	
	<!-- 소감 수정 -->
	<script src="resources/js/product/replymodify.js"></script>
	
	<!-- 소감 수정 취소 -->
	<script>
		$(".modal_cancel").click(function(){
			//$(".replyModal").attr("style","display:none;");
			$(".replyModal").fadeOut(200);
		});
	</script>
	
  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>