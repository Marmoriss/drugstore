<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="고객센터" name="title" />
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/question.css" />

	<section id="questionContainer">
	
			<section class="left-menu">
				<div class="border-top"></div><br />
				<h6>고객센터</h6><br />
				<div class="border-bot"></div><br />
				<ul class=space_list>
					<li class="menu-list"><a href="${pageContext.request.contextPath}/notice/noticeList.do">공지사항</a></li>
					<li class="menu-list"><a href="${pageContext.request.contextPath}/faq/faqList.do">1:1 문의하기</a></li>
					<li class="menu-list"><a href="#">FAQ</a></li>
				</ul>
			</section>
		
			<section class="right-menu">
				<h4>1 : 1 문의하기</h4>
				
				<a href="${pageContext.request.contextPath}/question/questionForm.do"><input type="submit" value="문의글 쓰기" /></a>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				
				<div class="right-menu-up"></div>
				
					<table class="questionList">
						<thead>
							<tr class="questionList-head">
								<td>번호</td>
								<td>제목</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>답변 여부</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="question">
								<tr class="questionList-body">
									<td>${question.no}</td>
									<td>${question.title}</td>
									<td>${question.writer}</td>
									<td>
										<fmt:parseDate value="${question.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="regDate"/>
										<fmt:formatDate value="${regDate}" pattern="YYYY/MM/dd"/>
									</td>
									<td>${question.answered}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</section>
	</section>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>