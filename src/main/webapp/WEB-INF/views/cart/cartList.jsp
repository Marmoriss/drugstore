<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="장바구니" name="title"/>
</jsp:include>
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/34c760bbb4.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cart/cart.css" />

<main>
	<section>
		<article>
	<div class="content-wrap">
		<form action="${pageContext.request.contextPath}/cart/cartOrder.do" name="memberOrderFrm" method="GET">
	<div class="cart-product-header">약바구니</div>
		<table class="cart-product">
			<thead>
				<tr>
					<th class="checkbox">
						<input type="checkbox" name="allCheck" id="allOrder" />
					</th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>가격</th>
					<th>수량</th>
					<th>배송구분</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
		
			  	<c:if test="${empty list}">
					<tr>
						<td colspan="8" class="text-center">장바구니에 상품이 없습니다.<br><button type='button'>쇼핑하러 가기</button></td>
					</tr>
				</c:if>
				<c:if test="${not empty list}">
					
					<c:forEach items="${list}" var="cartlist">
						<tr>
							<td class="checkbox">
									<span>
										<input type="checkbox" name="checkbox" id="selectOrder" value="${cartlist.cartNo}"/>
									</span>						
							</td>
							<td id="productImg">
									<div id="product-img-wrap">
									<img
									src="${pageContext.request.contextPath}/resources/upload/product/${cartlist.product.attachments[0].renamedFilename}"
									alt="상품메인이미지" class="product-view__thumb-img" />
									</div>
								</td>
							<td id="productInfo">
							   
									<div class="productName" class="strong">${cartlist.product.pname}</div>
									<input type="hidden" name="productCode" value="${cartlist.product.pcode}" />
									<input type="hidden" name="cartNo" value="${cartlist.cartNo}" />
							
							</td>
							<td>  <span><span><fmt:formatNumber value="${cartlist.product.price}" type="number"/></span>원</span> </td>
							<td>
								<span class=""> <span class="df-base-qty">
												<input 
												id="amount_id_0" name="${cartlist.cartNo}amount" size="2" value="${cartlist.amount}"
												type="text" />
												<!--  name="${cartlist.pcode}"-->
												<a href="javascript:;" style="margin-left: 0px !important;"
												
												onclick="amount_change(${cartlist.cartNo},1)" >
												<img
													src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif"
													alt="증가" class="up" /></a>
													
												<a href="javascript:;" style="margin: 0 !important;" 
												
												onclick="amount_change(${cartlist.cartNo},-1)" >
												<img
													src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif"
													alt="감소" class="down" /></a>
												</span>
												
											<!--  	<a href="javascript:;"
												onclick="button_change_amount(${cartlist.cartNo})" 
												class="df-btn light tiny ml-2">변경</a> -->
												</span> 
								<input type="hidden" name="cartAmount" value="${cartlist.amount}" />
							</td>
							<td><span>기본</span></td>
							<td>  <span><span id="productPrice"><fmt:formatNumber value="${cartlist.product.price*cartlist.amount}" type="number"/></span>원</span></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
				<td colspan="8" id="orderProductPrice">총 <span id="productTotalPrice"></span>원 + 배송비 <span id="fee">3,000</span>  합계 : <span id="totalPrice" class="strong"></span>원</td>
				</tr>
			</tfoot>
		</table>
		<div class="delete-wrap">
			
			<button class="delBtn" id="delBtn" type="button">약바구니 제거</button>
		</div>
			<div class="total-info-wrap">
				<table class="total">
					<thead>
						<tr>
							<th>총 주문 금액</th>
							<th>배송비</th>
							<th>결제 금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span class="display"><span id="orderPrice"></span>원</span></td>
							<td><span class="display"><span>3,000원</span></span></td>
							<td><span class="display"><span id="total" class="strong"></span>원</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="order-wrap">
				<button id="order-btn" type="button">주문하기</button>
			</div>
		</form>
	</div>
	</article>
	</section>
</main>
<script>
const select = document.querySelectorAll("#selectOrder");
const headers = {};
headers['${_csrf.headerName}'] = '${_csrf.token}';



document.querySelector("#allOrder").addEventListener('click', (e) => {
	[...select].forEach((check) => {
		check.checked = e.target.checked
	});
	
});

document.querySelector("#order-btn").addEventListener('click', (e) => {
	const count = $("input:checkbox[name=checkbox]:checked").length;
	
	if(count == 0) {
		alert('하나 이상의 상품을 선택해주세요.');
		e.preventDefault();
		return;
	}
	
	// 클릭한 상품이 정기 구독 상품인지 체크
		let checkCategoryByCartNo = [];

		for(let i = 0; i < select.length; i++) {
			if(select[i].checked == true) {
				checkCategoryByCartNo.push(select[i].value);
			}
		
		
		$.ajax({
			url : "${pageContext.request.contextPath}/product/checkCategory.do",
			type : "POST",
			headers,
			data : {checkCategoryByCartNo},
			traditional:true,
			dataType : "json",
			success(response) {
				for(var i=0; i< response.length; i++){
					
					if(response[i].product.categoryId == 350004){
						document.memberOrderFrm.action = "${pageContext.request.contextPath}/subscription/enrollInfo.do";
						document.memberOrderFrm.submit();
					}
						
				}
			},
			error : console.log
		});
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
		headers,
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


function amount_change(change , val){
	var amount = val;
	var _cartNo = change;
	var origin = $('input[name='+_cartNo+'amount]').val();
	var ps = 0;
	var amountnum = parseInt(origin);
	
	if(amount == -1){ps = amountnum-1;	}
	else{ps = amountnum + 1;}
	
	var cartNo = parseInt(_cartNo);
	if(ps <= 0){
		alert('0개 이하로는 변경할 수 없습니다. ');
		return;
	}
	
	
	$.ajax({
		type : "POST",
		headers,
		url : "${pageContext.request.contextPath}/cart/updateCart.do",
		data : {
			amount : ps,
			cartNo : cartNo
		},
		success : function(){
			location.reload();
		}
	});
	
}



function button_change_amount(val){
	var origin = $('input[name='+val+'amount]').val();
	var pcode = parseInt(val);
	var amount = parseInt(origin);
	if(amount <= 0){
		alert('0개 이하로는 변경할 수 없습니다.');
		location.reload();
		return;
	}
	$.ajax({
		type : "POST",
		headers,
		url : "${pageContext.request.contextPath}/cart/updateCart.do",
		data : {
			amount : amount,
			pcode : pcode
		},
		success : function(){
			location.reload();
		}
	});
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>