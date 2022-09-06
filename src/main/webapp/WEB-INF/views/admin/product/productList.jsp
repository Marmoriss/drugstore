<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="title" value="헬로우 스프링" />
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- 사용자 작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/header.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/product-list.css"/>

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/34c760bbb4.js" crossorigin="anonymous"></script>


		<!-- admin content 시작 -->
		<div class="admin-content">
			<div id="admin-content" class="admin-sub-frame">
				<div>
					<div class="admin-sub-title">
						<div class="pull-left">
							<h2 class="title">상품 조회/수정</h2>
						</div>
					</div>
				</div>
				<div class="admin-sub-content">
					<!-- 결제 상태 등 표시 시작 -->
					<div class="form-section admin-status">
						<ul class="admin-status-list">
							<li>
								<a href="" class="status-link-area">
									<span class="status-icon"></span>
									<div class="text">
										<p>전체</p>
										<strong>${totalContent}</strong>
										<em>건</em>
									</div>
								</a>
							</li>
							<li>
								<a href="" class="status-link-area">
									<span class="status-icon"></span>
									<div class="text">
										<p>판매중</p>
										<strong>0</strong>
										<em>건</em>
									</div>
								</a>
							</li>
							<li>
								<a href="" class="status-link-area">
									<span class="status-icon"></span>
									<div class="text">
										<p>품절</p>
										<strong>0</strong>
										<em>건</em>
									</div>
								</a>
							</li>
							<li>
								<a href="" class="status-link-area">
									<span class="status-icon"></span>
									<div class="text">
										<p>판매종료</p>
										<strong>0</strong>
										<em>건</em>
									</div>
								</a>
							</li>
						</ul>
					</div>
					<!-- /결제 상태 등 표시 끝 -->
					<!-- 상품 조회 폼 시작 -->
					<div class="panel panel-admin">
						<form action="" name="adminSearchFrm">
							<!-- 조회폼 선택지 시작 -->
							<div class="panel-body">
								<div class="admin-search-section">
									<ul class="admin-list-border">
										<!-- 검색어로 검색 시작 -->
										<li>
											<div class="control-label">검색어</div>
											<div class="form-inline">
												<div class="form-group">
													<label>상품 번호</label>
													<input type="text" name="pcode" id="pcode"/>
												</div>
												<div class="form-group">
													<label>상품명</label>
													<input type="text" name="pname" id="pname"/>
												</div>
												<div class="form-group">
													<label>제조사명</label>
													<input type="text" name="menu" id="menu"/>
												</div>
											</div>
										</li>
										<!-- /검색어로 검색 끝 -->
										<!-- 판매 상태 검색 시작 -->
										<li>
											<div class="control-label">판매 상태</div>
											<div class="form-group checkbox-wrap">
												<div>
													<input type="checkbox" name="saleStatus" value="total"/>
													<label for="">전체</label>
												</div>
												<div>
													<input type="checkbox" name="saleStatus" value="Y"/>
													<label for="">판매중</label>
												</div>
												<div>
													<input type="checkbox" name="saleStatus" value="soldOut"/>
													<label for="">품절</label>
												</div>
												<div>
													<input type="checkbox" name="saleStatus" value="N" />
													<label for="">판매 종료</label>
												</div>
											</div>
										</li>
										<!-- /판매 상태 검색 끝 -->
										<!-- 카테고리 검색 시작 -->
										<li>
											<div class="control-label">카테고리</div>
											<div class="form-group category-wrap">
												<select class="custom-select big-category">
													<option selected>대분류</option>
													<option value="350001">성분</option>
													<option value="350002">성별</option>
													<option value="350003">신체</option>
													<option value="350004">정기구독</option>
												</select>
												<select class="custom-select small-category">
													<option selected>소분류</option>
												</select>
											</div>
										</li>
										<script>
										document.querySelector(".big-category").addEventListener('change', (e) => {
											const smallCategory = document.querySelector('.small-category');
											smallCategory.options[0].selected = true;
											$.ajax({
												url : "${pageContext.request.contextPath}/admin/product/category.do",
												method : "GET",
												data : {
													categoryId : e.target.value
												},
												success(data){
													console.log(data);
													
													//const {categoryDetailName, categoryId} = data;
													data.forEach(({categoryDetailName, categoryId}) => {
														console.log(categoryDetailName, categoryId);
														$(smallCategory).append("<option value='" + categoryId + "'>" + categoryDetailName + "</option>");
													});
												},
												error : console.log
											});
										});
										</script>
										<!-- /카테고리 검색 끝 -->
										<!-- 기간 검색 시작 -->
										<li>
											<div class="controll-label">기간</div>
											<div class="form-group">
												<select class="custom-select">
													<option selected>상품 등록일</option>
												</select>
											</div>
											<div class="form-group">
												<div class="btn-group">
													<button type="button">오늘</button>
													<button type="button">1주일</button>
													<button type="button">1개월</button>
													<button type="button">3개월</button>
													<button type="button">6개월</button>
													<button type="button">1년</button>
													<button type="button">전체</button>
												</div>
											</div>
											<div class="form-group">
												<!-- datetime picker 넣기 -->
												달력 검색 자리
											</div>
										</li>
										<!-- 기간 검색 끝 -->
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
					<!-- /상품 조회 폼 끝 -->
					<!-- 상품 리스트 시작 -->
					<div class="panel panel-admin">
						<div class="panel-heading">
							<div class="pull-left">
								<h3 class="panel-title">
									상품목록 (총
									<span class="text-primary">${totalCount}</span>
									개)
								</h3>
							</div>
							<div class="pull-right">
								<select class="custom-select">
									<option selected>상품등록일순</option>
								</select>
								<select class="custom-select">
									<option selected>100개씩</option>
								</select>
							</div>
						</div>
						<div class="panel-body">
							<div class="admin-btn-group">
								<div class="admin-btn-left">
									<button type="button" class="btn btn-submit">선택 삭제</button>
								</div>
								<div class="admin-btn-right">
									<button type="button" class="btn btn-submit">수정 저장</button>
								</div>
							</div>
							<div class="admin-product-list">
								<table class="product-list-tbl" name="product-list-tbl">
									<thead>
										<tr>
											<td></td>
											<td>상품코드</td>
											<td>카테고리 코드</td>
											<td>품목제조관리번호</td>
											<td>상품명</td>
											<td>제조사</td>
											<td>가격</td>
											<td>내용량(수량)</td>
											<td>성분명</td>
											<td>효능</td>
											<td>주의사항</td>
											<td>용법</td>
											<td>유통기한</td>
											<td>구독상품</td>
											<td>기준규격</td>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty list}">
											<tr>
												<td colspan="15" class="text-center">조회된 상품이 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${not empty list}">
											<c:forEach items="${list}" var="product">
												<tr data-no="${product.pcode}">
													<td><input type="checkbox" /></td>
													<td>${product.pcode}</td>
													<td>${product.categoryId}</td>
													<td>${product.sttenmtNo}</td>
													<td>${product.pname}</td>
													<td>${product.menu}</td>
													<td>${product.price}</td>
													<td>${product.amount}</td>
													<td>${product.ingreName}</td>
													<td>${product.mainFnctn}</td>
													<td>${product.intakeHint1}</td>
													<td>${product.srvUse}</td>
													<td>${product.distbPd}</td>
													<td>${product.subYn}</td>
													<td>${product.baseStandard}</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
								<nav class="pagebar">
									${pagebar}
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /admin content 끝 -->
	</div>
</div>


</body>
</html>