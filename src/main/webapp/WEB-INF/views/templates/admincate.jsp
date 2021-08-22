<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

</style>

<div class="col-lg-3">

	<h1 class="my-4">Admin cate</h1>
	
	<ul class="navbar-nav list-group">
		
		<!-- 카테고리 1 -->
		<li class="nav-item">
			<a class="list-group-item" href="./adminmemberlist">회원목록</a> 
		</li>
		
		<!-- 카테고리 2 -->		
		<li class="nav-item dropdown">
			<a class="dropdown-toggle list-group-item" href="#" data-toggle="dropdown">상품관리</a>
				<div class="dropdown-menu">
 					<a class="dropdown-item" href="./adminproductadd">상품등록</a>
					<a class="dropdown-item" href="./adminproductlist">상품목록</a> 
				</div>
		</li>
		
		<!-- 카테고리 3 -->
		<li class="nav-item">
			<a class="list-group-item" href="./adminorderList">주문목록</a>
		</li>
		
		<!-- 카테고리 4 -->		
		<li class="nav-item">
			<a class="list-group-item" href="./allReply">상품소감</a>
		</li>
		
		<!-- 카테고리 5 -->		
		<li class="nav-item">
			<a class="list-group-item" href="#">매출관리</a>
		</li>
							
					
	
	</ul>
</div>