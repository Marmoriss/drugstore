<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="${param.title}" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/intakeCheck.css" />
<body>
	<!-- 달력 -->
	<div class="main">
		<div class="content-wrap">
			<div class="content-left">
				<table id="calendar" align="center">
					<thead>
						<tr class="btn-wrap clearfix">
							<td>
								<label id="prev">&#60;</label>
							</td>
							<td id="current-year-month" align="center" colspan="5"></td>
							<td>
								<label id="prev">&#62;</label>
							</td>
						</tr>
						<tr>
							<td class="sun" align="center">Sun</td>
							<td align="center">Mon</td>
							<td align="center">Tue</td>
							<td align="center">Wed</td>
							<td align="center">Thu</td>
							<td align="center">Fri</td>
							<td class="sat" align="center">Sat</td>
						</tr>
					</thead>
					<tbody id="calendar-body" class="calendar-body"></tbody>
				</table>
			</div>
			<div class="content-right">
				<div class="main-wrap">
					<div class="main-day" id="main-day"></div>
					<div class="main-date" id="main-date"></div>
				</div>
				<div class="todo-wrap">
					<div class="todo-title">Intake Check</div>
					<div class="input-wrap">
						<input type="text" id="input-box" class="input-box" placeholder="여기에 적어주세요"/>
						<button type="button" id="input-data" class="input-data">INPUT</button>
						<div id="input-list" class="input-list"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
    const currentTitle = document.querySelector('#current-year-month');
    const calendarBody = document.querySelector('#calendar-body');
    let today = new Date();
    let first = new Date(today.getFullYear(), today.getMonth(), 1); // 오늘이 속한 달의 첫 날
    const dayList = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
    const monthList = ['January','February','March','April','May','June','July','August','September','October','November','December'];
    
    //월 총 일수
    const leafYear = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];    
    const notleafYear= [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    
    const pageFirst = first;
    let pageYear;
    
    if(first.getFullYear() % 4 == 0){ 
        pageYear = leafYear; // 윤년일 때
    } else {
        pageYear = notleafYear; // 윤년이 아닐 때
    }

    const showCalendar = () => {
        let monthCnt = 100;
        let cnt = 1;
        for(let i = 0; i < 6; i++){ // 최대 6주
            let $tr = document.createElement('tr');
            $tr.setAttribute('id', monthCnt);
            for(let j = 0; j < 7; j++){ // 일
                if((i === 0 && j < first.getDay()) || cnt > pageYear[first.getMonth()]){
                    // 첫째주이면서 매 달 1일의 요일보다 작거나 그 달의 일수보다 cnt가 크거나
                    // 즉 달력에서 날짜가 없는 빈 칸을 생성하는 것.
                    let $td = document.createElement('td');
                    $tr.appendChild($td);
                } else {
                    // 날짜가 있는 칸 생성
                    let $td = document.createElement('td');
                    $td.textContent = cnt;
                    $td.setAttribute('id', cnt);
                    $tr.appendChild($td);
                    cnt++;
                }
            }
            monthCnt++;
            calendarBody.appendChild($tr);
        }
    }
    showCalendar();

    const removeCalendar = () => {
        let cathTr = 100;
        for(let i = 100; i < 106; i++){
            let $tr = document.querySelectorAll(catchTr);
            $tr.remove();
            catchTr++;
        }
    }

    // 다음 달로 이동
    const prev = () => {
        const $divs = document.querySelectorAll('#input-list > div');
        $divs.forEach((e) => {
            e.remove();
        });
        const $btns = document.querySelectorAll('#input-list > button');
        $btns.forEach((e) => {
            e.remove();
        });

        if(pageFirst.getMonth() === 1){
            // 1월이면
            pageFirst = new Date(first.getFullYear - 1, 12, 1); // 전년도 12월로
            first = pageFirst;
            if(first.getFullYear() % 4 === 0){
                // 윤년이면
                pageYear = leafYear;
            } else {
                // 윤년이 아니면
                pageYear = notleafYear;
            }
        } else {
            pageFirst = new Date(first.getFullYear, first.getMonth - 1, 1);
            first = pageFirst;
        }
    }

</script>











<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>