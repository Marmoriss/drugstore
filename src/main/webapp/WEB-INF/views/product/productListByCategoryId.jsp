<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 헤더영역 -->
<jsp:include page="/WEB-INF/views/product/test.jsp">
	<jsp:param value="카테고리별 목록" name="title" />
</jsp:include>

<!-- 카테고리 박스 안의 글꼴 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
	
<!-- 사용자 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/product/product-list.css" />

<!-- 상단영역 -->
<div id="main">
	<!-- 타이틀 -->
	<section class="goodsCate_wrap">
		<div class="title-wrapper">
			<h3 class="goods-list">카테고리별</h3>
		</div>
		<br />
		<!-- 대분류/소분류 카테고리별 세팅 -->
		<div class="goodsCate-li-wrap">
			<table>
				<tbody>
					<tr>
						<td class="listItem" style="font-weight: bolder">
							<a id="listItem" href="${pageContext.request.contextPath}/product/productList.do">성분</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350005">비타민</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350006">철분</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350007">오메가3</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350008">칼슘</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350009">콜라겐</a>
						</td>
					</tr>
					<tr>
						<td class="listItem" style="font-weight: bolder">
							<a id="listItem" href="${pageContext.request.contextPath}/product/productList.do">성별</a></td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350010">여성</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350011">남성</a>
						</td>
						<td><a href="#"></a></td>
						<td><a href="#"></a></td>
						<td><a href="#"></a></td>
					</tr>
					<tr>
						<td style="font-weight: bolder">
							<a id="listItem" href="${pageContext.request.contextPath}/product/productList.do">신체</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350012">눈</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350013">소화기관</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350014">피로감</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350015">면역</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350016">심혈관계</a>
						</td>
					</tr>
					<tr>
						<td class="listItem" style="font-weight: bolder;">
							<a id="listItem" href="${pageContext.request.contextPath}/product/productListByCategoryId.do?categoryId=350004">정기구독</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	<div class="goods-totalList-wrapper">
		<!-- 상품 리스트 목록 보여야함. 이미지/상품명/가격 -->
		<!-- 만약 대분류였다면 -->
		<div class="goods-sort-wrapper">
			<select class="goods-sort-select">
				<option value="0" selected>전체보기</option>
				<option value="1" id="recentList">최신순</option>
				<option value="2" id="priceList">낮은 가격순</option>
				<option value="3" id="priceListDesc">높은 가격순</option>			
			</select>
		</div>
		<div class="goods-setting-wrapper">
			<input type="hidden" name="categoryId" id="categoryId" value="${listByCategoryId[0].categoryId}" />
			<c:forEach items="${listByCategoryId}" var="cri" >
				<ul class="goods-box">
					<li class="goods-item">
						<div class="goodsImg">
							<!-- 리스트로 불러왔을때 여러장의 사진으로 상품코드는 하나이나 여러개가 나옴. 썸네일 1개만 갖고오는 방법 -->
							<img src="${pageContext.request.contextPath}/resources/upload/product/${cri.attachments[0].renamedFilename}"/>
						</div>
						<div class="goodsTitle">
							<a href="${pageContext.request.contextPath}/product/productDetail.do?pcode=${cri.pcode}">${cri.pname}</a>
						</div>
						<div class="goodsPrice"><fmt:formatNumber value="${cri.price}" pattern="#,###원" /></div>
					</li>
				</ul>
			</c:forEach>
		</div>
	</div>
<!-- 	<div class="pagebar-wrap"> -->
<%-- 		<nav class="pagebar">${pagebar}</nav> --%>
<!-- 	</div> -->
</div>
<script>

const renderProduct = (response, wrapperName) => {
	const wrapper = document.querySelector(wrapperName);
	
	let html =  '';
	
	if(response.length){
		response.forEach((product) => {
			const {attachments, pcode, categoryId, sttenmtNo, pname, manu, price, amount, ingreName, mainFnctn, intakeHint1, srvUse, distbPd,
				subYn, saleStatus, createdAt, updatedAt, discount} = product;
			console.log(pcode);
			console.log(pname);
			
			console.log(attachments[0].renamedFilename);
			
			html += `
				<input type="hidden" name="categoryId" id="categoryId" value="\${categoryId}" />
				<ul class="goods-box">
					<li class="goods-item">
						<div class="goodsImg">
							<img src="${pageContext.request.contextPath}/resources/upload/product/\${attachments[0].renamedFilename}"/>
						</div>
						<div class="goodsTitle">
							<a href="${pageContext.request.contextPath}/product/productDetail.do?pcode=\${pcode}">\${pname}</a>
						</div>
						<div class="goodsPrice">\${price}원</div>
					</li>
				</ul>
			`;
		})
	} else {
		html += `
			<div>
				검색된 결과가 없습니다.
			</div>
		`;
	}
	
	wrapper.innerHTML = html;
	console.log("끝");
};
//ajax 시작 
//최신순
document.querySelector('.goods-sort-select').addEventListener('change', (e) => {

    console.log(e.target.value);
    
    const categoryId = document.querySelector('.categoryId');
    const selectValue = e.target.value;
    const wrapper = document.querySelector('.goods-setting-wrapper');
    
	if(selectValue == 0) {
		$.ajax({
			url: "${pageContext.request.contextPath}/product/totalList.do",
			dataType: "json",
			success(list){
				console.log(list);
				wrapper.innerHTML = ""; // 초기화
				
				renderProduct(list, '.goods-setting-wrapper');
			},
			error: console.log
		});
		
	}
			    
	if(selectValue == 1){
		console.log("최신순");
		const categoryId = document.querySelector('#categoryId').value;
		
		$.ajax({
			url: "${pageContext.request.contextPath}/product/recentList.do",
			dataType: "json",
			data: {categoryId},
			success(list){
				console.log(list);
				wrapper.innerHTML = ""; // 초기화
				
				renderProduct(list, '.goods-setting-wrapper');
			},
			error: console.log
		});
	}
	
	if(selectValue == 2){
		console.log("낮은 가격순");
		const categoryId = document.querySelector('#categoryId').value;
		
		$.ajax({
			url: "${pageContext.request.contextPath}/product/priceList.do",
			dataType: "json",
			data: {categoryId},
			success(list){
				console.log(list);
				wrapper.innerHTML = ""; // 초기화
				
				renderProduct(list, '.goods-setting-wrapper');
			},
			error: console.log
		});
		
	}
	
	if(selectValue == 3){
		console.log("높은 가격순");
		const categoryId = document.querySelector('#categoryId').value;
		
		$.ajax({
			url: "${pageContext.request.contextPath}/product/priceListDesc.do",
			dataType: "json",
			data: {categoryId},
			success(list){
				console.log(list);
				wrapper.innerHTML = ""; // 초기화
				
				renderProduct(list, '.goods-setting-wrapper');
			},
			error: console.log
		});
	}
	
	
});


</script>

<br />
<br />
<br />
<br />


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>