<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="title" value="헬로우 스프링" />
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<!-- bootstrap js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자 작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin-header.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product-enroll.css"/>

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
										<strong>0</strong>
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
													<label for="">상품 번호</label>
													<input type="text" />
												</div>
												<div class="form-group">
													<label for="">상품명</label>
													<input type="text" />
												</div>
												<div class="form-group">
													<label for="">제조사명</label>
													<input type="text" />
												</div>
											</div>
										</li>
										<!-- /검색어로 검색 끝 -->
										<!-- 판매 상태 검색 시작 -->
										<li>
											<div class="control-label">판매 상태</div>
											<div class="form-group checkbox-wrap">
												<div>
													<input type="checkbox" name="" id="" />
													<label for="">전체</label>
												</div>
												<div>
													<input type="checkbox" name="" id="" />
													<label for="">판매중</label>
												</div>
												<div>
													<input type="checkbox" name="" id="" />
													<label for="">품절</label>
												</div>
												<div>
													<input type="checkbox" name="" id="" />
													<label for="">판매 종료</label>
												</div>
											</div>
										</li>
										<!-- /판매 상태 검색 끝 -->
										<!-- 카테고리 검색 시작 -->
										<li>
											<div class="control-label">카테고리</div>
											<div class="form-group category-wrap">
												<div class="dropdown">
													<a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
													  대분류
													</a>
													
													<div class="dropdown-menu">
														<a class="dropdown-item" href="#">Action</a>
														<a class="dropdown-item" href="#">Another action</a>
														<a class="dropdown-item" href="#">Something else here</a>
													</div>
												</div>
												<div class="dropdown">
													<a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
													  소분류
													</a>
													
													<div class="dropdown-menu">
														<a class="dropdown-item" href="#">Action</a>
														<a class="dropdown-item" href="#">Another action</a>
														<a class="dropdown-item" href="#">Something else here</a>
													</div>
												</div>
											</div>
										</li>
										<!-- /카테고리 검색 끝 -->
										<!-- 기간 검색 시작 -->
										<li>
											<div class="controll-label">기간</div>
											<div class="form-group">
												<div class="dropdown">
													<a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
													  상품 등록일
													</a>
													
													<div class="dropdown-menu">
														<a class="dropdown-item" href="#">Action</a>
														<a class="dropdown-item" href="#">Another action</a>
														<a class="dropdown-item" href="#">Something else here</a>
													</div>
												</div>
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
									<span class="text-primary">0</span>
									개)
								</h3>
							</div>
							<div class="pull-right">
								<div class="dropdown">
									<a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
									  상품등록일순
									</a>
									
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">Action</a>
										<a class="dropdown-item" href="#">Another action</a>
										<a class="dropdown-item" href="#">Something else here</a>
									</div>
								</div>
								<div class="dropdown">
									<a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
									  100개씩
									</a>
									
									<div class="dropdown-menu">
										<a class="dropdown-item" href="#">Action</a>
										<a class="dropdown-item" href="#">Another action</a>
										<a class="dropdown-item" href="#">Something else here</a>
									</div>
								</div>
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
								<!-- 리스트 table 만들기 -->
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