<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="마이페이지" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberMyPage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/wishList.css" />
<body>	
	<div id="layout_config">
        <!-- 좌측 네브바 -->
        <div id="layout_side">
            <div class="mypage-common-side__wrapper">
                <h2 class="mypage-common-side__title">마이페이지</h2>
                <div class="mypage-common-side__item">
                    <h3 class="mypage-common-side__title-sub">나의 쇼핑 정보</h3>
                    <ul class="mypage-common-side__list">
                        <li class="mypage-common-side__link">
                            <a href="${pageContext.request.contextPath}/member/memberOrder.do">주문/배송내역</a>
                        </li>
                        <li class="mypage-common-side__link">
                            <a href="">위시리스트</a>
                        </li>
                    </ul>
                </div>
                <div class="mypage-common-side__item">
                    <h3 class="mypage-common-side__title-sub">나의 활동</h3>
                    <ul class="mypage-common-side__list">
                        <li class="mypage-common-side__link">
                            <a href="${pageContext.request.contextPath}/member/memberSubscription.do">정기구독</a>
                        </li>
                        <li class="mypage-common-side__link">
                            <a href="${pageContext.request.contextPath}/notice/noticeList.do">1:1문의</a>
                        </li>
                        <li class="mypage-common-side__link">
                            <a href="">상품 리뷰</a>
                        </li>
                        <li class="mypage-common-side__link">
                            <a href="">상품 문의</a>
                        </li>
                    </ul>
                </div>
                <div class="mypage-common-side__item">
                    <h3 class="mypage-common-side__title-sub">나의 계정</h3>
                    <ul class="mypage-common-side__list">
                        <li class="mypage-common-side__link">
                            <a href="${pageContext.request.contextPath}/member/updateMember.do">회원정보 수정</a>
                        </li>
                        <li class="mypage-common-side__link">
                            <a href="" id="servey">설문결과 확인</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 우측 content 영역 -->
        <div id="layout_config_body">
            <!-- 본문내용 시작 -->
            <div class="product-recently">
            	<form:form name="wish_form" id="wish_form" method="post" action="${pageContext.request.contextPath}/wish/deletePickedList.do">
            		<div class="product-recently__title">
            			<div>
            				<h3 class="product-list__title">위시리스트</h3>
            			</div>
            		</div>
            		<div class="product-recently__top">
            			<label for="allChk" class="product-recently__all-chk btn_select_all">
            				<input type="checkbox" id="allChk" class="product-recently__all-chk-input hide" />
            				<div class="product-recently__all-chk-box"></div>
            				<p class="product-recently__all-chk-title">전체선택</p>
            			</label>
            			<button class="btn_select_del product-recently__choice-delete">선택삭제</button>
            		</div>
            		<div class="wish_wrap product-recently__contents">
            			<ul class="product-recently__list">
            				<c:if test="${not empty list}">
            					<c:forEach items="${list}" var="wish" varStatus="vs">
		            				<li class="img product-recently__item">
		            					<div class="product-recently__img-wrap">
			            					<label for="product-${wish.pcode}" class="product-recently__item-chk">
			            						<input type="checkbox" name="pcode" id="product-${wish.pcode}" class="product-recently__item-chk-input hide" value="${wish.pcode}"/>
			            						<div class="product-recently__item-chk-box"></div>
			            					</label>
			            					<a href="${pageContext.request.contextPath}/product/productDetail.do?pcode=${wish.pcode}" class="product-recently__img-link">
			            						<img src="${pageContext.request.contextPath}/resources/upload/product/${wish.renamedFilename}" class="product-recently__img" />
			            					</a>
		            					</div>
		            					<ul class="product-recently__info">
		            						<li>
		            							<p class="product_name product-recently__pname">${wish.pname}</p>
		            							<div class="cart_price product-recently__price">
		            								<p class="product-recently__price-text">
		            									<fmt:formatNumber value="${wish.price - wish.discount}" pattern="#,###"/>
				            						</p>
		            								<p class="product-recently__price-origin">
		            									<fmt:formatNumber value="${wish.price}" pattern="#,###"/>
		            								</p>
		            							</div>
		            							<div class="cart_goods_sum product-recently__btn-wrap">
		            								<input type="hidden" name="cartPcode" id="cartPcode" value="${wish.pcode}" />
                                  					<input type="hidden" name="cartAmount" id="cartAmount" value="1" />
		            								<button name="cart" id="addCart" class="wishcart product-recently__btn">장바구니</button>
		            							</div>
		            						</li>
		            					</ul>
		            				</li>
	            				</c:forEach>
            				</c:if>
            			</ul>
            		</div>
            	</form:form>
            </div>
            <!-- // 본문내용 끝 -->
        </div>
    </div>
</body>

<script>
document.querySelector('#allChk').addEventListener('click', (e) => {
	const allCheck = e.target;
	const productCheck = document.querySelectorAll('.product-recently__item-chk-input');
	
	if(allCheck.checked){
		productCheck.forEach((checkbox) => {
			checkbox.checked = true;
		});
	} else {
		productCheck.forEach((checkbox) => {
			checkbox.checked = false;
		});
	}
});

const headers = {};
headers['${_csrf.headerName}'] = '${_csrf.token}';
document.querySelector("#addCart").addEventListener('click', (e) => {
	e.preventDefault(); // 제출방지
	const pcode = document.querySelector("[name=cartPcode]").value;
	const amount = document.querySelector("[name=cartAmount]").value;
	console.log(pcode);
	console.log(amount);
	const cartList = {pcode, amount};
	console.log(cartList);
	$.ajax({
		url : "${pageContext.request.contextPath}/cart/findCart.do",
		type : "GET",
		headers,
		data : {pcode},
		success(response) {
			if(response) {
				console.log(response);
				if(confirm('장바구니에 존재하는 상품입니다. 그래도 추가하시겠습니까?')) {
					addCart(cartList);
				} else return;
			} else {
				addCart(cartList);
			}
		},
		error : console.log
		});
	});
const addCart = (cartList) => {
	$.ajax({
	url : "${pageContext.request.contextPath}/cart/addCart.do",
	type : "POST",
	headers,
	data : JSON.stringify(cartList),
	contentType : 'application/json; charset=utf-8',
	success(response) {
		if(confirm('장바구니로 이동하시겠습니까?')){
			location.href = "${pageContext.request.contextPath}/cart/cartList.do";
			return;
		}
	},
	error : console.log
	});
};
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>