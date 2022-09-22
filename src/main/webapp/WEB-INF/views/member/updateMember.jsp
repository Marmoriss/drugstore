<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="회원정보수정" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberEnroll.css" />

<body>
	<div id="enroll-container" class="mx-auto text-center">
	<form:form name="memberFrm" action="" method="POST">
		<table class="mx-auto">
			<tr>
				<th>아이디</th>
				<td>
		            <input type="text" class="form-control"  name="memberId" id="memberId" value='<sec:authentication property="principal.memberId"/>' readonly>				
			    </td>
			</tr>
			<tr>
				<th>현재 비밀번호</th>
				<td>
					<input type="password" class="form-control" name="password" id="password" value='' required>
				</td>
				<td id="pwCheck-btn">
					<button onclick="pwCheck();" value="0" id="btn-pwCheck" class="btn btn-primary">확인</button>
				</td>
			</tr>
			<tr>
				<th>변경할 비밀번호</th>
				<td>
					<input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="영문,특수문자,숫자 포함 8자 이상" value='' required>
				</td>
				<td id="eyes">
					<i class="fa-solid fa-eye"></i>
				</td>
			</tr>
			<tr>
				<th>변경할 비밀번호 체크</th>
				<td>
					<input type="password" class="form-control" name="newPasswordCheck" id="newPasswordCheck" value='' required>
				</td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td>	
					<input type="text" class="form-control" name="name" id="name" value='<sec:authentication property="principal.name"/>' required>
				</td>
			</tr>
			
		
			<tr>
				<th>휴대폰</th>
				<td>	
					<input type="tel" class="form-control"  name="phone" id="phone" oninput="autoHyphen2(this)" maxlength="13" value='' required>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>	
					<input type="text" class="form-control" placeholder="" name="address" id="address" value='<sec:authentication property="principal.address"/>'>
				</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td>	
					<input type="text" class="form-control" placeholder="" name="detailAddress" id="detailAddress" value="<sec:authentication property="principal.detailAddress"/>">
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button type="button" class="btn btn-outline-primary" onclick="updateMember();">수정</button>
					<button type="button" class="btn btn-outline-danger" onclick="deleteMember();">삭제</button>
					<button type="button" class="btn btn-outline-info" onclick="history.back();">취소</button>
					
				</td>
			</tr>
		</table>
	</form:form>
	<input type="hidden" name="rawPhone" id="rawPhone" value='<sec:authentication property="principal.phone"/>' />
</div>

<script>
const headers = {};
headers['${_csrf.headerName}'] = '${_csrf.token}';
const frm = document.memberFrm;
const pwCheckBtn = document.querySelector("#btn-pwCheck");
const newPassword = document.querySelector("#newPassword");
const newPasswordCheck = document.querySelector("#newPasswordCheck");
const regexPw = /^[A-Za-z0-9`~!@#\$%\^&\*\(\)\{\}\[\]\-_=\+\\|;:'"<>,\./\?]{8,20}$/;
const phone = document.querySelector("#phone");
const phoneCheck = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;



document.querySelector("#eyes").addEventListener('click',(e)=>{
	if(newPassword.type == "password")
		newPassword.type = "text";
	else
		newPassword.type = "password";
		
})

const pwCheck = () =>{
	$.ajax({
		url : "${pageContext.request.contextPath}/member/passwordCheck.do",
		method : "POST",
		data : {password : document.querySelector("#password").value},
		headers,
		dataType : "json",
		success(response){
			console.log(response);
			if(response){
				alert("비밀번호 일치");
				pwCheckBtn.value = "1";
				return true;
			}
			else{
				alert("비밀번호 불일치");
				document.querySelector("#password").focus();
				return false;
			}
		},
		error : console.log
	})
}

const updateMember = () => {
		
	if(!regexPw.test(newPassword.value)) {
  		
  		alert("8~20자 영문 대소문자, 숫자, 특수문자를 사용하세요.");
  		newPassword.focus();
    	return ;
   }
	
   if(!phoneCheck.test(phone.value)){
 		alert("올바른 전화번호 형식을 입력하세요.");
 		phone.focus();
   		return ;
   }
	
			if(pwCheckBtn.value == "1"){
				if(newPassword.value == newPasswordCheck.value){
					frm.action = "${pageContext.request.contextPath}/member/memberUpdate.do";
					frm.submit();												
				}else{
					alert("새로운 비밀번호가 일치하지 않습니다.");
					newPassword.focus();
				}
			}else{
				alert("비밀번호 확인을 해주세요");
			}
			
			
			 
};

const deleteMember = (name) => {
	pwCheck();
	if(confirm(name + "님 정보를 정말 삭제하시겠습니까?")){		
		const frm = document.memberFrm;
		frm.action = "${pageContext.request.contextPath}/member/memberDelete.do";
		frm.submit();
	}
};

const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	
const rawPhone = document.querySelector("#rawPhone").value;
const phoneNum = rawPhone.substr(0,3)+"-"+rawPhone.substr(3,4)+"-"+rawPhone.substr(7,4);
window.onload = () =>{
	phone.value = phoneNum;
	console.log(rawPhone);
}
</script>
</body>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>