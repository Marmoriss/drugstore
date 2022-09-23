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
		
		
		
	</section>
	
	
	
	
	