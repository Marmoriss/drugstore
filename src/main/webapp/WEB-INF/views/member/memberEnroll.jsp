<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="회원가입" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberEnroll.css" />

<body>
	<div id="enroll-container" class="mx-auto text-center">
	<form:form name="memberEnrollFrm" action="" method="POST">
		<table class="mx-auto">
			<tr>
				<th>아이디</th>
				<td>
					<div id="memberId-container">
			            <input type="text" class="form-control" placeholder="아이디(4글자이상)" name="memberId" id="memberId" required>
			            <span class="guide ok">이 아이디는 사용가능합니다.</span>
			            <span class="guide error">이 아이디는 사용할 수 없습니다.</span>
			            <input type="hidden" id="idValid" value="0"/><!-- 사용불가한 아이디 0, 사용가능한 아이디 1 -->
			        </div>
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" class="form-control" name="password" id="password" value="" required>
				</td>
			</tr>
			<tr>
				<th>패스워드확인</th>
				<td>	
					<input type="password" class="form-control" id="passwordCheck" value="" required>
				</td>
			</tr>  
			<tr>
				<th>이름</th>
				<td>	
					<input type="text" class="form-control" name="name" id="name" value="" required>
				</td>
			</tr>
			
			<tr>
				<th>휴대폰</th>
				<td>	
					<input type="tel" class="form-control" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" value="" required>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>	
					<input type="text" class="form-control" placeholder="" name="address" id="address" value="">
				</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td>	
					<input type="text" class="form-control" placeholder="" name="detailAddress" id="detailAddress" value="">
				</td>
			</tr>
			
		</table>
		<button type="submit" class="btn btn-success">가입</button>
		<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
	</form:form>
</div>
<script>


document.memberEnrollFrm.addEventListener('submit', (e) => {
	if(idValid.value === "0"){
		e.preventDefault();
		alert("유효한 아이디를 입력해주세요.");
		return;
	}
}); 

const ok = document.querySelector(".guide.ok");
const error = document.querySelector(".guide.error");
const idValid = document.querySelector("#idValid");

document.querySelector("#memberId").addEventListener('keyup', (e) => {
	const {value : memberId} = e.target;
	console.log(memberId);	
	
	if(memberId.length < 4){
		idValid.value = "0";
		error.style.display = "none";
		ok.style.display = "none";
		return;
	}
	
	const headers = {};
	headers['${_csrf.headerName}'] = '${_csrf.token}';
	console.log(headers);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
		method : "POST",
		headers,
		data : {memberId},
		success(response){
			console.log(response); // js object
			
			const {available} = response;
			if(available){
				error.style.display = "none";
				ok.style.display = "inline";
				idValid.value = "1";
			}
			else {
				error.style.display = "inline";
				ok.style.display = "none";
				idValid.value = "0";
			}
			
		},
		error(jqxhr, statusText, err){
			console.log(jqxhr, statusText, err);
		}
	});

});

</script>

</body>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>