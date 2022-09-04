<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="글작성" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/notice.css" />
<div id="container">
	<h2>공지사항 작성📝</h2>
	<hr>
	<br>
	<form action="${pageContext.request.contextPath}/notice/noticeEnroll.do" method="post">
		<div class="form-group">
			<label for="title">제목</label> <input type="text" class="form-control"
				id="title" placeholder="제목 입력" name="title" required="required">
		</div><br />

		<div class="form-group">
			<label for="writer">작성자</label> <input type="text"
				class="form-control" id="writer" name="writer" required>
		</div><br />

		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" rows="10" id="content" name="content"
				placeholder="내용 작성"></textarea>
		</div>
		<button type="submit" class="btn-add">등록</button>
	</form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>