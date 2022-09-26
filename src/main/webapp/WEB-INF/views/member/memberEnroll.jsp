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
				<th></th>
				<td><h3>회원가입</h3></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<div id="memberId-container">
			            <input type="text" class="form-control" placeholder="아이디(4글자이상)" name="memberId" id="memberId" required>
			        </div>
			        <div id="memberId-alert">
			            <span class="guide ok" style="display: none">이 아이디는 사용가능합니다.</span>
			            <span class="guide error" style="display: none">이 아이디는 사용할 수 없습니다.</span>
			            <input type="hidden" id="idValid" value="0"/><!-- 사용불가한 아이디 0, 사용가능한 아이디 1 -->
			        </div>
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" class="form-control" name="password" id="password" placeholder="영문,특수문자,숫자 포함 8자 이상" value="" required>
				</td>
			</tr>
			<tr>
				<th>패스워드확인</th>
				<td>	
					<input type="password" class="form-control" id="passwordCheck" name="passwordCheck" value="" required>
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
					<input type="tel" class="form-control" placeholder="(-없이)01012345678" name="phone" id="phone" oninput="autoHyphen2(this)" maxlength="13" value="" required>
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
			<tr>
				<th></th>
				<td>
					<button type="submit" class="btn btn-success">가입</button>
					<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
				</td>
			</tr>
		</table>
	</form:form>
</div>
<script>

const password = document.querySelector("#password");
const passwordCheck = document.querySelector("#passwordCheck");
const memberId = document.querySelector("#memberId");
const regexPw = /^[A-Za-z0-9`~!@#\$%\^&\*\(\)\{\}\[\]\-_=\+\\|;:'"<>,\./\?]{8,20}$/;
const phone = document.querySelector("#phone");
const phoneCheck = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;

document.memberEnrollFrm.addEventListener('submit', (e) => {
	
	if(idValid.value === "0"){
		e.preventDefault();
		alert("유효한 아이디를 입력해주세요.");
		return;
	}
	
	if(password.value != passwordCheck.value){
		e.preventDefault();
		alert("비밀번호가 일치하지 않습니다.");
		passwordCheck.select();
		return;
	}
	
   if(!regexPw.test(password.value)) {
  		e.preventDefault();
  		alert("8~20자 영문 대소문자, 숫자, 특수문자를 사용하세요.");
  		password.focus();
    	return;
   }
	
   if(!phoneCheck.test(phone.value)){
	   e.preventDefault();
 		alert("올바른 전화번호 형식을 입력하세요.");
 		phone.focus();
   		return ;
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
		dataType : "JSON",
		data : {memberId},
		success(response){
			console.log(response); // js object
			
			
			const {available} = response;
			
			console.log(available);
			if(!available){
				error.style.display = "inline";
				ok.style.display = "none";
				idValid.value = "0";
			}
			if(available){
				error.style.display = "none";
				ok.style.display = "inline";
				idValid.value = "1";
			}
			
		},
		error(jqxhr, statusText, err){
			console.log(jqxhr, statusText, err);
		}
	});

});

/**
 * 휴대전화 유효성
 */
const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
</script>

</body>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>