<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String searchType = request.getParameter("searchType");
	String keyword = request.getParameter("keyword");
%>
<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="회원목록" value="헬로우 스프링" />
</jsp:include>
<style>
.navbar-brand {
	margin-left: 250px;
}
 
#userList {
	margin-left: 500px;
}

.pagebar {
	background-color: transparent;
	margin-top: 35px;
	margin-left: 120px;
}

.page-item.active .page-link {
	border-color: rgb(65, 88, 101);
	background-color: rgb(65, 88, 101);
}

div#search-name {
	display: <%= searchType == null || "name".equals(searchType) ? "inline-block" : "none" %>;
}
div#search-gender {
	display: <%= "gender".equals(searchType) ? "inline-block" : "none" %>;
}
div#search-memberId {
	display: <%= "member_id".equals(searchType) ? "inline-block" : "none" %>;
}
div#search-body {
	display: <%= "body".equals(searchType) ? "inline-block" : "none" %>;
}

.btn-search{
	background-color: rgb(122, 158, 177);
	color:white;
}
.stext{
	width:200px;
}
</style>

<script>
window.addEventListener('load', (e) => {
	document.querySelector("select#searchType").onchange = (e) => {
		document.querySelectorAll(".search-type").forEach((div, index) => {
			div.style.display = "none";			
		});
		let id;
		switch(e.target.value){
		case "name" : id = "name"; break;
		case "gender" : id = "gender"; break;
		case "member_id" : id = "memberId"; break;
		case "body" : id = "body"; break;
		}
		document.querySelector(`#search-\${id}`).style.display = "inline-block";
	}
});
</script> 

<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand">회원 조회</a>

		<div id="search-form">
			<label for="searchType">검색타입 :</label> 
			<select id="searchType">
				<option value="name" <c:if test="${searchType eq 'name'}">selected</c:if>>이름</option>
				<option value="gender" <c:if test="${searchType eq 'gender'}">selected</c:if>>성별</option>
				<option value="member_id" <c:if test="${searchType eq 'member_id'}">selected</c:if>>아이디</option>
				<option value="body" <c:if test="${searchType eq 'body'}">selected</c:if>>고민부위</option>
			</select>&nbsp;&nbsp;

			<div id="search-name" class="search-type">
				<form action="${pageContext.request.contextPath}/admin/user/userFinder.do"> 
				<input type="hidden" name="searchType" value="name" /> 
				<input type="text" name="keyword" class="stext"
					placeholder="검색할 이름을 입력하세요."
					value="${searchType eq 'name' ? keyword : '' }" />
				<button id="searchBtn" class="btn-search">검색</button>
				
				</form>
			</div>
			
			<div id="search-gender" class="search-type">
			<form action="${pageContext.request.contextPath}/admin/user/userFinder.do">
					<input type="hidden" name="searchType" value="gender" /> 
					<input type="radio" name="keyword" value="M" <c:if test="${searchType eq 'gender' && keyword eq 'M' }">checked</c:if>>남 
					<input type="radio" name="keyword" value="F" <c:if test="${searchType eq 'gender' && keyword eq 'F' }">checked</c:if>>여 
					<button id="searchBtn" class="btn-search">검색</button>
					
			</form>
			</div>
			
			<div id="search-memberId" class="search-type">
			<form action="${pageContext.request.contextPath}/admin/user/userFinder.do">
					<input type="hidden" name="searchType" value="member_id" /> 
					<input type="text" name="keyword" class="stext"
						placeholder="검색할 아이디를 입력하세요."
						value="${searchType eq 'member_id' ? keyword : '' }" />
					<button id="searchBtn" class="btn-search">검색</button>
			</form>
			</div>
			
			<div id="search-body" class="search-type">
			<form action="${pageContext.request.contextPath}/admin/user/userFinder.do">
					<input type="hidden" name="searchType" value="body" /> 
					<input type="text" name="keyword" class="stext"
						placeholder="검색할 부위를 입력하세요."
						value="${searchType eq 'body' ? keyword : '' }" />
					<button id="searchBtn" class="btn-search">검색</button>
			</form>
			</div>

	</div>
</nav>	
<!-- <script>
	document.getElementById("searchBtn").onclick = function() {

		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;

		
		 console.log(searchType)
		 console.log(keyword)

		location.href = "${pageContext.request.contextPath}/admin/user/userList.do?"
				+ "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script> -->

<table id="userList" class="table table-striped table-hover w-50">
	<thead class="table-light">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>연락처</th>
			<th>가입일</th>
			<th>성별</th>
			<th>고민부위</th>
		</tr>
	</thead>
	<c:if test="${empty list}"><br />
		<tr>
			<td colspan="6" class="text-center">해당 회원이 존재하지 않습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not empty list}">
		<c:forEach items="${list}" var="user">
			<tr>${user.servey.no}</tr>
			<th scope="row">${user.member.memberId}</th>
			<td>${user.member.name}</td>
			<td>${user.member.phone}</td>
			<td>${user.member.createdAt}</td>
			<td>${user.servey.gender}</td>
			<td>${user.servey.body}</td>

		</c:forEach>
	</c:if>

</table>

<nav class="pagebar">${pagebar}</nav>




</body>
</html>

