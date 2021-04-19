<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
    
      <!--  좌측 로고 화면 시작 -->
      <a class="navbar-brand" href="./main">Online Shop</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!--  좌측 로고 화면 끝 -->
      
      <!-- 네브바 우측 시작 -->
      <div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
				
					<!-- 메인 -->
					<li class="nav-item"><a class="nav-link" href="./main">메인
							<span class="sr-only">(current)</span>
					</a></li>
					<!-- 메인 끝 -->
					
					<!-- 비로그인 시 로그인창이 뜨도록(장바구니) -->
					<c:if test="${mid ne 'admin' }">
						<li class="nav-item">
							<a class="nav-link" href="./cartList">Cart</a>
						</li>					
					</c:if>					

					<!-- 장바구니 끝 -->
					
					<!-- 로그인  or  비로그인 -->
					<c:choose>
						<c:when test="${mid eq null }">
							<li class="nav-item"><a class="nav-link" href="./loginView">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="./joinView">회원가입</a></li>
						</c:when>
						
						<c:otherwise>
						<li class="nav-item dropdown active">
							<!-- 드롭다운 메뉴--> 
							<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">${mid }</a>
							<div class="dropdown-menu">
							<c:choose>
								<c:when test="${mid eq 'admin' }">
									<a class="dropdown-item" href="./admin">괸리자 페이지</a>
									<a class="dropdown-item" href="./main">메인 페이지</a> 
									<a class="dropdown-item" href="./logout">로그아웃</a>
								</c:when>
								
								<c:when test="${mid ne null }">
									<a class="dropdown-item" href="./memberInfo?uid=${mid}">My Page</a> 
									<a class="dropdown-item" href="./logout">로그아웃</a>								
								</c:when>
							</c:choose>
							</div>
						</li>
						</c:otherwise>
					</c:choose>
					<!-- 로그인 or 비로그인 끝 -->
					
					<!-- 게시판 네브 -->
					<li>
						<a class="nav-link" href="./boardlist">게시판</a>
					</li>
					<!-- 게시판 네브 -->
				</ul>
		</div>
		<!-- 네브바 우측 끝 -->
    </div>
  </nav>