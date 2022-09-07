﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="건강설문" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/servey/servey.css" />

<div class="body">
	<div id="container">
		<form action="" method="post">
	 	<section id="main" class="mx-auto">
	 		<div>
		 		<h3>내 건강을 알려줘!</h3>
		 		<span>몇 가지 질문에 답하고 나에게 필요한 영양성분을 알아보세요</span>
		 		<br />
		 		<span class="btn btn-success" onclick="begin(0)">시작</span>
	 		</div>
	 	</section>
	 	<section id="qna" >
			<div class="qBox" >
				<div style="display: none" class="mx-auto">
					<h3>
						<sec:authentication property="principal.name"/>님의 성별을 알려주세요.
					</h3>
					<label><input type="radio" name="gender" value="M" required />남</label>
					<label><input type="radio" name="gender" value="F"/>여</label>
					<br />
					<span class="btn btn-success" onclick="next(0)">다음</span>
				</div>
				<div style="display: none" class="mx-auto">
					<h3>불편하시거나 걱정되는 부분을 선택해주세요</h3>
						<label><input type="radio" name="health" value="a"  required/>혈관</label>
						<label><input type="radio" name="health" value="b"/>소화</label>
						<label><input type="radio" name="health" value="c"/>눈</label>
						<label><input type="radio" name="health" value="d"/>피로감</label>
						<label><input type="radio" name="health" value="e"/>면역</label>
						<br />
						<span onclick="prev(1)" class="btn btn-light" >이전</span>
						<span onclick="next(1)" class="btn btn-success">다음</span>
				</div>
				<div style="display: none" class="mx-auto">
					<h3>키를 적어주세요</h3>
					<input type="number" placeholder="키(cm)" name="height" min="100" max="200" required="required"/>
					<br />
					<span onclick="prev(2)" class="btn btn-light" >이전</span>
					<span onclick="next(2)" class="btn btn-success" >다음</span>
				</div>
				<div style="display: none" class="mx-auto">
					<h3>몸무게를 적어주세요</h3>
					<input type="number" placeholder="몸무게(kg)" name="weight" min="30" max="200" required/>
					<br />
					<span onclick="prev(3)" class="btn btn-light" >이전</span>
					<button class="btn btn-primary">제출</button>				
				</div>
			</div>
	 	</section>
	 	</form>
	</div>
</div>
<script>
	const main = document.querySelector("#main");
	const qna = document.querySelector("#qna");
	const list = document.querySelectorAll(".qBox div");
	
	
	function begin(cnt){
		main.style.WebkitAnimation = "fadeOut 1s";
		main.style.animation = "fadeOut 1s";
		setTimeout(()=>{
			list[cnt].style.WebkitAnimation = "fadeIn 1s";
			list[cnt].style.animation = "fadeIn 1s";
			setTimeout(()=>{
				main.style.display = "none";
				list[cnt].style.display="block";				
			},450)
		},450)
	}
	
	function next(cnt){
		list[cnt].style.display ="none";
		list[cnt+1].style.display="block";	
	}
	
	function prev(cnt){
		list[cnt-1].style.display = "block";
		list[cnt].style.display = "none";
	}
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>