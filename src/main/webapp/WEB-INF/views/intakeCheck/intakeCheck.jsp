<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="${param.title}" />
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- 자동완성 -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/intakeCheck.css" />

<!-- 섭취 체크 페이지 시작 -->
<div class="body">
	<div id="intake-calendar">
		<div class="sec-cal">
			<div class="cal-nav">
				<a href="javascript:;" class="nav-btn go-prev">prev</a>
				<div class="year-month"></div>
				<a href="javascript:;" class="nav-btn go-next">next</a>
			</div>
			<div class="cal-wrap">
				<div class="days">
					<div class="day">월</div>
					<div class="day">화</div>
					<div class="day">수</div>
					<div class="day">목</div>
					<div class="day">금</div>
					<div class="day">토</div>
					<div class="day">일</div>
				</div>
				<div class="dates"></div>
			</div>
		</div>
	</div>
	<div id="intake-wrap">
		<div id="count-date"><span>1/31일</span> 섭취 완료</div>
		<div id="intake-list">
			<span>상콤 비타민</span>
			<span>2022.09.13 시작</span>
			<div class="btn-group-toggle p-0 mb-3" data-toggle="buttons">
				<button type="button" class="btn btn-danger" id="btn-delete">삭제하기</button>
			</div>
		</div>
	</div>
	<div id="check-list-wrap">
		<div id="check-list">
			<div id="intake-time">섭취 예정 시간 | 10:00</div>
			<span id="pname">상콤 비타민</span>
			<span id="srvUse">1정</span>
			<div id="buttons">
				<div class="btn-group-toggle p-0 mb-3" data-toggle="buttons">
					<label class="btn btn-outline-success" style="overflow: hidden" title="">
					<input type="checkbox" name="intakeYn" value="Y">
						먹었어요
					</label>
				</div>
				<div class="btn-group-toggle p-0 mb-3" data-toggle="buttons">
					<label class="btn btn-outline-warning" style="overflow: hidden" title="">
					<input type="checkbox" name="intakeYn" value="N">
						안 먹었어요
					</label>
				</div>
			</div>
		</div>
		<form:form name="addIntakeFrm" id="addIntakeFrm" method="post"
			action="${pageContext.request.contextPath}/intakeCheck/addIntakeList.do">
			<div id="add-intake">
				<div id="add-pname">
					<label>제품명 : </label>
					<input type="text" name="pname" id="input-add-pname" required/>
				</div>
				<div id="add-srvUse">
					<span>섭취량 : </span>
					<select name="amount" id="select-add-srvUse">
						<option value="1">1정</option>
						<option value="2">2정</option>
						<option value="3">3정</option>
					</select>
				</div>
				<div id="add-intake-time">
					<span>섭취시간 : </span>
					<input type="hidden" name="alarmTime" />
					<select name="intakeTime" id="select-intake-time">
						<option value="0" selected>시간</option>
						<option value="1">1:00</option>
						<option value="2">2:00</option>
						<option value="3">3:00</option>
						<option value="4">4:00</option>
						<option value="5">5:00</option>
						<option value="6">6:00</option>
						<option value="7">7:00</option>
						<option value="8">8:00</option>
						<option value="9">9:00</option>
						<option value="10">10:00</option>
						<option value="11">11:00</option>
						<option value="12">12:00</option>
						<option value="13">13:00</option>
						<option value="14">14:00</option>
						<option value="15">15:00</option>
						<option value="16">16:00</option>
						<option value="17">17:00</option>
						<option value="18">18:00</option>
						<option value="19">19:00</option>
						<option value="20">20:00</option>
						<option value="21">21:00</option>
						<option value="22">22:00</option>
						<option value="23">23:00</option>
						<option value="24">24:00</option>
					</select>
				</div>
			</div>
			<button type="submit" class="btn btn-warning" id="btn-add">추가하기</button>
		</form:form>
	</div>
</div>
<script>
document.addIntakeFrm.addEventListener('submit', (e) => {
	e.preventDefault();
	const frm = e.target;
	const alarmTime = frm.alarmTime;
	alarmTime.value = document.querySelector('#select-intake-time').value;
	
	frm.submit();
});

//상품명 자동 완성
$('#input-add-pname').autocomplete({
	source(request, response){
		console.log(request);
		const {term} = request;
		
		$.ajax({
			url : "${pageContext.request.contextPath}/product/autocompletePname.do",
			method : "GET",
			data : {term},
			success(pnames){
				console.log(pnames);
				const arr = pnames.map((pname) => ({
					label : pname,
					value : pname
				}));
				console.log(arr);
				response(arr);
			},
			error(jqxhr, statusText, err){
                   console.log(jqxhr, statusText, err);
               }
		});
	},
	focus(e, selected){return false;}
});


// 달력 출력
$(document).ready(function() {
    calendarInit();
});

function calendarInit() {
	const date = new Date(); // 현재 날짜(로컬 기준) 가져오기
	const utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // utc 표준시 도출
	const kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준 시간 더하기
	const today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

    let thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate()); // 달력에서 표기하는 날짜 객체
    let currentYear = thisMonth.getFullYear(); // 달력에 표기하는 년
    let currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
    let currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

    console.log(thisMonth);

    // 캘린더 랜더링
    renderCalender(thisMonth);

    function renderCalender(thisMonth) {
        // 랜더링 데이터 
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();

        // 이전 달의 마지막 날짜와 요일 구하기
        let startDay = new Date(currentYear, currentMonth, 0);
        let prevDate = startDay.getDate();
        let prevDay = startDay.getDay();

        // 이번 달의 마지막 날짜와 요일 구하기
        let endDay = new Date(currentYear, currentMonth + 1, 0);
        let nextDate = endDay.getDate();
        let nextDay = endDay.getDay();

        console.log(prevDate, prevDay, nextDate, nextDay);

        // 현재 월 표기
        $('.year-month').text(currentYear + '.' + (currentMonth + 1));

        // 랜더링 html
        let calendar = document.querySelector('.dates');
        calendar.innerHTML = '';

        // 지난달
        for (let i = prevDate - prevDay + 1; i <= prevDate; i++) {
            calendar.innerHTML += '<div class="day prev disable">' + i + '</div>';
        }

        // 이번달
        for (let i = 1; i <= nextDate; i++) {
            calendar.innerHTML += '<div class="day current" data-date=' + i + '>' + i + '</div>';
        }

        // 다음달
        for (let i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
            calendar.innerHTML += '<div class="day next disable">' + i + '</div>';
        }

        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) {
            todayDate = today.getDate();
            let currentMonthDate = document.querySelectorAll('.dates .current');
            currentMonthDate[todayDate - 1].classList.add('today');
        }
    }

 	// 이전달로 이동
    $('.go-prev').on('click', function () {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
    });

    // 다음달로 이동
    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth); 
    });
};

   </script>








<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>