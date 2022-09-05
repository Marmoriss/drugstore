<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="회원목록" value="헬로우 스프링" />
</jsp:include>
		<div class="member-content">
			<h4>회원목록</h4><br />
			<table class="table table-bordered">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>가입일</th>
			<!-- 		<th>성별</th>
					<th>고민부위</th> -->
				</tr>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6" class="text-center">해당 회원이 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty list}">
					<c:forEach items="${list}" var="member">
						<tr data-no="${member.memberId}">
							<td>${member.name}</td>
							<td>${member.phone}</td>
							<td>
								<fmt:parseDate value="${member.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt}"/>
								<fmt:formatDate value="${createdAt}" pattern="YYYY년.MM월.dd일"/>
							</td>
						
						</tr>
					</c:forEach>
				</c:if>

			</table>

		</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
