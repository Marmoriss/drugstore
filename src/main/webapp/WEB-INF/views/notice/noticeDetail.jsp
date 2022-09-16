<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/notice.css" />
<div id="noticeViewDesc">
	<div><h4>${notice.title}</h4></div>
	<hr style="margin-top:20px;"  />  
		<div><span id="noticeView">
			<input type="text" value="<sec:authentication property="principal.memberId"/>" required/>
		</span> <br> 
		<!-- <span id="noticeView"> -->
			<fmt:parseDate value="${notice.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="regDate"/>
			<fmt:formatDate value="${regDate}" pattern="YYYY.MM.dd"/>
		</div>
	</div>
   
   <div id="noticeViewContent"><p class="noContent">${notice.content}</p></div>

   <br />
   <%-- 해당 게시글 작성자가(관리자)한테만 수정/삭제버튼이 보일수 있게 할 것 추가예정 --%>
   <sec:authorize access="hasRole('ADMIN')">
   	<button type="button" 
			class="btn-update"
			onclick="location.href='${pageContext.request.contextPath}/notice/noticeUpdate.do?no=${notice.no}';">수정</button>
	<button type="button" 
			class="btn-delete"
			onclick="location.href='${pageContext.request.contextPath}/notice/noticeDelete.do?no=${notice.no}';">삭제</button>   
</sec:authorize>
<br />
<br />
<br />
<br />
<br />
<br />
<div class="pageNav">
	<c:choose >
	<c:when test="${page.next != 9999}">
	
	<button type="button" class="btn-page" onclick="location.href='${pageContext.request.contextPath}/notice/noticeDetail.do?no=${page.next}'">다음글</button>
		<a href="${pageContext.request.contextPath}/notice/noticeDetail.do?no=${page.next}" style="color: black"> ${page.nexttitle} </a>
	</c:when>
	
	<c:when test="${page.next == 9999}">
	<button type="button" class="btn-no" disabled>다음글이 없습니다</button>
	</c:when>
	</c:choose>
	<br/><br />
	<c:choose>
	<c:when test="${page.last != 9999}">
	<button type="button" class="btn-page" onclick="location.href='${pageContext.request.contextPath}/notice/noticeDetail.do?no=${page.last}'">이전글</button>
	<a href="${pageContext.request.contextPath}/notice/noticeDetail.do?no=${page.last}" style="color: black"> ${page.lasttitle} </a>
	</c:when>
	
	<c:when test="${page.last == 9999}">
	<button type="button" class="btn-no" disabled>이전글이 없습니다</button>
	</c:when>
	</c:choose>

</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>