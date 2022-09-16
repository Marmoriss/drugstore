<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="글작성" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/qna.css" />
<div id="container">
	<h3>신규 QNA 작성</h3>
	<hr>
	<br>
	<form:form action="${pageContext.request.contextPath}/qna/qnaEnroll.do" method="post">
		<div class="form-group">
			<label for="writer"><sec:authentication property="principal.memberId"/></label>
		</div><br />
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" rows="10" id="content" name="content"
				placeholder="내용 작성"></textarea>
		</div><br />
		<div class="form-group">
			<label for="secretPassword">비밀번호</label> <input type="text"
				class="form-control" id="secretPassword" name="secretPassword" required>
		</div><br />
		<button type="submit" class="btn-add">등록</button>
	</form:form>
</div>


<br/>
<br/>
<br/>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>