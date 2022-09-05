<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="장바구니" name="title"/>
</jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cart/cart.css" />

<main>
	<section>
		<article>
	<div class="content-wrap">
		<form action="${pageContext.request.contextPath}/cart/cartOrder" name="memberOrderFrm" method="post">
			
	<div class="cart-product-header">장바구니</div>
		<table class="cart-product">
			<thead>
				<tr>
					<th class="checkbox">
						<input type="checkbox" name="allCheck" id="allOrder" />
					</th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>배송구분</th>
					<th>배송비</th>
					<th>합계</th>
					<th>선택</th>
				</tr>
			</thead>
			<tbody>
			  	<c:if test="${empty list}">
					<tr>
						<td colspan="9" class="text-center">장바구니에 상품이 없습니다.<br><button type='button'>쇼핑하러 가기</button></td>
					</tr>
				</c:if>
				<c:if test="${not empty list}">
					<c:forEach items="${list}" var="cartList">
						<tr data-no="${cartList.cart.cartNo}">
							<td class="checkbox">
									<span>
										<input type="checkbox" name="checkbox" id="selectOrder" value="${cartList.cart.cartNo}"/>
									</span>						
							</td>
							<td id="productImg">
									<div id="product-img-wrap">
										<img src="${pageContext.request.contextPath}/upload/admin/${cartList.productAttachment.renamedFilename}" alt="" />
										
									</div>
								</td>
							<td id="productInfo">
									<div class="productName" class="strong">${cartList.product.pName}</div>
									<input type="hidden" name="productCode" value="${cartList.product.pCode}" />
									<input type="hidden" name="cartNo" value="${cartList.cart.cartNo}" />
							</td>
							<td><span><span>${cartList.product.price}</span>원</span></td>
							<td>
								<span>${cartList.cart.amount}</span>
								<input type="hidden" name="cartAmount" value="${cartList.cart.amount}" />
							</td>
							<td><span>기본</span></td>
							<td><span><span id="productPrice">${cartList.product.price}*${cartList.cart.amount}</span>원</span></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
				<td colspan="9" id="orderProductPrice">총 금액<span id="productTotalPrice"></span>원 + 배송비 <span id="fee">3,000</span> = 합계 : <span id="totalPrice" class="strong"></span>원</td>
				</tr>
			</tfoot>
		</table>
		<div class="delete-wrap">
			<span>선택상품</span>
			<button id="delBtn" type="button">삭제하기</button>
		</div>
			<div class="total-info-wrap">
				<table class="total">
					<thead>
						<tr>
							<th>총 주문 금액</th>
							<th>총 배송비</th>
							<th>총 결제예정 금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span class="display"><span id="orderPrice"></span>원</span></td>
							<td><span class="display"><span>3,000원</span></span></td>
							<td><span class="display">= <span id="total" class="strong"></span>원</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="order-wrap">
				<button id="order-btn" type="button">상품주문</button>
			</div>
		</form>
	</div>
	</article>
	</section>
</main>
<script>
const select = document.querySelectorAll("#selectOrder");



document.querySelector("#allOrder").addEventListener('click', (e) => {
	[...select].forEach((check) => {
		check.checked = e.target.checked
	});
});

document.querySelector("#order-btn").addEventListener('click', (e) => {
	const count = $("input:checkbox[name=checkbox]:checked").length;

	if(count == 0) {
		alert('하나 이상의 상품을 반드시 선택해주세요.');
		e.preventDefault();
		return;
	}
	document.memberOrderFrm.submit();
});

document.querySelector("#delBtn").addEventListener('click', (e) => {
	let delCartNo = [];
	
	if(!confirm('해당 상품을 삭제하시겠습니까?')) return;
	
	for(let i = 0; i < select.length; i++) {
		if(select[i].checked == true) {
			delCartNo.push(select[i].value);
		}
	}

	// 비동기로 삭제
	$.ajax({
		url : "${pageContext.request.contextPath}/cart/cartDelete.do",
		type : "POST",
		data : {delCartNo},
		traditional:true,
		success(response) {
			location.reload();
		},
		error : console.log
	});
});

window.addEventListener('load', (e) => {
	const productPrices = document.querySelectorAll("#productPrice");
	const productTotalPrice = document.querySelector("#productTotalPrice");
	const totalPrice = document.querySelector("#totalPrice");
	const orderPrice = document.querySelector("#orderPrice");
	const total = document.querySelector("#total");
	const fee = document.querySelector("#fee");
	
	const productPrice = [...productPrices].map((product) => Number(product.innerHTML.replace(",",""))).reduce((total, price) => {
		return total + price;
	});
	
	productTotalPrice.innerHTML = productPrice.toLocaleString('ko-KR');
	orderPrice.innerHTML = productTotalPrice.innerHTML;
	totalPrice.innerHTML = (productPrice + Number(fee.innerHTML.replace(",",""))).toLocaleString('ko-KR');
	total.innerHTML = totalPrice.innerHTML;
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>