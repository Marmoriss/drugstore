<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Q&A" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/qna.css" />

<!-- header 다음에 상세페이지 jsp 들어가야함. 이 다음 qna. 추후 상세페이지 작업하면서 링크 걸고 수정예정 -->
<!-- footer는 현재 content 작업에 가려져서 임시로 없앴음. 상세페이지 jsp링크와 함께 걸어둘 예정 -->
	<section id="qna-container">
	
		<section class="qna_basic-wrapper">
			<div class="qna-basic-wrap">
				<div id="qna_basic-container">
					<h3 class="contain-title">Q&A</h3>
					<br>
					<p class="contain-content">
						구매하시려는 상품에 대해 궁금한 점이 있는 경우 문의해주세요.
					</p>
				</div>
			<div class="contain-content-qna-wrap">
				<div class="qna-enroll">
					<sec:authorize access="isAuthenticated()">
						<input type="button" value="상품 Q&A 작성하기" id="btn-write" class="btn-write" 
							onclick="location.href='${pageContext.request.contextPath}/qna/qnaUpdateForm.do';"/>
					</sec:authorize>
				</div>
			<div class="content-myQna-wrap">
				<div class="myQna-Confirm">
					<c:if test="${loginMember.memberId eq qna.writer}">
						<button 
						type="button" 
						class="btn-search" id="btn-search"
						onclick="location.href='${pageContext.request.contextPath}/qna/qnaList.do?no=${qna.qnaId}';">내 Q&A 조회하기</button>
					</c:if>
				</div>
					<div class="dropdown">
					  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    답변상태
					  </button>
					  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					    <a class="dropdown-item" href="#">답변상태</a>
					    <a class="dropdown-item" href="#">미답변</a>					    
					    <a class="dropdown-item" href="#">답변완료</a>
						 </div>
					</div>
				</div>
			</div>
		</div>
	</section>	
			<div class="bottom-content">
				<table id="tbl-qna" class="table table-striped table-hover">
					<tr>
						<th>답변상태</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					<c:if test="${empty list}">
						<tr>
							<td colspan="4" class="text-center">조회된 게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty list}">
						<c:forEach items="${list}" var="qna">
							<tr data-no="${qna.qnaId}">
								<td>${qna.answered}</td>
								<td>${qna.title}</td>
								<td>${qna.memberId}</td>
								<td>
									<fmt:parseDate value="${qna.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="regDate"/>
									<fmt:formatDate value="${regDate}" pattern="YYYY.MM.dd"/>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
			<nav>
				${pagebar}
			</nav>
<br />
<br />
<br />
<br />
	</section>
<script>
/*	var toggle = false;
	
 	btn.addEventListener('click', function() {
		//클릭할 때마다 현재상태 반전
		toggle = !toggle;
		
		//if문 만약 토글이 true라면 
		if(toggle == true)
			selector.classList.add('on');
		else
			selector.classList.remove('on');
	}, false); */
	
</script>