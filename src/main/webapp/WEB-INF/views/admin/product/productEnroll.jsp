<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="title" value="헬로우 스프링" />
</jsp:include>

<!-- 사용자 작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/header.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/product-list.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/product-enroll.css"/>

		<!-- admin content 시작 -->
		<div class="admin-content">
			<div id="admin-content" class="admin-sub-frame">
				<div>
					<div class="admin-sub-title">
						<div class="pull-left">
							<h2 class="title">상품 등록</h2>
						</div>
					</div>
				</div>
				<div class="admin-sub-content">
				<!-- 상품 등록 폼 시작 -->
				<div class="panel panel-admin">
					<form action="" name="adminSearchFrm">
						<!-- 조회폼 선택지 시작 -->
						<div class="panel-body">
							<div class="admin-search-section">
								<ul class="admin-list-border">
									<!-- 카테고리 선택 시작 -->
									<li>
										<div class="control-label">카테고리</div>
										<div class="form-group category-wrap">
											<select class="custom-select">
												<option selected>대분류</option>
												<option value="">성분별</option>
												<option value="">부위별</option>
												<option value="">정기구독</option>
											</select>
											<select class="custom-select">
												<option selected>소분류</option>
											</select>
										</div>
									</li>
									<!-- /카테고리 선택 끝 -->
									<!-- 상품명 입력 시작 -->
									<li>
										<div class="controll-label">상품명</div>
										<div class="form-inline">
											<div class="form-group">
												<label for="">상품명</label>
												<input type="text" />
											</div>
										</div>
									</li>
									<!-- /상품명 입력 끝 -->
									<!-- 판매 금액 입력 시작 -->
									<li>
										<div class="control-label">판매 금액</div>
										<div class="form-inline price-wrap">
											<div class="form-group">
												<label for="">판매가</label>
												<input type="text" />
											</div>
											<div class="discount-wrap">
												<div class="form-group">
													<label for="">할인 여부</label>
													<input type="checkbox" />
												</div>
												<div class="form-group">
													<label for="">할인 금액</label>
													<input type="text" />
												</div>
											</div>
										</div>
										<div class="control-label discount-price">할인가</div>
										<div class="text">
											<strong>0원</strong>
											<em>(0원 할인)</em>
										</div>
									</li>
									<!-- /판매 금액 입력 끝 -->
									<!-- 재고수량 입력 시작 -->
									<li>
										<div class="control-label">재고 수량</div>
										<div class="form-inline">
											<div class="form-group">
												<div class="form-group">
													<label for="">수량</label>
													<input type="text" />
												</div>
											</div>
										</div>
									</li>
									<!-- /재고수량 입력 끝 -->
									<!-- 상품 이미지 입력 시작 -->
									<li>
										<div class="control-label">상품 이미지</div>
										<div class="input-group mb-3" style="padding:0px;">
											<div class="input-group-prepend" style="padding:0px;">
										  		<span class="input-group-text">메인 이미지</span>
											</div>
											<div class="custom-file">
											  	<input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
											  	<label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
											</div>
										</div>
										<div class="input-group mb-3" style="padding:0px;">
											<div class="input-group-prepend" style="padding:0px;">
										  		<span class="input-group-text">상세 이미지</span>
											</div>
											<div class="custom-file">
											  	<input type="file" class="custom-file-input" name="upFile" id="upFile2" multiple>
											  	<label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
											</div>
										</div>
									</li>
									<!-- 상품 이미지 입력 끝 -->
								</ul>
							</div>
						</div>
						<!-- /조회폼 선택지 끝 -->
						<!-- 검색 / 초기화 버튼 시작 -->
						<div class="panel-footer">
							<div class="admin-button-area">
								<button type="submit" class="btn btn-primary">검색</button>
								<button type="button" class="btn btn-default">초기화</button>
							</div>
						</div>
						<!-- /검색 / 초기화 버튼 끝 -->
					</form>
				</div>
				
				
				
				
				
				
				
				
				
				
				
	</div>
</div>

</body>
</html>