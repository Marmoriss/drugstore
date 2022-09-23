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
</style>

<!-- 상단영역 -->
<div id="main">
<!-- 타이틀 -->
<section>
	<div>
		<h3 class="goods-list">카테고리별</h3>
	</div>
	<section class="goodsCate_wrap">
	<!-- 카테고리별 세팅 -->
	<div class="goodsCate_btn_wrap">
		<button type="button" class="goods-list-menu item">전체</button>
		<button type="button" class="goods-list-menu item">성분</button>
		<button type="button" class="goods-list-menu item">연령</button>
		<button type="button" class="goods-list-menu item">신체부위</button>
		<!-- 주희 코드 시작 -->
		<a href="${pageContext.request.contextPath}/product/productList.do?categoryId=350005">비타민</a>
		<!-- 주희 코드 끝 -->			
	</div>
	</section>
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
	
	</section>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>