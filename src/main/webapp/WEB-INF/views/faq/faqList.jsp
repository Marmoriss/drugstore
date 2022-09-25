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
	href="${pageContext.request.contextPath}/resources/css/faq.css" />
	
	
	<section id=faq-container>

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
		<!-- 전체 제품 회원관리 주문결제 교환반품 배송 드럭스토어 기타-->
		<section id="right-main">
		<div class="right-menu">
			<h4>FAQ</h4>
			<div class="right-menu-up"></div>
			<h6>DRUG STORE에게 자주 문의하시는 내용입니다.</h6>
			<div class="right-menu-down"></div>
			
			<!-- 아코디언 사용하기 -->
			<!-- btn btn-link btn-block text-center -->
			<!-- card-body text-center -->
			
  			<div class="accordion" id="accordionExample">
  				<c:forEach items="${list}" var="faq">
					<div class="card">
						<div class="card-header" id="heading_${faq.no}">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-center" type="button" data-toggle="collapse" data-target="#collapse_${faq.no}" aria-expanded="true" aria-controls="collapse_${faq.no}">
									${faq.question}
								</button>
							</h2>
						</div>
						<div id="collapse_${faq.no}" class="collapse" aria-labelledby="heading_${faq.no}" data-parent="#accordionExample">
							<div class="card-body text-center">
								${faq.answer}
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
	
			</div>
			
		</section>
			
		
		
	</section>
	
	
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>