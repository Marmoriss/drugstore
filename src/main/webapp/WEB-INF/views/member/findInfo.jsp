<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="아이디/비번 찾기" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/findInfo.css" />
<script>
	if(${password != null}){
		alert("${password}로 변경되었습니다. (고객님의 보안을 위해 개인정보수정에서 비밀번호를 변경해주세요)");
	}else if(${memberId != null}){
		alert("회원님의 아이디는 ${memberId}입니다.");
	}
</script>
<body>
	<div id="enroll-container" class="mx-auto text-center">
	
	<form:form name="findPwFrm" action="${pageContext.request.contextPath}/member/findInfo.do" method="POST">
		<table>
			<tr>
				<td></td>
				<td><h3>비밀번호 찾기</h3></td>
			</tr>
			<tr>
				<td>
					<label for="memberId">아이디</label>
				</td>
				<td>
					<input class="form-control" type="text" id="memberId" name="memberId" required/>
				</td>
			</tr>
			<tr>
				<td>
					<label for="phone">전화번호</label>
				</td>
				<td>
					<input class="form-control" type="tel" id="phone" name="phone" oninput="autoHyphen2(this)" maxlength="13" required/>
				</td>
			</tr>
			<tr>
			<td></td>
			<td>
				<button type="submit" class="btn btn-info">찾기</button>
			</td>
		</tr>
		</table>
	</form:form>
	<br />
	<hr />
	<br />
	<form:form name="findIdFrm" action="${pageContext.request.contextPath}/member/findId.do" method="POST">
	<table>
		<tr>
			<td></td>
			<td><h3>아이디 찾기</h3></td>
		</tr>
		<tr>
			<td>
				<label for="name">이름</label>
			</td>
			<td>
				<input class="form-control" type="text" id="name" name="name" required/>
			</td>
		</tr>
		<tr>
			<td>
				<label for="phone">전화번호</label>
			</td>
			<td>
				<input class="form-control" type="tel" id="phone" name="phone" oninput="autoHyphen2(this)" maxlength="13" required/>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<button type="submit" class="btn btn-info">찾기</button>
			</td>
		</tr>
	</table>
	</form:form>
</div>

<script>
const headers = {};
headers['${_csrf.headerName}'] = '${_csrf.token}';


const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
</script>
</body>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>