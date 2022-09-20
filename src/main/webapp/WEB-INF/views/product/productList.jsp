<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 헤더영역 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="카테고리별 목록" name="title"/>
</jsp:include>

<style>
	#main {
		margin-top: 60px;
	} 
	
	table {
		width: 620px;
		height: 130px;
		margin: auto;
		margin-left: auto; 
		margin-right: auto;
	}
	
	.goodsCate-li-wrap {
		border: 1px solid darkgray;
		width: 700px;
		margin: auto;
	}
	
	.goodsCate-table {
		width: 300px; 
		border: 1px solid #000000; 
		list-style-type: none;
		border-top: none; 
		border-right: none;
		list-style:none; 
		margin:1px;
	}
	
	.goodsCate-table a {
		text-align:center;
	}
	
	.listItem {
		color: #7A9EB1;
	}
	
	.list-title {
		box-sizing: border-box; 
		width: 100px; 
		float: left; 
		text-align: center; 
		margin: 0; 
		position: relative;
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
						<td class="listItem" style="font-weight:bolder"><a href="#">성분</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350005">비타민</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350006">철분</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350007">오메가3</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350008">칼슘</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350009">콜라겐</a></td>
					</tr>
					<tr>
						<td class="listItem" style="font-weight:bolder"><a href="#">성별</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350010">여성</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350011">남성</a></td>
						<td><a href="#"></a></td>
						<td><a href="#"></a></td>
						<td><a href="#"></a></td>
					</tr>
					<tr>
						<td class="listItem" style="font-weight:bolder"><a href="#">신체</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350012">눈</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350013">소화기관</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350014">피로감</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350015">면역</a></td>
						<td><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350016">심혈관계</a></td>
					</tr>
					<tr>
					<td class="listItem" style="font-weight:bolder;"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350004">정기구독</a></td>
					</tr>
				</tbody>
			</table>
<%-- 			<ul class="goodsCate-table">
				<!-- 성분별 -->
				<li class="list_title big"><a href="#">성분</a></li>
		        <li class="list_title"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350005">비타민</a></li>
		        <li class="list_title"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350006">철분</a></li>
	            <li class="list_title"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350007">오메가3</a></li>	              
	            <li class="list_title"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350008">칼슘</a></li>
		        <li class="list_title"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350009">콜라겐</a></li>
			</ul>
			<ul class="goodsCate-table">
				<!-- 성별 -->
				<li class="list_title big"><a href="#">성별</a></li>
				<li class="list_title"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350010">여성</a></li>
		        <li class="list_title"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350011">남성</a></li>
			</ul>
			<ul class="goodsCate-table">
				<!-- 신체 -->
				<li class="list_title big"><a href="#">신체</a></li>
		        <li class="list_title"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350012">눈</a></li>
		        <li class="list_title"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350013">소화기관</a></li>
		        <li class="list_title"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350014">피로감</a></li>
		        <li class="list_title"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350015">면역</a></li>
		        <li class="list_title"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350016">심혈관계</a></li>
			</ul>
			<ul class="goodsCate-table">
				<!-- 정기구독 -->
		        <li class="list_title big"><a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350004">정기구독</a></li>
			</ul>		 --%>
		</div>
	</section>
	<!-- 상품 리스트 ~개의 상품 & 추천순인기순어쩌구 -->
	<div class="goods-list_setting-wrapper">
		<div class="goods-list_count"></div><!-- 개의 상품 -->
			<div class="goods-list__sort-wrapper">
				<select class="goods-list__sort goods-list__sort-select">
					<option value="popular">인기순</option>
					<option value="low_price">낮은 가격순</option>
					<option value="high_price">높은 가격순</option>
				</select>
			</div>
		</div>
	<div id="" class="designCategoryGoodsDisplay" designelement="categoryGoodsDisplay">
	<div class="display-lattice-a displayTabContentsContainer goods-list__container">
		<div class="goods-list__content">
			<div class="goodsDisplayWrap goods-list__wrap">
				<div class="goodsDisplayItemWrap">
					<div class="goodsDisplayImageWrap goods-list__img-wrap" goodsinfo="" onclick="" style="boarder: 0px;"></div>
					<div class="goodsDisplayTextWrap goods-list__text-wrapper" style="text-allign:left;">
						<!-- 상품명 ex: 나우푸드 비타민 D3 어쩌고 저쩌고 -->
						<div class="goods-list__goods-name">
							<a href="" onclick=""></a>
						</div>
						<div class="goods-list__price-wrapper">
							<!-- 가격이 적혀야함 -->
							<div class="goods-list__price goods-list__price--sale default"></div>
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
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>