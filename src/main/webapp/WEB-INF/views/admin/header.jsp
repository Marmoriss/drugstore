<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- bootstrap js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자 작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/header.css"/>

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/34c760bbb4.js" crossorigin="anonymous"></script>

</head>
<body>

<div class="admin-wrap">
	<div class="admin-inner-wrap">
		<!-- 상단바 시작 -->
		<div>
			<nav class="navbar">
				<div class="navbar-header">
					<span class="admin-logo">DRUG STORE ADMIN PAGE</span>
				</div>
			</nav>
		</div>
		<!-- /상단바 끝 -->
		<!-- 좌측 네비 메뉴 시작 -->
		<div class="admin-side-nav">
			<div class="nav-left">
				<!-- 관리자 정보 시작 -->
				<div class="admin-profile text-center">
					<i class="fa-solid fa-user"></i>
					<span>[ADMIN 김감자]</span>
				</div>
				<!-- /관리자 정보 끝 -->
				<!-- 아코디언 메뉴 시작 -->
				<div class="accordion" id="accordionExample">
					<div class="card">
						<div class="card-header" id="headingOne">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-center" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								회원 관리
								</button>
							</h2>
						</div>
						<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
							<div class="card-body text-center"><a href="${pageContext.request.contextPath}/admin/user/userList.do">회원 조회</a></div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingTwo">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-center collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								상품 관리
								</button>
							</h2>
						</div>
						<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
							<div class="card-body text-center"><a href="${pageContext.request.contextPath}/admin/product/productEnroll.do">상품 등록</a></div>
							<div class="card-body text-center"><a href="${pageContext.request.contextPath}/admin/product/productList.do">상품 조회</a></div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingThree">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-center collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
								판매 관리
								</button>
							</h2>
						</div>
						<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
							<div class="card-body text-center"><a href="${pageContext.request.contextPath}/admin/orders/ordersList.do">주문&배송 관리</a></div>
							<div class="card-body text-center">취소 관리</div>
							<div class="card-body text-center">반품 관리</div>
							<div class="card-body text-center">환불 내역 조회</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingFour">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-center collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
								문의 / 리뷰 관리
								</button>
							</h2>
						</div>
						<div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
							<div class="card-body text-center"><a href="${pageContext.request.contextPath}/admin/">1:1 문의</a></div>
							<div class="card-body text-center"><a href="${pageContext.request.contextPath}/admin/faq/faqForm.do">FAQ</a></div>
							<div class="card-body text-center">리뷰</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingFive">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-center collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
								브랜드 관리
								</button>
							</h2>
						</div>
						<div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
							<div class="card-body text-center"><a href="${pageContext.request.contextPath}/admin/statis/enrollStatis.do">회원가입 수</a></div>
							<div class="card-body text-center"><a href="${pageContext.request.contextPath}/admin/statis/visitStatis.do">오늘/전체 방문자 수</a></div>
							<div class="card-body text-center">날짜별 수익 추이</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingSix">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-center collapsed" type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
								알림 / 메세지
								</button>
							</h2>
						</div>
						<div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordionExample">
							<div class="card-body text-center">1:1 채팅</div>
							<div class="card-body text-center">알림</div>
						</div>
					</div>
				</div>
				<!-- /아코디언 메뉴 끝 -->
			</div>
		</div>
		<!-- /좌측 네비 메뉴 끝 -->
		












