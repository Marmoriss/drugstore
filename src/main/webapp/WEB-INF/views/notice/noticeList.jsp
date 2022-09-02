<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="고객센터" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/notice.css" />

	<section id=notice-container>

		<section class="left-menu">
			<div class="border-top"></div>
			<h6>고객센터</h6>
			<div class="border-bot"></div>
			<ul class=space_list>
				<li class="menu-list"><a href="#">공지사항</a></li>
				<li class="menu-list"><a href="#">1:1 문의하기</a></li>
				<li class="menu-list"><a href="#">FAQ</a></li>
			</ul>
		</section>

		<div class="right-content">
			<h4>공지사항</h4>
			<table width="700px" id="tbl-notice">
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6" class="text-center">조회된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty list}">
					<c:forEach items="${list}" var="notice">
						<tr data-no="${notice.no}">
							<td>${notice.no}</td>
							<td>${notice.title}</td>
							<td>
								<fmt:parseDate value="${notice.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="regDate"/>
								<fmt:formatDate value="${regDate}" pattern="YYYY.MM.dd"/>
							</td>

						</tr>
					</c:forEach>
				</c:if>

			</table>
<br />
<br />
<br />
<br />
		</div>
		<br />

	</section>
<script>
document.querySelectorAll("tr[data-no]").forEach((tr) => {
	tr.addEventListener('click', (e) => {
		const tr = e.target.parentElement;
		const no = tr.dataset.no;
		if(no){
			location.href = "${pageContext.request.contextPath}/notice/noticeDetail.do?no=" + no;
		}
	});
	
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
