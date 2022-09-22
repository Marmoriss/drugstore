﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="마이페이지" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberMyPage.css" />
<body>	
	
	<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li><h3>마이페이지</h3></li>
      <li><a href="${pageContext.request.contextPath}/member/updateMember.do">회원정보수정</a></li>
      <li><a href="" id="servey">설문결과확인</a></li>
      <li><h3>나의 쇼핑정보</h3></li>
      <hr />
      <li><a href="${pageContext.request.contextPath}/member/memberOrder.do">주문 / 배송내역</a></li>
      <li><a href="#">최소 / 환불내역</a></li>
      <li><a href="#">교환 / 반품내역</a></li>
      <li><h3>나의 활동</h3></li>
      <hr />
      <li><a href="${pageContext.request.contextPath}/member/memberSubscription.do">정기구독</a></li>
      <li><a href="${pageContext.request.contextPath}/notice/noticeList.do">1:1문의</a></li>
      <li><a href="#">상품 리뷰</a></li>
      <li><a href="#">상품 문의</a></li>
    </ul>
  </div>
	
  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <h3>마이 쇼핑</h3>
    </div>
    <div class="main">
    	<div id="orderStatus">
    		<div>
    			<h4>찜한 상품</h4>
    			<h4>0</h4>
    		</div>
    		<div>
    			<h4>구매한 상품</h4>
    			<h4>0</h4>
    		</div>
    		<div>
    			<h4>배송중인 상품</h4>
    			<h4>0</h4>
    		</div>
    	</div>
    </div>
  </div>
 	
</div>
	

<script>
const headers = {};
headers['${_csrf.headerName}'] = '${_csrf.token}';
const servey = document.querySelector("#servey");
/**
 * 설문 결과가 없으면 설문조사 페이지로 이동, 설문 결과가 있으면 설문 결과 페이지로 이동 
 */
window.onload = () => {
		$.ajax({
			url : "${pageContext.request.contextPath}/servey/serveyCheck.do",
			method : "POST",
			dataType :"json",
			headers,
			success(response){
				console.log(response);
				const {available} = response;
				if(!available){
						$("#servey").attr("href", "${pageContext.request.contextPath}/servey/servey.do");
				}else{
						$("#servey").attr("href", "${pageContext.request.contextPath}/servey/serveyResult.do");
				}
			},
			error : console.log
		})
	}
</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>