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
		<form:form action="${pageContext.request.contextPath}/servey/symptomEnroll.do" method="post" name="symptomEnrollFrm">
	 	<section id="main" class="mx-auto">
	 		<div>
		 		<h3>내 건강을 알려줘!</h3>
		 		<span>몇 가지 질문에 답하고 나에게 필요한 영양성분을 알아보세요</span>
		 		<br />
		 		<div class="btn-wrapper">
			 		<span class="btn btn-success next" id="start">시작</span>
		 		</div>
		 		
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
					<div class="btn-wrapper">
						<span class="btn btn-success next" onclick="next(0)">다음</span>
					</div>
				</div>
				<div style="display: none" class="mx-auto">
					<h3>불편하시거나 걱정되는 부분을 선택해주세요</h3>
						<label><input type="radio" name="body" value="혈액"/>혈관</label>
						<label><input type="radio" name="body" value="장"/>소화</label>
						<label><input type="radio" name="body" value="눈"/>눈</label>
						<label><input type="radio" name="body" value="피로"/>피로감</label>
						<label><input type="radio" name="body" value="면역"/>면역</label>
						<br />
						<div class="btn-wrapper">
							<span onclick="prev(1)" class="btn btn-light prev" >이전</span>
							<span onclick="nextSymptom(1)" class="btn btn-success next">다음</span>
						</div>					
				</div>
				<div style="display:none" class="mx-auto" id="symptomQ">
					
				</div>
				<div style="display: none" class="mx-auto">
					<h3>키를 적어주세요</h3>
					<input type="number" placeholder="키(cm)" name="height" min="100" max="200" required="required"/>
					<br />
					<div class="btn-wrapper">
						<span onclick="prev(3)" class="btn btn-light prev" >이전</span>
						<span onclick="next(3)" class="btn btn-success next" >다음</span>
					</div>
				</div>
				<div style="display: none" class="mx-auto">
					<h3>몸무게를 적어주세요</h3>
					<input type="number" placeholder="몸무게(kg)" name="weight" min="30" max="200" required/>
					<br />
					<div class="btn-wrapper">
						<span onclick="prev(4)" class="btn btn-light prev" >이전</span>
						<button class="btn btn-primary next">제출</button>				
					</div>
				</div>
			</div>
	 	</section>
	 	</form:form>
	</div>
</div>
<script>
	const main = document.querySelector("#main");
	const qna = document.querySelector("#qna");
	const list = document.querySelectorAll(".qBox .mx-auto");
	const symptomDiv = document.querySelector("#symptomQ");
	const headers = {};
	headers['${_csrf.headerName}'] = '${_csrf.token}';
	
	document.querySelector("#start").addEventListener('click',(e)=>{
		$.ajax({
			url : "${pageContext.request.contextPath}/servey/serveyCheck.do",
			method : "POST",
			dataType : "JSON",
			headers,
			success(data){
				console.log(data);
				const {available} = data;
				if(available){
					alert("이미 건강 설문에 참여하셨습니다.");
					e.preventDefault();
					location.href = "${pageContext.request.contextPath}/servey/serveyResult.do";
					return;
				}else{
					main.style.WebkitAnimation = "fadeOut 1s";
					main.style.animation = "fadeOut 1s";
					setTimeout(()=>{
						list[0].style.WebkitAnimation = "fadeIn 1s";
						list[0].style.animation = "fadeIn 1s";
						setTimeout(()=>{
							main.style.display = "none";
							list[0].style.display="block";				
						},450)
					},450)
				}
			},
			error : console.log
		})
		
		
		
		
	})
	
	function next(cnt){
		list[cnt].style.display ="none";
		list[cnt+1].style.display="block";	
	}
	
	function prev(cnt){
		list[cnt-1].style.display = "block";
		list[cnt].style.display = "none";
	}
	
	function nextSymptom(cnt){
		const symptom = document.querySelector("[name=body]:checked").value;
		console.log(symptom);
		next(cnt);
		switch(symptom){
		case "혈액" : symptomDiv.innerHTML = ` <h3>세부 증상을 선택하세요</h3> 
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="상처가 생기면 잘 아물지 않아요" id="op1"/>
											<label for="op1" class="form-check-label">상처가 생기면 잘 아물지 않아요</label>
											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="손끝 또는 발끝이 자주 저려요"  id="op2"/>
											<label for="op2" class="form-check-label">손끝 또는 발끝이 자주 저려요</label>
											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="충치가 생기고 잇몸이 자주 붓고 피가 나요" id="op3" />
											<label for="op3" class="form-check-label">충치가 생기고 잇몸이 자주 붓고 피가 나요</label>
											</div>
											<div class="btn-wrapper">
											<span onclick="prev(2)" class="btn btn-light prev" >이전</span>
											<span onclick="next(2)" class="btn btn-success next" >다음</span>
											</div>
											`;
											
											break;
		case "장" :symptomDiv.innerHTML = ` <h3>세부 증상을 선택하세요</h3> 
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="복통이나 속 쓰림이 자주 발생해요" id="op4"/>
											<label for="op4" class="form-check-label">복통이나 속 쓰림이 자주 발생해요</label>											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="변비가 있어요" id="op5"/>
											<label for="op5" class="form-check-label">변비가 있어요</label>
											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="설사와 같은 묽은 변을 자주 보는 편이에요" id="op6"/>
											<label for="op6" class="form-check-label">설사와 같은 묽은 변을 자주 보는 편이에요</label>
											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="배뇨 후 소변이 남아있는 느낌(잔뇨감)이 있어요" id="op7"/>
											<label for="op7" class="form-check-label">배뇨 후 소변이 남아있는 느낌(잔뇨감)이 있어요</label>
											</div>
											<div class="btn-wrapper">
												<span onclick="prev(2)" class="btn btn-light prev" >이전</span>
												<span onclick="next(2)" class="btn btn-success next" >다음</span>
											</div>
											`;
			
											break;
		case "눈" : symptomDiv.innerHTML = ` <h3>세부 증상을 선택하세요</h3>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="눈이 건조하여 뻑뻑하고 가려움을 느껴요" id="op8"/>
											<label for="op8" class="form-check-label">눈이 건조하여 뻑뻑하고 가려움을 느껴요</label>
											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="눈 주변이 떨리는 현상이 있어요" id="op9"/>
											<label for="op9" class="form-check-label">눈 주변이 떨리는 현상이 있어요</label>
											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="핸드폰이나 컴퓨터를 본 후에 시야가 흐릿하게 느껴져요" id="op10"/>
											<label for="op10" class="form-check-label">핸드폰이나 컴퓨터를 본 후에 시야가 흐릿하게 느껴져요</label>
											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="어두워지면 시력이 저하되요" id="op11"/>
											<label for="op11" class="form-check-label">어두워지면 시력이 저하되요</label>
											</div>
											<div class="btn-wrapper">
											<span onclick="prev(2)" class="btn btn-light prev" >이전</span>
											<span onclick="next(2)" class="btn btn-success next" >다음</span>
											</div>
											`;
								
											break;
		case "피로" : symptomDiv.innerHTML = ` <h3>세부 증상을 선택하세요</h3> 										
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="무기력하고 식욕이 없어요" id="op12"/>
											<label for="op12" class="form-check-label">무기력하고 식욕이 없어요</label>
											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="자고 일어나도 아침부터 피곤해요" id="op13" />
											<label for="op13" class="form-check-label">자고 일어나도 아침부터 피곤해요</label>
											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="신경이 예민하고 잠을 이루기 힘들어요" id="op14"/>
											<label for="op14" class="form-check-label">신경이 예민하고 잠을 이루기 힘들어요</label>
											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="잠을 자다가 소변을 보기 위해 잠을 깨는 경우가 잦아요" id="op15"/>
											<label for="op15" class="form-check-label">잠을 자다가 소변을 보기 위해 잠을 깨는 경우가 잦아요</label>
											</div>
											<div class="btn-wrapper">
											<span onclick="prev(2)" class="btn btn-light prev" >이전</span>
											<span onclick="next(2)" class="btn btn-success next" >다음</span>
											</div>
											`;
								
											break;
		case "면역" : symptomDiv.innerHTML = ` <h3>세부 증상을 선택하세요</h3> 
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="스트레스가 매우 많아요" id="op16"/>
											<label for="op16" class="form-check-label">스트레스가 매우 많아요</label>
											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="아토피 또는 비염 알레르기 질환이 있어요" id="op17"/>
											<label for="op17" class="form-check-label">아토피 또는 비염 알레르기 질환이 있어요</label>
											</div>
											<div class="form-check">
											<input type="checkbox" class="form-check-input" name="symptom" value="감기와 같은 감염성 질환에 자주 걸려요" id="op18"/>
											<label for="op18" class="form-check-label">감기와 같은 감염성 질환에 자주 걸려요</label>
											</div>
											<div class="btn-wrapper">
											<span onclick="prev(2)" class="btn btn-light prev" >이전</span>
											<span onclick="next(2)" class="btn btn-success next" >다음</span>
											</div>
											`;
								
											break;
		}
	}
	
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>