<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="정기구독" />
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
      <li><a href="${pageContext.request.contextPath}/servey/serveyResult.do">설문결과확인</a></li>
      <li><h3>나의 쇼핑정보</h3></li>
      <hr />
      <li><a href="">주문 / 배송내역</a></li>
      <li><a href="#">최소 / 환불내역</a></li>
      <li><a href="#">교환 / 반품내역</a></li>
      <li><h3>나의 활동</h3></li>
      <hr />
      <li><a href="#">정기구독</a></li>
      <li><a href="${pageContext.request.contextPath}/notice/noticeList.do">1:1문의</a></li>
      <li><a href="#">상품 리뷰</a></li>
      <li><a href="#">상품 문의</a></li>
    </ul>
  </div>

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <h3><sec:authentication property="principal.name"/> 페이지</h3>
    </div>
	<div class="main">
	 	<h3>정기구독 내역</h3>
	 	<span>정기구독 내역이 없습니다.</span>
	</div>    
  </div>
 
</div>
	

<script>
	
</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>