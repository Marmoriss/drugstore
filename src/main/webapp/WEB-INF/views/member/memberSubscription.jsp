<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="마이페이지-정기구독" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberMyPage.css" />
<body>	
	<div id="layout_config">
        <!-- 좌측 네브바 -->
        <div id="layout_side">
            <div class="mypage-common-side__wrapper">
                <h2 class="mypage-common-side__title">마이페이지</h2>
                <div class="mypage-common-side__item">
                    <h3 class="mypage-common-side__title-sub">나의 쇼핑 정보</h3>
                    <ul class="mypage-common-side__list">
                        <li class="mypage-common-side__link">
                            <a href="${pageContext.request.contextPath}/member/memberOrder.do">주문/배송내역</a>
                        </li>
                        <li class="mypage-common-side__link">
                            <a href="${pageContext.request.contextPath}/wish/wishList.do">위시리스트</a>
                        </li>
                    </ul>
                </div>
                <div class="mypage-common-side__item">
                    <h3 class="mypage-common-side__title-sub">나의 활동</h3>
                    <ul class="mypage-common-side__list">
                        <li class="mypage-common-side__link">
                            <a href="${pageContext.request.contextPath}/member/memberSubscription.do">정기구독</a>
                        </li>
                        <li class="mypage-common-side__link">
                            <a href="${pageContext.request.contextPath}/notice/noticeList.do">1:1문의</a>
                        </li>
                        <li class="mypage-common-side__link">
                            <a href="">상품 리뷰</a>
                        </li>
                        <li class="mypage-common-side__link">
                            <a href="">상품 문의</a>
                        </li>
                    </ul>
                </div>
                <div class="mypage-common-side__item">
                    <h3 class="mypage-common-side__title-sub">나의 계정</h3>
                    <ul class="mypage-common-side__list">
                        <li class="mypage-common-side__link">
                            <a href="${pageContext.request.contextPath}/member/updateMember.do">회원정보 수정</a>
                        </li>
                        <li class="mypage-common-side__link">
                            <a href="" id="servey">설문결과 확인</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 우측 content 영역 -->
        <div id="layout_config_body">
            <!-- 본문내용 시작 -->
            <div class="mypage-main__wraper">
                <div class="mypage-main__wish-wraper">
                        <h3>정기구독</h3>
                    <div class="mypage-main__wish-item-wrapper">
                        <div
                            class="swiper mypage-main__wish-swiper swiper-container-initialized swiper-container-horizontal">
									<div id="subscription_info">
									<c:if test="${not empty subscription}">
										<a href="">
										<div id="subscription__info-product">
										 	<span>(${product.pcode})</span><span>${product.pname}</span>
										</div>
										</a>
									 	<div id="subscription__info-date">
										 	<span>구독 시작 : ${subscription.startDate}</span>
										 	<span>배송 시기 : ${subscription.sendDate}</span>
									 	</div>									 	
									 	<div id="subscription__info-button">
										 	<form:form action="${pageContext.request.contextPath}/subscription/subscriptionDel.do" method="post">
										 	<input type="hidden" name="subNo" value="${subscription.subNo}" />
										 	<button type="button" class="btn btn-danger">구독 취소</button>
										 	</form:form>
									 	</div>									 	
									</c:if>
									<c:if test="${not empty alert}">
										<span>${alert}</span>
									</c:if>                                    
									</div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- // 본문내용 끝 -->
        </div>
    </div>
	

<script>
const headers = {};
headers['${_csrf.headerName}'] = '${_csrf.token}';
const servey = document.querySelector("#servey");
/**
 * 설문 결과가 없으면 설문조사 페이지로 이동, 설문 결과가 있으면 설문 결과 페이지로 이동 
 */
window.onload = () => {
		$.ajax({
			url : "${pageContext.request.contextPath}/servey/serveyCheck.do",
			method : "POST",
			dataType :"json",
			headers,
			success(response){
				console.log(response);
				const {available} = response;
				if(!available){
						$("#servey").attr("href", "${pageContext.request.contextPath}/servey/servey.do");
				}else{
						$("#servey").attr("href", "${pageContext.request.contextPath}/servey/serveyResult.do");
				}
			},
			error : console.log
		})
	}
</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>