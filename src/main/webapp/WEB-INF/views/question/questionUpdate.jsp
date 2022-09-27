<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="1:1 문의글 남기기" name="title" />
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
					<li class="menu-list"><a href="${pageContext.request.contextPath}/question/questionList.do">1:1 문의하기</a></li>
					<li class="menu-list"><a href="${pageContext.request.contextPath}/faq/faqList.do">FAQ</a></li>
				</ul>
		</section>
		
		<section class="right-menu">
			<h4>1 : 1 문의글 수정하기</h4>
			<div class="right-menu-up"></div>
        		
			
				<section class="beforeQuestion">
					<label for="title">제목 : ${question.title}</label><br>
					<label for="content">세부 내용 : ${question.content}</label><br>
				</section>
			
			<section class="questionUpdate">
			<form action="${pageContext.request.contextPath}/question/questionUpdate.do" method="POST" >
   				<fieldset>
    				<div class="crud-bot"></div>
    					<input type="hidden" name="no" value="${question.no}"/>
        				<label for="title">제목 : </label><br>
        					<textarea name="title" id="title" cols="100" rows="3"></textarea><br/>
        					<div class="form-blank"></div>
    					<label for="content">세부 내용 : </label><br>
        					<textarea name="content" id="content" cols="100" rows="10"></textarea><br>
        					<input type="hidden" name="writer" value="${question.writer}"/>
        				
        					<br><br>
        					<input type="submit" value="문의글 수정하기">
        					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    			</fieldset>
 			</form> 
 			<br /><br /><br /><br /><br />
			</section>
			
			
		</section>
	
	
	</section>
	
	
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>