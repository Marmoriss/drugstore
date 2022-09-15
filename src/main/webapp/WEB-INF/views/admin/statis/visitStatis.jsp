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
#myChart{
	margin-left:550px;
	margin-top: 100px;
	
}
.navbar-brand {
	margin-left: 250px;
}
</style>
<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand">방문자 수</a> </nav>
<canvas id="myChart" width="600" height="400"></canvas>

<input type="hidden" id="todayCount" value="${todayCount}" />
<input type="hidden" id="totalCount" value="${totalCount}" />

<script>
const ctx = document.getElementById('myChart');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['오늘 방문자','전체 방문자'],
        datasets: [{
            label: '방문자 수',
            data: ['${todayCount}','${totalCount}'],
            backgroundColor: [
            	'rgba(54, 162, 235, 0.2)',
                'rgba(255, 99, 132, 0.2)'
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
                'rgba(255,99,132,1)'
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