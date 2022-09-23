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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberMyPage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberOrder.css" />
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
	
  <!-- 본문 -->
 <!--  <div id="page-content-wrapper">
	    <div class="container-fluid">
	     	 <h3>마이 쇼핑</h3>
	    </div>
	    <div class="main">
	    	<div id="orderStatus">
	    		<div>
	    			<h4>찜한 상품</h4>
	    			<h4>0</h4>
	    		</div>
	    		<div>
	    			<h4>구매한 상품</h4>
	    			<h4>0</h4>
	    		</div>
	    		<div>
	    			<h4>배송중인 상품</h4>
	    			<h4>0</h4>
	    		</div>
	    	</div>
	    </div>
  </div>
 	 -->
</div>
<div id="memberorder-wrapper">
	<div class="memberorder-container">
		<h3>주문/배송내역</h3>
	</div>
		<div class="member-order-list">
			<table class="n-table table-col n-order-view" id="order-list-tbl">
				<thead>
					<tr>
						<td>주문번호</td>
						<td>결제금액</td>
						<td>주문일자</td>
						<td>수령인</td>
						<td>주소</td>
						<td>배송상태</td>
					</tr>
				</thead>
				<tbody class="tb">
					<c:if test="${empty list}">
						<tr>
							<td colspan="6" class="text-center">주문 내역이 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:if test="${not empty list}">
						<c:forEach items="${list}" var="order">
							<tr data-no="${order.merchantUid}">
								<td>${order.merchantUid}</td>
								<td><fmt:formatNumber value="${order.totalPrice}" pattern="₩###,###,###"/></td>
								<td>${order.paidAt}</td>
								<td>${order.recipient}</td>
								<td>${order.address}</td>
								<td>${order.status}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<nav class="pagebar">${pagebar}</nav>
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