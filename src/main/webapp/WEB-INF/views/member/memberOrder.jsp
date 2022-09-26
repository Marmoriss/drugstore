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

<!-- datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<!-- 사용자 작성 css -->
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
                            <a href="${pageContext.request.contextPath}/question/questionList.do">1:1문의</a>
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
	<div>
		<form action="${pageContext.request.contextPath}/member/findByValues.do" name="adminSearchFrm">
			<div class="">
			<div class="control-label">배송 상태</div>
				<div class="form-group checkbox-wrap">
				<input type="hidden" name="status" id="status" value=""/>
					<div>
						<input type="radio" name="statuses" value="total" id="getTotal"/>
						<label for="getTotal">전체</label>
					</div>
					<div>
						<input type="radio" name="statuses" value="배송준비중" id="getPreparing"/>
						<label for="getPreparing">배송준비중</label>
					</div>
					<div>
						<input type="radio" name="statuses" value="배송중" id="getGoing"/>
						<label for="getGoing">배송중</label>
					</div>
					<div>
						<input type="radio" name="statuses" value="배송완료" id="getArrival"/>
						<label for="getArrival">배송완료</label>
					</div>
			</div>
			</div>
			<div class="form-group">
				<select class="custom-select">
					<option selected value="paidAt">주문일자</option>
				</select>
			</div>
			<div class="form-group">
				<div class="btn-group date-btns">
					<button type="button" class="date-btn" id="today-btn">오늘</button>
					<button type="button" class="date-btn" id="week-btn">1주일</button>
					<button type="button" class="date-btn" id="one-month-btn">1개월</button>
					<button type="button" class="date-btn" id="three-month-btn">3개월</button>
					<button type="button" class="date-btn" id="six-month-btn">6개월</button>
					<button type="button" class="date-btn" id="year-btn">1년</button>
					<button type="button" class="date-btn" id="total-btn">전체</button>
				</div>
				<div class="form-group">
					<!-- datepicker 위젯 넣기 -->
					<div class="dates">
						<input type="text" class="datepicker" id="to" name="to" placeholder="시작일"/>
						<input type="text" class="datepicker" id="from" name="from" placeholder="종료일"/>
					</div>
					
				</div>
			</div>
			<div class="panel-footers">
				<div class="admin-button-areas">
					<button type="submit" class="btn-submit">검색</button>
				</div>
			</div>
		</form>
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

document.adminSearchFrm.addEventListener('submit', (e) => {
	const frm = e.target;
	e.preventDefault();
	
	const status = document.querySelector('[name=statuses]:checked') == null ? null : document.querySelector('[name=statuses]:checked').value;
	document.querySelector('#status').value = status;
	frm.submit();
});

const to = document.querySelector('#to');
const from = document.querySelector('#from');
const today = new Date();
const dateFormat = (date) => {
	let year = date.getFullYear();
	let month = (date.getMonth() + 1) >= 10 ? date.getMonth() + 1 : '0' + (date.getMonth() + 1);
	let _date = date.getDate() >= 10 ? date.getDate() : '0' + date.getDate(); 
	
	
	return year + '/' + month + '/' + _date;
};
$.datepicker.setDefaults({
	dateFormat:'yy-mm-dd',
	prevText: '이전 달',
	nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	showMonthAfterYear: true,
	yearSuffix: '년'
});
$(function(){
	$('.datepicker').datepicker();
});
//오늘 버튼 클릭시
$('#today-btn').on('click', (e) => {
	$('.datepicker').datepicker('option', 'disabled', false);
	to.value = dateFormat(today);
	from.value = dateFormat(today);
});
// 1주일 버튼 클릭시
$('#week-btn').on('click', (e) => {
	$('.datepicker').datepicker('option', 'disabled', false);
	to.value = dateFormat(new Date(today.getFullYear(),today.getMonth(), today.getDate() - 6));
	from.value = dateFormat(today);
});
// 1개월 버튼 클릭시
$('#one-month-btn').on('click', (e) => {
	$('.datepicker').datepicker('option', 'disabled', false);
	let _month = today.getMonth() - 1 <= 0 ? today.getMonth() - 1 + 12 : today.getMonth() - 1;
	let _year = today.getMonth() - 3 <= 0 ? today.getFullYear() - 1 : today.getFullYear();
	to.value = dateFormat(new Date(today.getFullYear(), today.getMonth() - 1, today.getDate() + 1));
	from.value = dateFormat(today);
});
// 3개월 버튼 클릭시
$('#three-month-btn').on('click', (e) => {
	$('.datepicker').datepicker('option', 'disabled', false);
	let _month = today.getMonth() - 3 <= 0 ? today.getMonth() - 3 + 12 : today.getMonth() - 3;
	let _year = today.getMonth() - 3 <= 0 ? today.getFullYear() - 1 : today.getFullYear();
	to.value = dateFormat(new Date(_year, _month, today.getDate() + 1));
	from.value = dateFormat(today);
});
// 6개월 버튼 클릭시
$('#six-month-btn').on('click', (e) => {
	$('.datepicker').datepicker('option', 'disabled', false);
	let _month = today.getMonth() - 6 <= 0 ? today.getMonth() - 6 + 12 : today.getMonth() - 6;
	let _year = today.getMonth() - 6 <= 0 ? today.getFullYear() - 1 : today.getFullYear();
	to.value = dateFormat(new Date(_year, _month, today.getDate() + 1));
	from.value = dateFormat(today);
});
// 1년 버튼 클릭시
$('#year-btn').on('click', (e) => {
	$('.datepicker').datepicker('option', 'disabled', false);
	to.value = dateFormat(new Date(today.getFullYear() - 1, today.getMonth(), today.getDate() + 1));
	from.value = dateFormat(today);
});
// 전체 버튼 클릭시
$('#total-btn').on('click', (e) => {
	to.value='';
	from.value='';
	$('.datepicker').datepicker('option', 'disabled', true); // input 박스 비활성화
});
</script>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>