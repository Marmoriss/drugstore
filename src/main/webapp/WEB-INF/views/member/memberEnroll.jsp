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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
					<!-- <input type="text" class="form-control" placeholder="" name="address" id="address" value=""> -->
					<input class="form-control" type="text" id="sample4_postcode" placeholder="우편번호">
					<input class="btn btn-info"  type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					
				</td>
			</tr>
			<tr>
				<td>
					<input class="form-control" type="text" id="sample4_roadAddress" name="address" placeholder="도로명주소"><br>
					<input class="form-control" type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
					<input class="form-control" type="text" name="detailAddress" id="sample4_detailAddress" placeholder="상세주소">
					<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
					<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" >
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


<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
         
                document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</body>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>