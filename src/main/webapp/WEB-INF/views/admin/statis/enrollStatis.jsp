<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="통계" value="헬로우 스프링" />
</jsp:include>
<style>
#chart1{
	float:left;
	margin-left: 300px;
	margin-top: 70px;
}
#chart2{
	float:left;
	margin-top: 70px;

}
.navbar-brand {
	margin-left: 250px;
}
</style>
<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand">가입자 수 통계</a> </nav>
		
<div id="chart1">
	<canvas id="myChart" width="600" height="400"></canvas>
</div>

<div id="chart2">
	<p style="margin-left: 250px;">건강설문자 성비</p>
	<canvas id="myChart2" width="600" height="400"></canvas>
</div>


<input type="hidden" id="memMinus1" value="${memMinus1}" />
<input type="hidden" id="memMinus2" value="${memMinus2}" />
<input type="hidden" id="memMinus3" value="${memMinus3}" />
<input type="hidden" id="memMinus4" value="${memMinus4}" />
<input type="hidden" id="memMinus5" value="${memMinus5}" />
<input type="hidden" id="memMinus6" value="${memMinus6}" />
<input type="hidden" id="memMinus7" value="${memMinus7}" />
<input type="hidden" id="memToday" value="${memToday}" />
<input type="hidden" id="serveyFcount" value="${serveyFcount}" />
<input type="hidden" id="serveyMcount" value="${serveyMcount}" />

<script>
const ctx = document.getElementById('myChart');
const myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['7일전', '6일전', '5일전', '4일전', '3일전', '2일전', '1일전','오늘'],
        datasets: [{
            label: '회원가입 수',
            data: ['${memMinus7}','${memMinus6}','${memMinus5}','${memMinus4}','${memMinus3}','${memMinus2}','${memMinus1}','${memToday}'],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 2
        }]
    },
    options: {
    	responsive: false,
        scales: {
            yAxes: [{
            	ticks:{
                	beginAtZero: true
            	}
            }]
        },
    }
});

const ctx2 = document.getElementById('myChart2');
const myChart2 = new Chart(ctx2, {
    type: 'pie',
    data: {
        labels: ['남','여'],
        datasets: [{
            data: ['${serveyMcount}','${serveyFcount}'],
            backgroundColor: [
                'rgb(30,187,215)',
                'rgb(255,147,172)' 
            ],
            borderColor: [
                'rgba(30,187,215, 1)',
                'rgba(255,147,172, 1)'

            ],
            borderWidth: 2
        }]
    },
    options: {
    	responsive: false,
        scales: {
            yAxes: [{
            	ticks:{
                	beginAtZero: true
            	}
            }]
        },
    }
});

</script>


</body>
</html>