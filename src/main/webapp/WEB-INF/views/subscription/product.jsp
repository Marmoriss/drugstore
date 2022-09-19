<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
								<div id="content">
								<p>
									${product.mainFnctn}
								</p>
								</div>
								<div id="footer"><button>제품보기</button></div>
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