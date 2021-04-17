<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="./main">Online Shop</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="./main">메인
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item">
						<c:if test="${member != null}"><a class="nav-link" href="./loginView">Cart</a></c:if>
					<li class="nav-item">
						<c:if test="${member != null}"><a class="nav-link" href="./logout">로그아웃</a></c:if>
						<c:if test="${member == null}"><a class="nav-link" href="./loginView">로그인</a></c:if>
					</li>
					
					<li class="nav-item">
						<c:if test="${member != null}"><a class="nav-link" href="./loginView">My Page</a></c:if>
						<c:if test="${member == null}"><a class="nav-link" href="./joinView">회원가입</a></c:if>
					</li>
				</ul>
			</div>
    </div>
  </nav>