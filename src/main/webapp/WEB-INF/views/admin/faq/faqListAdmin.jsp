<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param value="FAQ리뷰관리" name="title"></jsp:param>
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/faqAdmin.css" />
	
	<section class="FaqCrud">
	
		<section class="button">
			<h2>FAQ  관리페이지</h2>
			<div class="faqCrud-bot"></div>
		
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  				<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
  				<label class="btn btn-outline-secondary" for="btnradio1"><a href="${pageContext.request.contextPath}/admin/faq/faqInsertForm.do">FAQ 등록하기</a></label>
	
				<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
  				<label class="btn btn-outline-secondary" for="btnradio1"><a href="${pageContext.request.contextPath}/admin/faq/faqListAdmin.do">FAQ 조회하기</a></label>

  				<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
  				<label class="btn btn-outline-secondary" for="btnradio3"><a href="${pageContext.request.contextPath}/admin/faq/faqDeleteForm.do">FAQ 삭제하기</a></label>
			</div>
		</section>
		
		<section class="faqList">
			<table class="table">
					
						<tr>
							<td class="th-1">번호</td>
							<td class="th-2">FAQ 제목</td>
							<td class="th-3">FAQ 답변</td>
						</tr>
					
					
						<tr>
							<c:forEach items="${list}" var="faq">
								<td class="td-1">${faq.no}</td>
								<td class="td-2">${faq.question}</td>
								<td class="td-3">${faq.answer}</td>
							</c:forEach>
						</tr>
					
				
				
				
			</table>
		
		</section>
		

		
		
	</section>