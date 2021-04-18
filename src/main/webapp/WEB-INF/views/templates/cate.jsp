<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

</style>

<div class="col-lg-3">

	<h1 class="my-4">Shop Name</h1>
	
	<ul class="navbar-nav list-group">
	
		<li class="nav-item dropdown">
		<!-- 카테고리 1 -->
			<a class="dropdown-toggle list-group-item" href="#" data-toggle="dropdown">
				상의</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="./productlist?cate=101&lev=2">티셔츠</a> 
					<a class="dropdown-item" href="./productlist?cate=102&lev=2">아우터</a> 
				</div>
		</li>
		
		<li class="nav-item dropdown">
		<!-- 카테고리 2 -->
			<a class="dropdown-toggle list-group-item" href="#" data-toggle="dropdown">
				하의</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="./productlist?cate=201&lev=2">와이드</a> 
					<a class="dropdown-item" href="./productlist?cate=202&lev=2">슬렉스</a> 
				</div>
		</li>
		
		<li class="nav-item">
			<!-- 카테고리 3 -->
			<a href="./productlist?cate=300&lev=1" class="list-group-item">액세서리</a>
		</li>
	</ul>
</div>