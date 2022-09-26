<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="주문" value="헬로우 스프링" />
</jsp:include>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/orders.css"/>

<style>
.navbar-brand {
	margin-left: 250px;
}
#orderList {
	margin-left: 330px;
}

#statusBtn {
	width:40px;
	height: 25px;
	background-color: rgb(65, 88, 101);
    color:white;
	border-radius: 15px;
}
#invoiceNum {
	height: 25px;
}
.dateList{
	margin-left: 330px;
	float:left;
	font-size:17px;
}
</style>

	<nav class="navbar navbar-light bg-light">
			<a class="navbar-brand">주문관리</a> </nav>
<br />
<br />

<!-- datepicker 위젯 넣기 --> 
<form action="${pageContext.request.contextPath}/admin/orders/findOrders.do" name="findFrm">
<div class="dateList">날짜별 주문 조회=></div>

<div class="dates" style="float:left;">
&nbsp;&nbsp;&nbsp;
	<input type="text" class="datepicker" id="to" name="toDate" placeholder="시작일" />~
	<input type="text" class="datepicker" id="from" name="fromDate" placeholder="종료일" />
	<button type="submit">조회 </button>
</div> 

</form>

<div class="total" style="float:left; margin-left:350px;">
<h5>총 주문 ${fn:length(list)}건</h5>
</div>
<br />
<br />
<table id="orderList" class="table w-75">
	  <thead>
	    <tr>
	      <th>주문번호</th>
	      <th>상품명</th>
	      <th>주문자</th>
	      <th>결제일</th>
	      <th>배송상태</th>
	      <th>배송관리</th>
	      
	    </tr>
	  </thead>
		<c:if test="${empty list}"><br />
			<tr>
				<td colspan="6" class="text-center">주문 내역이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach items="${list}" var="order">
			<tr data-no="${order.orders.merchantUid}">
				<td>${order.orders.merchantUid}</td>
				<td>${order.product.pname}</td>
				<td>${order.orders.memberId}</td>
				<td>${order.orders.paidAt}</td>			
				<td>${order.orders.status}</td>
				
				<c:choose>
					<c:when test="${order.orders.status eq '배송준비중'}">
						<td><input id="invoiceNum" class="form-control form-control-sm" type="text" placeholder="송장번호입력"></td>
						<td><button type="button" id="statusBtn" data-no="${order.orders.merchantUid}">확인</button></td>
					</c:when>
					<c:when test="${order.orders.status eq '배송중'}">
						<td><p>배송처리완료</p></td>
						<td><button type="button" id="statusBtn" style="display: none;">확인</button></td>
					</c:when>
				</c:choose>

			</c:forEach>
		</c:if>

	</table>

<script>
document.querySelectorAll("#statusBtn").forEach((btn)=>{
	btn.addEventListener('click', (e) => {
  
	const merchantUid = e.target.dataset.no;

	//console.log(merchantUid);
	
	const headers = {};
	headers['${_csrf.headerName}'] = '${_csrf.token}';
	console.log(headers);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/orders/statusUpdate.do",
		method : "POST",
		headers,
		data : {merchantUid},
		success(response){
			location.reload();
		},
		error: console.log
		}); 
	});
});
</script>

<script>
const to = document.querySelector('#to');
const from = document.querySelector('#from');
const today = new Date();
const dateFormat = (date) => {
   let year = date.getFullYear();
   let month = (date.getMonth() + 1) >= 10 ? date.getMonth() + 1 : '0' + (date.getMonth() + 1);
   let _date = date.getDate() >= 10 ? date.getDate() : '0' + date.getDate(); 
   
   
   return year + '-' + month + '-' + _date;
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
$('#to').datepicker({
    showOn: "both", // 달력을 표시할 타이밍 (both: focus or button)
    buttonImage: "${pageContext.request.contextPath}/resources/images/calendar.png", // 버튼 이미지
    onClose: function( selectedDate ) {    
        // 시작일(to) datepicker가 닫힐때
        // 종료일(from)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
        $("#from").datepicker( "option", "minDate", selectedDate );
    }                
});

//종료일
$('#from').datepicker({
    showOn: "both", 
    buttonImage: "${pageContext.request.contextPath}/resources/images/calendar.png", // 버튼 이미지
    onClose: function( selectedDate ) {
        // 종료일(from) datepicker가 닫힐때
        // 시작일(to)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
        $("#to").datepicker( "option", "maxDate", selectedDate );
    }                
});



</script>

</body>
</html>