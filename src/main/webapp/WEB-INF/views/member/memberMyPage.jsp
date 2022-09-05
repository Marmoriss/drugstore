<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<div id="total-container">
		<div id="left-container">
			<ul>
				<li>마이페이지</li>
				<li><a href="${pageContext.request.contextPath}/member/updateMember.do">회원 정보 수정</a></li>
				
			</ul>
			<ul>
				<li>나의 쇼핑정보</li>
				<li>주문 / 배송내역</li>
				<li>취소 / 환불내역</li>
				<li>교환 / 반품내역</li>
				<li>찜한 상품</li>
			</ul>
			<ul>
				<li>나의 활동</li>
				<li>정기 구독</li>
				<li>1:1 문의</li>
				<li>상품 문의</li>
			</ul>
		</div>
		<div id="right-container">
			<div id="user-info">
				<!-- principal은 memeber랑 같다 -->
				<span><sec:authentication property="principal.name"/>님 환영합니다.</span>
			</div>
			<div id="main-container">
				<span>block</span>
			</div>
		</div>
	</div>
</body>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>