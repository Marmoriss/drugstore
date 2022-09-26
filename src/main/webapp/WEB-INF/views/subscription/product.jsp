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
										<a href="${pageContext.request.contextPath}/product/productDetail.do?pcode=${product.pcode}">
									<img src="${pageContext.request.contextPath}/resources/upload/product/${product.attachments[0].renamedFilename}" alt="이미지" style="width: 230px; height: 200px;" />
										</a>
								</div>
								<div id="content">
								<p align="left">
									${product.mainFnctn}
								</p>
								</div>
								
								<div id="footer">
								<form:form id="subscriptionFrm" action="${pageContext.request.contextPath}/subscription/subscriptionEnroll.do" method="post">
									<input type="hidden" name="memberId" value='<sec:authentication property="principal.memberId"/>' />	
									<input type="hidden" name="pcode" value="${product.pcode}" />
									<input type="hidden" name="categoryId" value="${product.categoryId}" />
									<button type="button" onclick="checkSubscription()" >구독하기</button>
								</form:form>
								</div>
					</div>
					</li>				
				</c:forEach>
			</ul>
		</section>		
	</div>
<script>
const headers = {};
headers['${_csrf.headerName}'] = '${_csrf.token}';
	const checkSubscription = (e) =>{
		$.ajax({
		url : "${pageContext.request.contextPath}/subscription/subscriptionCheck.do",
		type : "post",
		headers,
		dataType : "json",
		success(response){
			console.log(response);
			if(!response){
				alert("이미 구독 중인 상품이 있습니다.");
				location.href = "${pageContext.request.contextPath}/member/memberSubscription.do";
				
			}else{				
				$('#subscriptionFrm').submit();
			}
			
			
		},
		error : console.log
	})
		
		
	}
	
</script>

</body>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>