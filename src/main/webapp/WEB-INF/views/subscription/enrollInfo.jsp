<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="구독정보등록" />
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subscription/enrollInfo.css" />

<body>
	<div id="main-div">
	<h3>구독 정보 등록</h3>		
	<form:form action="${pageContext.request.contextPath}/subscription/enrollSubscriptionInfo.do" method="post">
		<input type="text" value='<sec:authentication property="principal.memberId"/>' readonly="readonly"/>
		<!-- datepicker 위젯 넣기 -->
         <div class="dates">
            <input type="date" class="datepicker" id="to" name="toDate" placeholder="구독 시작일" required/>
            <br />
            <input type="date" class="datepicker" id="from" name="fromDate" placeholder="구독 종료일" required />
         </div>
         <input type="hidden" name="pcode" value="${pcode}" />
         <input type="hidden" name="cartNo" value="${cartNo}" />
         <button type="submit">제출</button>
	</form:form>
	</div>
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


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>