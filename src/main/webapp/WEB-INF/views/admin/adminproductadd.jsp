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
  
  <!-- cheditor.js -->
  <script src="resources/ckeditor/ckeditor.js"></script>
  
  <!-- jquery ajax 기능 동작 스크립트 !! 중요 꼭 넣어야함. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
</head>
<script>
	function goPage(){
		document.writeForm.action = "./write";
		document.writeForm.method = "post";
		document.writeForm.submit();
	}
</script>
<body>
	<jsp:include page="../templates/top.jsp" flush="boolean"/>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

	  <!-- 카테고리 시작 -->
		<jsp:include page="../templates/admincate.jsp" flush="boolean"/>
      <!-- 카테고리 끝 -->

	  
      <div class="col-lg-9">
      			<header>
					<h2>Product Add</h2>
				</header>
		<!-- 들어갈내용 시작 -->
		
			<!-- 카테고리 분류 -->
				<form role="form" method="post" autocomplete="off" action="./register" enctype="multipart/form-data">
					<label>1차 분류</label> 
					<select class="category1">
						<option value="">전체</option>
					</select>
					 <label>2차 분류</label>
					 <select class="category2" name="SC_CODE">
						<option value="">전체</option>
					</select>

					<!-- 상품 정보 등록 -->
					<table>
						<tr>
							<td><label for="SP_NAME">상품명</label></td> 
							<td><input type="text" id="SP_NAME" name="SP_NAME" /></td>
						</tr>
						
						<tr>
							<td><label for="SP_PRICE">상품가격</label></td> 
							<td><input type="text" id="SP_PRICE" name="SP_PRICE" /></td>
						</tr>

						<tr>
							<td><label for="SP_STOCK">상품수량</label> </td>
							<td><input type="text" id="SP_STOCK" name="SP_STOCK" /></td>
						</tr>
						
						<tr>
							<td><label for="SP_DES">상품소개</label></td>
							<td><textarea rows="5" cols="50" id="SP_DES" name="SP_DES"></textarea>
							<script>
								 var ckeditor_config = {
								   resize_enaleb : false,
								   enterMode : CKEDITOR.ENTER_BR,
								   shiftEnterMode : CKEDITOR.ENTER_P,
								   filebrowserUploadUrl : "./ckUpload"
								 };
								 
								 CKEDITOR.replace("SP_DES", ckeditor_config);
								</script>
							</td>
						</tr>
						
						<tr>
							<td><label for="SP_IMG">이미지</label></td>
							<td><input type="file" id="SP_IMG" name="file"/>
							<div class="select_img"><img src=""/></div>
							<script>
								$("#SP_IMG").change(function(){
									if(this.files && this.files[0]){
										var reader = new FileReader;
										reader.onload = function(data){
											$(".select_img img").attr("src", data.target.result).width(500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});							
							</script>
							<%=request.getRealPath("/") %>
							</td>
						</tr>
						
						<tr align = "center">
							<td colspan="2"><button type="submit" id="register_Btn" class="btn btn-primary">등록</button></td> 
						</tr>
					</table>
				</form>
				<!-- 들어갈내용 끝 -->
	</div>
</div>
</div>

	<!-- footer start -->
	<jsp:include page="../templates/footer.jsp" flush="boolean"/>
	<!-- footer end -->

<!-- jquery 카테고리 분류 -->
<script>
	// 컨트롤러에서 데이터 호출
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);
	
	var cate1Arr = new Array();
	var cate1Obj = new Object();
	
	// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i=0;i<jsonData.length;i++){
		if(jsonData[i].level == "1"){
			cate1Obj = new Object(); // 객체초기화 자바 객체 초기화랑 같음
			cate1Obj.SC_CODE = jsonData[i].SC_CODE;
			cate1Obj.SC_NAME = jsonData[i].SC_NAME;
			cate1Arr.push(cate1Obj);
		}
	}
	
	// 1차 분류 셀렉트 박스에 데이터 삽입
	var cate1Select = $("select.category1");
	
	for(var i=0; i<cate1Arr.length; i++){
		cate1Select.append("<option value='" + cate1Arr[i].SC_CODE + "'>" + cate1Arr[i].SC_NAME + "</option>" );
	}
	
	// 2차 분류 작업
	$(document).on("change","select.category1",function(){
		
		var cate2Arr = new Array();
		var cate2Obj = new Object();
		
		// 2차 분류 셀렉트 박스에 삽입할 데이터
		for(var i=0;i<jsonData.length;i++){
			if(jsonData[i].level == "2"){
				cate2Obj = new Object(); // 객체초기화 자바 객체 초기화랑 같음
				cate2Obj.SC_CODE = jsonData[i].SC_CODE;
				cate2Obj.SC_NAME = jsonData[i].SC_NAME;
				cate2Obj.SC_CODEREF = jsonData[i].SC_CODEREF;
				
				cate2Arr.push(cate2Obj);
			}
		}
		
		var cate2Select = $("select.category2");
		
/* 		for(var i=0; i<cate2Arr.length; i++){
			cate2Select.append("<option value='" + cate2Arr[i].SC_CODE + "'>" + cate2Arr[i].SC_NAME + "</option>" );
		} */
		
		cate2Select.children().remove();
		
		$("option:selected", this).each(function(){
			
			var selectVal = $(this).val();
			
			cate2Select.append("<option value='"+selectVal+"'>전체</option>");
			
			for(var i=0; i<cate2Arr.length; i++){
				if(selectVal == cate2Arr[i].SC_CODEREF){
					cate2Select.append("<option value='" + cate2Arr[i].SC_CODE + "'>" + cate2Arr[i].SC_NAME + "</option>" );
				}
			} 
			
		});
		
	});
</script>

  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  
  <!-- 숫자가아닌 다른값을 입력하면 지워짐 -->
<script>
var regExp = /[^0-9]/gi;

$("#SP_PRICE").keyup(function(){ numCheck($(this)); });
$("#SP_STOCK").keyup(function(){ numCheck($(this)); });

function numCheck(selector) {
 var tempVal = selector.val();
 selector.val(tempVal.replace(regExp, ""));
}
</script>
</body>
</html>
