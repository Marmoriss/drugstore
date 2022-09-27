<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- 카테고리 박스 안의 글꼴 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Noto+Sans+KR&display=swap" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>

<!-- 헤더영역 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="카테고리별 목록" name="title"/>
</jsp:include>

<style>
.container {
	padding-top: 350px;
}

.carousel-inner > .carousel-item > img {
    /* width: 640px;
    height: 720px; */
    
}
</style>

<body>
  <script>
    $('.carousel').carousel({
      interval: 2000 //기본 5초
    })
  </script>
<div class="container">
  <div id="demo" class="carousel slide" data-ride="carousel">

    <div class="carousel-inner">
      <!-- 슬라이드 쇼 -->
	      <div class="carousel-item active">
	        <!--가로-->
	        <img class="d-block w-100" 
	          src="${pageContext.request.contextPath}/resources/images/product-img-slide1.jpg"
	          alt="First slide">
	          <div class="carousel-caption d-none d-md-block">
	              <h2>면역을 위한 맞춤형 선택</h2>
	              <p>하루에 하나씩 에너지 충전</p>
	        </div>
	      </div>
	      <div class="carousel-item">
	        <img class="d-block w-100"
	          src="${pageContext.request.contextPath}/resources/images/product-img-slide2.jpg"
	          alt="Second slide">
	      </div>
	      <div class="carousel-item">
	        <img class="d-block w-100"
	          src="${pageContext.request.contextPath}/resources/images/product-img-slide3.jpg"
	          alt="Third slide">
	      </div> 
	</div>
    <!-- / 슬라이드 쇼 끝 -->

    <!-- 왼쪽 오른쪽 화살표 버튼 -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <!-- <span>Previous</span> -->
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <!-- <span>Next</span> -->
    </a>
    <!-- / 화살표 버튼 끝 -->
    
    <!-- 인디케이터 -->
    <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작-->
      <li data-target="#demo" data-slide-to="1"></li>
      <li data-target="#demo" data-slide-to="2"></li>
    </ul>
    <!-- 인디케이터 끝 -->
  </div>
</div>
