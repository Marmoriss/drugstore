﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="설문결과페이지" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/servey/serveyResult.css" />

<div>
	<div id="main">
		<div id="bmi">
			<div id="bmi__header">
				<div id="header__title">
					<div>
						<h4><sec:authentication property="principal.name"/>님의 건강설문 결과표</h4>
						<span>성별 : ${servey.gender eq 'M' ? '남' : '여'}</span>
						<span>BMI : ${bmi}</span>
					</div>
				</div>
				
				<div class="header__content">
					<c:choose>
					<c:when test="${bmi < 18.5}">
						<div class="bmi__result">
							<i class="fa-solid fa-thumbs-down"></i>
							<span>저체중</span>
						 </div>
					</c:when>
					<c:when test="${bmi >= 18.5 and bmi < 23}">
					<div class="bmi__result">
						<i class="fa-solid fa-thumbs-up"></i>
						<span>정상</span>
					</div>
					</c:when>
					<c:when test="${bmi >= 23 and bmi < 25}">
						<div class="bmi__result">
						<i class="fa-solid fa-thumbs-up"></i>
						<span>과체중</span>
						</div>						
					</c:when>
					<c:when test="${bmi >= 25 }">
						<div class="bmi__result">
						<i class="fa-solid fa-thumbs-down"></i>
						<span>비만</span>
						</div>
					</c:when>
					</c:choose>
				</div>
			</div>
			<div id="bmi__main">
			</div>
			<div id="bmi__result">
				<div id="product">
					<button name="serveyProduct" id="serveyProduct" value="${servey.body}">상품 보기</button>
				</div>
			</div>
		</div>
		
	</div>
</div>
<script>


</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>