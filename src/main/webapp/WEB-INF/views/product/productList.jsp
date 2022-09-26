<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 카테고리 박스 안의 글꼴 폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Gugi&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<!-- 헤더영역 -->
<jsp:include page="/WEB-INF/views/product/test.jsp">
	<jsp:param value="카테고리별 목록" name="title" />
</jsp:include>

<style>
#main {
	margin-top: 60px;
}

.goods-list {
	font-weight: bold;
	margin: 20px;
	margin-left: 190px;
	font-family: 'Noto Sans KR', sans-serif;
}

.goodsCate-li-wrap {
	border: 2px solid darkgray;
	width: 830px;
	margin: auto;
}

table {
	width: 800px;
	height: 140px;
	margin: 20px;
	margin-left: 50px;
	margin-right: 50px;
}

/* 	.goodsCate-table {
		width: 300px; 
		border: 1px solid #000000; 
		list-style-type: none;
		border-top: none; 
		border-right: none;
		list-style:none; 
		margin:1px;
	} */
td a {
	font-size: 16px;
	color: #727272;
	font-family: 'Noto Sans KR', sans-serif;
}

#listItem {
	text-align: left;
	color: #577889;
}

/* 	.list-title {
		box-sizing: border-box; 
		width: 100px; 
		float: left; 
		text-align: center; 
		margin: 0; 
		position: relative;
	} */
.goods-sort-select {
	margin-left: 1020px;
}

/*	.goods-count {
		margin-left: 500px;
	} */
.goods-setting-wrapper {
	display: flex;
	/* flex-direction: row; */
	justify-content: space-between;
	flex-wrap: wrap;
	margin: 70px;
	float: left;
}

.goodsTitle {
	overflow: hidden;
	text-overflow: ellipsis;
}

.goodsTitle, .goodsPrice {
	font-size: 16px;
	font-weight: bold;
	text-align: center;
}

.goods-box {
	list-style: none;
}

.goods-item {
	margin-bottom: 10px;

	/* width: calc(50% - 1px); */
}

.pagebar {
	background-color: #fff;
	margin-top: 20px;
}

.page-item.active .page-link {
	background-color: rgb(65, 88, 101);
	border-color: rgb(65, 88, 101);
}
</style>

<!-- 상단영역 -->
<div id="main">
	<!-- 타이틀 -->
	<section class="goodsCate_wrap">
		<div>
			<h3 class="goods-list">카테고리별</h3>
		</div>
		<br />
		<!-- 대분류/소분류 카테고리별 세팅 -->
		<div class="goodsCate-li-wrap">
			<table>
				<tbody>
					<tr>
						<td class="listItem" style="font-weight: bolder"><a
							id="listItem"
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350001">성분</a></td>
						<td><a
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350005">비타민</a></td>
						<td><a
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350006">철분</a></td>
						<td><a
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350007">오메가3</a></td>
						<td><a
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350008">칼슘</a></td>
						<td><a
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350009">콜라겐</a></td>
					</tr>
					<tr>
						<td class="listItem" style="font-weight: bolder"><a
							id="listItem"
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350002">성별</a></td>
						<td><a
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350010">여성</a></td>
						<td><a
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350011">남성</a></td>
						<td><a href="#"></a></td>
						<td><a href="#"></a></td>
						<td><a href="#"></a></td>
					</tr>
					<tr>
						<td style="font-weight: bolder"><a id="listItem"
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350003">신체</a></td>
						<td><a
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350012">눈</a></td>
						<td><a
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350013">소화기관</a></td>
						<td><a
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350014">피로감</a></td>
						<td><a
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350015">면역</a></td>
						<td><a
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350016">심혈관계</a></td>
					</tr>
					<tr>
						<td class="listItem" style="font-weight: bolder;"><a
							id="listItem"
							href="${pageContext.request.contextPath}/product/productList.do?categoryId=350004">정기구독</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	<br /> <br />
</div>
<div class="goods-totalList-wrapper">
	<!-- 상품 리스트 목록 보여야함. 이미지/상품명/가격 -->
	<!-- 만약 대분류였다면 -->
	<div class="goods-sort-wrapper">
		<select class="goods-sort-select" name="searchList">
			<option selected>전체보기</option>
			<option id="recentList" value="0">최신순</option>
			<option id="priceList" value="1">낮은 가격순</option>
			<option id="priceListDesc" value="2">높은 가격순</option>
		</select>
	</div>
	<br /> <br />
	<div class="goods-setting-wrapper">
		<c:forEach var="cri" items="${bigList}">
			<ul class="goods-box">
				<li class="goods-item">
					<div class="goodsImg">
						<!-- 리스트로 불러왔을때 여러장의 사진으로 상품코드는 하나이나 여러개가 나옴. 썸네일 1개만 갖고오는 방법 -->
						<img
							src="${pageContext.request.contextPath}/resources/upload/product/"
							${product.attachments[0].renamedFilename}" alt="" width="300px"
							height="300px" />
					</div>
					<div class="goodsTitle">
						<a
							href="${pageContext.request.contextPath}/product/productDetail.do?pcode=${cri.pcode}">${cri.pname}</a>
					</div>
					<div class="goodsPrice">
						<fmt:formatNumber value="${cri.price}" pattern="#,###원" />
					</div>
				</li>
			</ul>
		</c:forEach>
	</div>
	<!-- 만약 소분류였다면 -->
	<div class="goods-setting-wrapper">
		<c:forEach var="cri" items="${smallList}">
			<ul class="goods-box">
				<li class="goods-item">
					<div class="goodsImg">
						<!-- 리스트로 불러왔을때 여러장의 사진으로 상품코드는 하나이나 여러개가 나옴. 썸네일 1개만 갖고오는 방법 -->
						<img
							src="${pageContext.request.contextPath}/resources/upload/product/${cri.attachments[0].renamedFilename}"
							alt="" style="width: 300px;" />
					</div>
					<div class="goodsTitle">
						<a
							href="${pageContext.request.contextPath}/product/productDetail.do?pcode=${cri.pcode}">${cri.pname}</a>
					</div>
					<div class="goodsPrice">
						<fmt:formatNumber value="${cri.price}" pattern="#,###원" />
					</div>
				</li>
			</ul>
		</c:forEach>
	</div>
</div>

<nav class="pagebar">${pagebar}</nav>
<script>
//ajax 시작 
//최신순
document.querySelector('.goods-sort-select').addEventListener('change', (e) => {

	const attachment = ${cri.attachments[0].renamedFilename};
    const pcode = ${cri.pcode};
    const pname = ${cri.pname};
    const price = ${cri.price};
    const discount = ${cri.discount};
    
	if($("select[name=searchList]").val() == 0) {
		console.log($(this).val());
		console.log($("select[name=searchList] option:selected".text());
	    
		$.ajax({
			url: "${pageContext.request.contextPath}/product/recentList.do",  
	        data: {categoryId},
	        method: "GET",
	        dataType: "json",
	        success(response) {
	            console.log(response);
	            const wrapper = document.querySelector('#goods-setting-wrapper');
	            wrapper.innerHTML = `<ul class="goods-box" id="goods-box">
										<li class="goods-item">
											<div class="goodsImg">
												<img
													src="${pageContext.request.contextPath}/resources/upload/product/\${cri.attachments[0].renamedFilename}"
													alt="" style="width: 300px;" />
											</div>
											<div class="goodsTitle">
												<a
													href="${pageContext.request.contextPath}/product/productDetail.do?pcode=${cri.pcode}">\${cri.pname}</a>
											</div>
											<div class="goodsPrice">
												<fmt:formatNumber value="\${cri.price}" pattern="#,###원" />
											</div>
										</li>
									</ul>`;
									categoryId.forEach(({attachment, pcode, pname, price}) => {
										wrapper.querySelector("#goods-box").innerHTML += `										<li class="goods-item">
											<div class="goodsImg">
											<img
												src="${pageContext.request.contextPath}/resources/upload/product/\${cri.attachments[0].renamedFilename}"
												alt="" style="width: 300px;" />
											</div>
											<div class="goodsTitle">
												<a
													href="${pageContext.request.contextPath}/product/productDetail.do?pcode=${cri.pcode}">\${cri.pname}</a>
											</div>
											<div class="goodsPrice">
												<fmt:formatNumber value="\${cri.price}" pattern="#,###원" />
											</div>`
										})
									})
	            alert(response.msg);
	        },
	        error: console.log
	    });
	        	
    }else {
	    alert('상품을 불러오는데 실패했습니다.');
	}
	
	
	if($("select[name=searchList]").val() == 1) {
		console.log($(this).val()); 
		console.log($("select[name=searchList] option:selected".text());
		        	    
		$.ajax({
			url: "${pageContext.request.contextPath}/product/pricetList.do",
			data: {categoryId},
			method: "GET",
			dataType: "json",
			success(response) {
				   console.log($(this).val());
				   console.log($("select[name=searchtList] option:selected".text());
				   console.log(response);
				   alert(response.msg);
			},
			error: console.log
		}) // 여기가 ajax  끝 
	} else {
		alert('상품을 불러오는데 실패했습니다.');
	}


	if($("select[name=searchList]").val() == 2) {
		console.log($(this).val());
		console.log($("select[name=searchList] option:selected".text());
			    			        	    
		$.ajax({
			url: "${pageContext.request.contextPath}/product/productList.do?categoryId=${categoryId}/priceListDesc",
			data: {categoryId},
			method: "GET",
			dataType: "json",
			success(response) {
				console.log(response);
				alert(response.msg);
			},
			error: console.log
		}); // ajax 끝
		
	} else {
    	alert('상품을 불러오는데 실패했습니다.');
    }
	
});
    

</script>

<br />
<br />
<br />
<br />


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>