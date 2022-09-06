<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="회원목록" value="헬로우 스프링" />
</jsp:include>
<style>
.navbar-brand {
	margin-left: 220px;
}

#userList {
	margin-left: 450px;
}

</style>

<nav class="navbar navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand">회원 조회</a>
		<form class="d-flex">
		<select id="searchType" name="searchType">
		<option value="">검색조건</option>
		<option value="name">이름</option> 
		<option value="gender">성별</option>
		<option value="member_id">아이디</option>
		<option value="body">고민부위</option>
	</select>&nbsp;&nbsp;
	
			<input id="searchType" name="searchType" class="form-control me-2" type="text">&nbsp;&nbsp;
			<button class="btn btn-outline-success" type="submit">검색</button>
		</form>
	</div>
</nav>

<table id="userList" class="table table-bordered w-50">

	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>연락처</th>
		<th>가입일</th>
		<th>성별</th>
		<th>고민부위</th>
	</tr>
	<c:if test="${empty list}">
		<tr>
			<td colspan="6" class="text-center">해당 회원이 존재하지 않습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not empty list}">
		<c:forEach items="${list}" var="user">
			<tr>${user.servey.no}</tr>
			<td>${user.member.memberId}</td>
			<td>${user.member.name}</td>
			<td>${user.member.phone}</td>
			<td>${user.member.createdAt}</td>
			<td>${user.servey.gender}</td>
			<td>${user.servey.body}</td>

		</c:forEach>
	</c:if>

</table>
	<nav>
		${pagebar}
	</nav>

</div>
</div>

</body>
</html>

