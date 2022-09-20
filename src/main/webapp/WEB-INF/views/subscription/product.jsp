<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="구독상품" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/subscription/subscription.css" />

<body>
	<div id="wrapper">
		<section id="product">
			
			<ul>
				<c:forEach items="${productList}" var="product">
					<li>
					<div class="productDiv">
								<div id="header">
								<h4>${product.pname}</h4>
								</div>
								<div id="img-container">
									<img src="${pageContext.request.contextPath}/resources/images/products/${product.pname}.jpg" style="width: 300px; height: 200px; border-radius: 20px;" alt="" />
									
								</div>
								<div id="content">
								<p align="left">
									${product.mainFnctn}
								</p>
								</div>
								<form action="${pageContext.request.contextPath}/subscription/subscriptionEnroll.do" method="post">
									<input type="hidden" name="memberId" value='<sec:authentication property="principal.memberId"/>' />	
									<input type="hidden" name="pcode" value="${product.pcode}" />
								</form>
								<div id="footer"><button>구독하기</button></div>
					</div>
					</li>				
				</c:forEach>
			</ul>
		</section>		
	</div>
<script>

</script>

</body>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>