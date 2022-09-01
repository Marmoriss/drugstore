<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="카테고리별 목록" name="title"/>
</jsp:include>
<!-- 상단영역 -->
<div id="layout_config_full">
<style>
	#layout_config {
		margin-top: 60px;
	} 
</style>
<!-- 타이틀 -->
	<div>
		<h3 class="goods-list__title">카테고리별</h3>
	</div>
	<!-- 카테고리별 세팅 -->
	<div class="goods-list-menu__wrapper goods-list-menu__wrapper--brands-list-menu__wrapper--category">
		<ul class="goods-list-menu goods-list-menu--brand">
			<!-- 카테고리별 소분류 -->
			<li class="goods-list-menu__item goods-list-menu__item--brand"></li>
			<li class="goods-list-menu__item goods-list-menu__item--brand"></li>
			<li class="goods-list-menu__item goods-list-menu__item--brand"></li>
			<li class="goods-list-menu__item goods-list-menu__item--brand"></li>
			<li class="goods-list-menu__item goods-list-menu__item--brand"></li>
		</ul>
	</div>
	<!-- 카테고리별 상단 모달창. 일단 코드 넣지 않겠음 -->
	<!-- 상품 리스트 ~개의 상품 & 추천순인기순어쩌구 -->
	<div class="goods-list__setting-wrapper">
		<div class="goods-list__count"></div><!-- 개의 상품 -->
			<div class="goods-list__sort-wrapper">
				<select class="goods-list__sort goods-list__sort-select">
					<option value="popular">추천순</option>
					<option value="review">평점많은순</option>
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