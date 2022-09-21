<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 카테고리 박스 안의 글꼴 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- 헤더영역 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="카테고리별 목록" name="title"/>
</jsp:include>

<style>
	#main {
		margin-top: 60px;
	} 
	
	.goods-list {
		font-weight: bold;
		margin: 20px;
		margin-left:190px;
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
		font-size: 13px;
		color: #727272;
		font-family: 'Noto Sans KR', sans-serif;
	}

	#listItem {
		text-align:center;
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
	
	.goods-count {
		margin-left: 500px;
	}
	
</style>

<!-- 상단영역 -->
<div id="main" style="padding-top:350px;">
<!-- 타이틀 -->
<section class="goodsCate_wrap">
	<div>
		<h3 class="goods-list">카테고리별</h3>
	</div>
	<br/>
	<!-- 대분류 카테고리별 세팅 -->
		<div class="goodsCate-li-wrap">
			<table>
				<tbody>
					<tr>
						<td class="listItem" style="font-weight:bolder"><a id="listItem" href="#">성분</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350005">비타민</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350006">철분</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350007">오메가3</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350008">칼슘</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350009">콜라겐</a></td>
					</tr>
					<tr>
						<td class="listItem" style="font-weight:bolder"><a id="listItem" href="#">성별</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350010">여성</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350011">남성</a></td>
						<td><a href="#"></a></td>
						<td><a href="#"></a></td>
						<td><a href="#"></a></td>
					</tr>
					<tr>
						<td style="font-weight:bolder"><a id="listItem" href="#">신체</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350012">눈</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350013">소화기관</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350014">피로감</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350015">면역</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350016">심혈관계</a></td>
					</tr>
					<tr>
					<td class="listItem" style="font-weight:bolder;">
					<a id="listItem" href="${pageContext.request.contextPath}/product/productList.do?categoryId=350004">정기구독</a>
					</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	
	<br/>
	<br/>
</div>
	<div class="goods-sort-wrapper">
		<select class="goods-sort-select">
			<option value="popular">최신순</option>
			<option value="low_price">낮은 가격순</option>
			<option value="high_price">높은 가격순</option>
		</select>
	</div>
	<br />
	<br />
	<!-- 상품 리스트 목록 보여야함. 이미지/상품명/가격 -->
		<div class="goods-setting-wrapper">
			<c:forEach var="list" items="${list}">
				<li>
					<div class="goodsImg">
						<a href="${pageContext.request.contextPath}/product/productDetail.do?categoryId=${list.pcode}"></a>
					</div>
					<div class="goodsTitle">
						<a href="${pageContext.request.contextPath}/product/productDetail.do?categoryId=${list.pcode}">${list.pname}</a>
					</div>
					<div class="goodsPrice">${list.price}</div>
				</li>
			</c:forEach>
		</div>
		
	<nav>
	${pagebar}
	</nav>
	
	<br />
	<br />
	<br />
	<br />
<%-- 			<div class="goods-count">
			

		
		<br />
		<br />
		
		<div class="display-container">
		<!-- 상품목록 시작 -->
			<div class="goods-content">
				<table>
					<thead>
						<tr>
							<!-- 상품 이미지가 보여야함 -->
							<th>
								<a href="" src="" />
							</th> 
							<th></th>
							<th></th>
						</tr>
					</thead>
				</table>
				<div class="goodsDisplayImage"></div><!-- 이미지 사진 들어가야함  -->
					<div class="goodsDisplay-listwrapper" style="text-allign:left;">
							<!-- 상품명 ex: 나우푸드 비타민 D3 어쩌고 저쩌고 -->
							<div class="goods-name">
								<a href="" onclick=""><!-- 상품이름들어가야함 --></a>
							</div>
							<div class="goods-price-wrapper">
								<!-- 가격이 적혀야함 -->
								<div class="goods-price">${list}</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="goodsDisplayWrap goods-list__wrap"></div>
			<div class="goodsDisplayWrap goods-list__wrap"></div>
			<div class="goodsDisplayWrap goods-list__wrap"></div>
		</div>
		<div class=goods-list_content>
				<div class="goodsDisplayWrap goods-list__wrap">
					<div class="goodsDisplayItemsWrap">
						<div class="goodsDisplayImageWrap goods-list__img-wrap"></div>
					</div>
				</div>
		</div>
	</div>
</div> --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>