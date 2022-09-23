<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="마이페이지" />
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
                            <a href="">위시리스트</a>
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
                <div class="mypage-main__top-wrapper">
                    <div class="mypage-main__user-wrapper">
                        <div class="mypage-main__user-right">
                            <div class="mypage-main__user-name">
                                <sec:authentication property="principal.name"/>
                                <span>님</span>
                            </div>
                            <a href="" class="mypage-main__user-modi-btn">회원정보 수정 ></a>
                        </div>
                    </div>
                    <div class="mypage-main__user-info-wrapper">
                        <div class="mapage-main__user-info-item hand">
                            <div class="mypage-main__user-info-title">위시리스트</div>
                            <div class="mypage-main__user-info-num-wrapper">
                                <div class="mypage-main__user-info-num-icon">
                                    <!--하트 이미지 넣기-->
                                </div>
                                <div class="mypage-main__user-info-num mypage-main__user-info-num--wish"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mypage-main__wish-wraper">
                    <div class="mypage-main__title-wrapper">
                        <div class="mypage-main__title">위시리스트</div>
                        <a href="" class="mypage-main__title-more">
                            <div class="mypage-main__title-more-text">더보기</div>
                            <div class="mypage-main__title-more-icon">
                                <!-- > 이미지 넣기 -->
                            </div>
                        </a>
                    </div>
                    <div class="mypage-main__wish-item-wrapper">
                        <div
                            class="swiper mypage-main__wish-swiper swiper-container-initialized swiper-container-horizontal">
                            <ul class="swiper-wrapper mypage-main__wish-swiper-wrapper">
                                <li class="mypage-main__wish-item swiper-slide swiper-slide-active">
                                    <div class="mypage-main__wish-img">
                                        <a href="" class="mypage-main__wish-link">
                                            <!-- 상품 이미지 -->
                                        </a>
                                    </div>
                                    <div class="mypage-main__wish-info">
                                        <div class="mypage-main__wish-name">
                                            <a href="" class="mypage-main__wish-link">
                                                <!-- 상품명 -->
                                            </a>
                                        </div>
                                        <div class="mypage-main__wish-price-wrapper">
                                            <div class="mypage-main__wish-price mypage-main__wish-price--sale"></div>
                                            <div class="mypage-main__wish-price mypage-main__wish-price--org"></div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
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