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
					<div id="header__title__word">
						<span>
							<sec:authentication property="principal.name"/>님의
							<br />
							 건강설문 결과표
						</span>
					</div>
					<div id="bmiImg">
						<div>
						<span style="margin-right: 104px">18.5</span><span style="margin-right: 101px">23.0</span><span style="margin-right: 76px">25.0</span>
						</div>
						<img src="${pageContext.request.contextPath}/resources/images/bmi-range.png" alt="" />
					</div>
				</div>
				
				<div class="header__content">
					<c:choose>
					<c:when test="${bmi < 18.5}">
						<div class="bmi__result">
							<i class="fa-solid fa-face-meh fa-4x"></i>
							<h3>저체중</h3>
							<span>성별 : ${servey.gender eq 'M' ? '남' : '여'}</span>
							<span>BMI : ${bmi}</span>
						 </div>
					</c:when>
					<c:when test="${bmi >= 18.5 and bmi < 23}">
					<div class="bmi__result">
						<i class="fa-regular fa-face-smile fa-4x" style="color:  Dodgerblue;"></i>
						<h3>정상</h3>
						<span>성별 : ${servey.gender eq 'M' ? '남' : '여'}</span>
						<span>BMI : ${bmi}</span>
					</div>
					</c:when>
					<c:when test="${bmi >= 23 and bmi < 25}">
						<div class="bmi__result">
						<i class="fa-solid fa-face-meh fa-4x"></i>
						<h3>과체중</h3>
						<span>성별 : ${servey.gender eq 'M' ? '남' : '여'}</span>
						<span>BMI : ${bmi}</span>
						</div>						
					</c:when>
					<c:when test="${bmi >= 25 }">
						<div class="bmi__result">
						<i class="fa-solid fa-face-tired fa-4x" style="color: red;"></i>
						<h3>비만</h3>
						<span>성별 : ${servey.gender eq 'M' ? '남' : '여'}</span>
						<span>BMI : ${bmi}</span>
						</div>
					</c:when>
					</c:choose>
				</div>
			</div>
			<div id="bmi__main">
			</div>
			<div id="bmi__result">
				<div id="product">
					
					<h3>${servey.body}이 좋지않은 당신을 위해 준비했어요</h3>
					<c:forEach items="${serveyProductList}" var="product">
						<div class="productInfo">
							
							<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="" />
							<a href="">
								<h4>${product.pname}</h4>
								<br />
								<p align="left">${product.mainFnctn}</p>
							</a>
						</div>
					</c:forEach>
						</div>
					<div>
						<button id="reServey" type="button" class="btn btn-danger">설문 다시하기</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
<script>
const headers = {};
headers['${_csrf.headerName}'] = '${_csrf.token}';
document.querySelector("#reServey").addEventListener('click',(e)=>{
	if(confirm("설문을 다시하시겠습니까?(기존 설문은 삭제됩니다.)")){
		$.ajax({
			url : "${pageContext.request.contextPath}/servey/serveyDel.do",
			method : "post",
			dataType : "json",
			headers,
			success(response){
				console.log(response);
			},
			error : console.log
		})			
		 location.href = "${pageContext.request.contextPath}/servey/servey.do"; 
	}
})
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>