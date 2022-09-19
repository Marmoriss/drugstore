<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="주문" value="헬로우 스프링" />
</jsp:include>
<style>
.navbar-brand {
	margin-left: 250px;
}
#orderList {
	margin-left: 500px;
}

#statusBtn {
	width:40px;
	height: 25px;
}
#invoiceNum {
	height: 25px;
}
</style>
	<nav class="navbar navbar-light bg-light">
			<a class="navbar-brand">주문관리</a> </nav>
			
	<table id="orderList" class="table w-50">
	  <thead>
	    <tr>
	      <th>주문번호</th>
	      <th>주문자</th>
	      <th>결제금액</th>
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
			<tr data-no="${order.merchantUid}">
				<td>${order.merchantUid}</td>
				<td>${order.memberId}</td>
				<td>${order.totalPrice}</td>
				<td>${order.paidAt}</td>
				<td>${order.status}</td>
				<td>
					<input id="invoiceNum" class="form-control form-control-sm" type="text" placeholder="송장번호입력">
				</td>
				<td>
					<button type="button" id="statusBtn"
					onclick="location.href='${pageContext.request.contextPath}/admin/order/statusUpdate.do?merchantUid=${orders.merchantUid}';">확인</button>  
				</td>
			</c:forEach>
		</c:if>
	
	</table>
<script>
<script>
document.querySelectorAll("#statusBtn").forEach((btn) => {
	btn.addEventListener('click', (e) => {
		const merchantUid = e.target.dataset.merchantUid;
		const status = '배송중';
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/order/statusUpdate.do}",
			type : "POST",
			data : {merchantUid,status},
			success(response) {
				location.reload();
			 },
			error : console.log
		}); 
	})
})
</script>

</body>
</html>