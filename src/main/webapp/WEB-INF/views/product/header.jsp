<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title}</title>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- bootstrap js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자 작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product/header.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/header.css"/>

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/34c760bbb4.js" crossorigin="anonymous"></script>

<!-- alert 띄우기 -->
<c:if test="${not empty msg}">
<script>
	alert("${msg}");
</script>
</c:if>

<script>
	$(function() {
	    $('body').addClass('js');
	  
	    var $hamburger = $('.hamburger'),
	        $nav = $('#site-nav'),
	        $masthead = $('#masthead');
	  
	    $hamburger.click(function() {
	      $(this).toggleClass('is-active');
	      $nav.toggleClass('is-active');
	      $masthead.toggleClass('is-active');
	      return false; 
	    })
	});
</script>
</head>
<body>

<header>
	<div id="header-container">
		<!-- 띠 배너 -->
		<div class="header-line">
			<a href="#">
				<p class="header-line-text">건강설문 참여하고 톡톡 맞춤 영양제를 찾아보자!</p>
			</a>
		</div>
		<!-- 상단 메뉴 -->
		<div class="wrap_inner relative header-nav-inner">
			<div class="nav header-nav-list-wrap">
				<ul class="header-nav-list">
					<li class="header-nav-item"><a href="${pageContext.request.contextPath}/servey/servey.do" class="header-nav-text">건강설문</a></li>
					<li class="header-nav-item"><a href="" class="header-nav-text">정기구독</a></li>
					<li class="header-nav-item"><a class="header-nav-text" href="${pageContext.request.contextPath}/notice/noticeList.do">고객센터</a></li>
					
					<sec:authorize access="isAnonymous()">
					<li class="header-nav-item"><a href="${pageContext.request.contextPath}/member/memberLogin.do" class="header-nav-text">로그인</a></li>
					</sec:authorize>					
					<sec:authorize access="isAuthenticated()">
							<%-- <sec:authentication property="principal.username"/> --%>
							<%-- <sec:authentication property="authorities"/> --%>
						<li class="header-nav-item" name="logoutLink"><a href="#" class="header-nav-text" >로그아웃</a></li>
						
						<form action="${pageContext.request.contextPath}/member/memberLogout.do" method="POST" id="logoutFrm">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
						<script>
							window.onload = function(){
								document.querySelector("[name=logoutLink]").addEventListener('click',(e)=>{
								const frm = document.querySelector("#logoutFrm");
								console.log(frm);
								frm.submit();
							})		
							}
						</script>					
					</sec:authorize>
				</ul>
			</div>
		</div>
		<!-- 로고 -->
		<div class="header-logo">
			<a href="/" class="header-logo-link">
				<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo" class="header-logo-img"/>
			</a>
		</div>
		<!-- 카테고리 -->
		<div class="hero">
		    <header id="masthead" role="banner">
		      <div class="container">
		        <button class="hamburger hamburger--boring" type="button">
		          <span class="hamburger-box">
		            <span class="hamburger-inner"></span>
		          </span>
		          <span class="hamburger-label">전체 카테고리</span>
		        </button>
		      <form id="masthead-search">
		      <input type="search" name="s" aria-labelledby="search-label" placeholder="Search&hellip;" class="draw">
		        <button type="submit">&rarr;</button>
		        </form>        
		        <nav id="site-nav" role="navigation">
		          <div class="col">
		            <h4>성분</h4>
		            <ul>
		              <li><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350005">비타민</a></li>
		              <li><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350006">철분</a></li>
		              <li><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350007">오메가3</a></li>
		              <li><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350008">칼슘</a></li>
		              <li><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350009">콜라겐</a></li>
		            </ul>            
		          </div>
		          <div class="col">
		            <h4>성별</h4>
		            <ul>
		              <li><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350010">여성</a></li>
		              <li><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350011">남성</a></li>
		            </ul> 
		          </div>
		          <div class="col">
		            <h4>신체</h4>
		            <ul>
		              <li><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350012">눈</a></li>
		              <li><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350013">소화기관</a></li>
		              <li><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350014">피로감</a></li>
		              <li><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350015">면역</a></li>
		              <li><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350016">심혈관계</a></li>
		            </ul>             
		          </div>
		      </nav>
		    </div>
		  </header>
		</div>

				<!-- 호버시 보일 메뉴 작성 -->
				
				<!-- 검색창, 장바구니, 마이페이지 -->
				<div class="header-bottom-right relative">
					<form action="" class="header-search" name="topSearchFrm" id="topSearchFrm">
						<input type="text" name="search-text" class="header-search-input" placeholder="[NEW] 비타톡톡 100정" />
						<button type="submit" class="header-search-submit"><i class="fa-solid fa-magnifying-glass"></i></button>
					</form>
					<div class="header-cart">
						<a href="${pageContext.request.contextPath}/cart/cartList.do" class="header-cart-link hand"><i class="fa-solid fa-cart-shopping"></i></a>
						<p class="header-cart-count hand">0</p>
						<!-- 호버시 장바구니 내역 보이게 작성 -->
					</div>
					<a href="${pageContext.request.contextPath}/member/memberMyPage.do" class="header-mypage"><i class="fa-solid fa-user"></i></a>
				</div>
			</div>
		</div>
	</div>
</header>

























