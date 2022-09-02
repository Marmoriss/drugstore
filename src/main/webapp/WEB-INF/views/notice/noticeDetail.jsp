<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/notice.css" />
<div id="noticeViewDesc">
	<div><h4>${notice.title}</h4></div>
	<hr style="margin-top:20px;"  />  
		<div><span id="boardViewWriter">글쓴이:&nbsp;&nbsp;${notice.writer}</span> <br> 
		<span id="NoticeRegDate">
			<fmt:parseDate value="${notice.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="regDate"/>
			<fmt:formatDate value="${regDate}" pattern="YYYY.MM.dd"/>
		</div>
	</div>
   
   <div id="noticeViewContent">${notice.content}</div>

	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>