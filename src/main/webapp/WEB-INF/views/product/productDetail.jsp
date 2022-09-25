<%-- <%@page import="org.springframework.security.core.context.SecurityContextHolder"%> --%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="com.kh.drugstore.member.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="${param.title}" />
</jsp:include>

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/34c760bbb4.js"
	crossorigin="anonymous"></script>

<!-- 사용자 작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/product/product-detail.css" />

<sec:authorize access="isAuthenticated()">
	<script>
	    const memberId = "<sec:authentication property='principal.username'/>";
	</script>
</sec:authorize>

<%
	Member loginMember = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String memberId = loginMember.getMemberId();
	pageContext.setAttribute("memberId", memberId);
%>

<body>
	<div id="layout-config">
		<div id="layout-config-full">
			<div id="product_view" class="product_view">
				<dl class="product-wrap product-view__wrapper">
					<dt class="product-view__thumb-wrap">
						<div id="product_thumbs" class="product-view__thumb">
							<div class="product-view__thumb-img-wrap">
								<img
									src="${pageContext.request.contextPath}/resources/upload/product/${product.attachments[0].renamedFilename}"
									alt="상품메인이미지" class="product-view__thumb-img" />
							</div>
						</div>
					</dt>
					<dd class="product-view__info">
						<form:form name="productForm" method="post" action=""
							id="productForm">
							<input type="hidden" name="pcode" value="${product.pcode}" />
							<ul>
								<li>
									<div class="product_spec_table product-view__info-contents">
										<div class="product-view__info-top">
											<p class="product-view__pname">${product.pname}</p>
											<div class="product-view__top-btn">
												<button class="product-view__share">공유하기</button>
												<a target="actionFrame" class="product-view__whish"></a>
											</div>
										</div>
										<dl class="product-view__price-wrap">
											<dd class="product-view__price-contents">
												<div class="price_wrap product-view__price">
													<p class="product-view__price-sale">
														<fmt:formatNumber
															value="${product.discount == 0 ? 0 : product.price / product.discount}"
															pattern="##" />
														%
													</p>
													<strong
														class="sell_price price product-view__price-selling">
														<fmt:formatNumber
															value="${product.price - product.discount}"
															pattern="#,###" />원
													</strong>
													<div
														class="consumer_wrap product-view__price-consumer-wrap">
														<span class="consumer product-view__price-consumer">
															<fmt:formatNumber value="${product.price}"
																pattern="#,###" />원
														</span>
													</div>
												</div>
											</dd>
										</dl>
										<dl class="product-view__additions">
											<dt class="product-view__additions-title">용량</dt>
											<dd class="product-view__additions-contents">
												${product.amount}정</dd>
										</dl>
										<dl class="product-view__additions">
											<dt class="product-view__additions-title">섭취가능기한</dt>
											<dd class="product-view__additions-contents">
												${product.distbPd}</dd>
										</dl>
									</div>
								</li>
								<li class="product-view__option-wrap">
									<div id="select_option_lay" class="product-option">
										<div class="counter">
											<div class="btn-minus">
												<span class="icon icon-product-minus"></span>
											</div>
											<input class="count" value="1"></input>
											<div class="btn-plus">
												<span class="icon icon-product-plus"></span>
											</div>
										</div>
										<ul class="total_price product-option__total">
											<li class="th product-option__total-title pd0">총 상품 금액</li>
											<li
												class="total_product_price right pd0 price product-option__total-price-wrap">
												<div class="price product-option__total-price">
													<span id="total_product_price"
														class="product-option__total-price-text">${product.price
                                                                                        - product.discount}</span>
													&nbsp;원
												</div>
											</li>
										</ul>
									</div>
								</li>
								<li class="btn_wrap product-view__btn-wrap">
                                    <input type="hidden" name="cartPcode" id="cartPcode" value="${product.pcode}" />
                                    <input type="hidden" name="cartAmount" id="cartAmount" value="1" />
                                    <button type="button" class="btn_move medium product-view__btn" id="addCart">장바구니</button>
                                    <button class="btn_chg medium product-view__btn product-view__btn-red-bg" id="buy">바로구매</button>
                                </li>
							</ul>
						</form:form>
					</dd>
				</dl>
				<!-- // 상품 스펙 -->
				<div class="set_preload product-view__detail">
					<div class="product_tabs product-view__detail-tab-wrap">
						<ul class="detail_tab product-view__detial-tab-list">
							<li class="product-view__detail-tab-item"><a
								class="tab_01 product-view__detail-tab-title product-view__detail-tab-title--active">상세정보</a>
							</li>
							<li class="product-view__detail-tab-item relative"><a
								class="tab_02 product-view__detail-tab-title">
									<div
										class="product-view__review-wrap product-view__review-wrap--grade">
										<div class="product-view__review-img-wrap">
											<!-- i태그 별 넣기 -->
										</div>
										<p class="product-view__review-grade">4.8</p>
									</div>
									<div class="product-view__review-wrap">리뷰 1,426</div>
							</a></li>
							<li class="product-view__detail-tab-item"><a
								class="tab_03 product-view__detail-tab-title">문의
									${totalContent}</a></li>
						</ul>
					</div>
					<div id="product_description" class="product-view__description">
						<a href="" name="product_description"></a>
						<div
							class="product_description product-view__description-contents">
							<c:if test="${not empty product.attachments}">
								<c:forEach items="${product.attachments}" var="attach" begin="1"
									varStatus="vs">
									<img
										src="${pageContext.request.contextPath}/resources/upload/product/${attach.renamedFilename}"
										alt="상품상세이미지" />
								</c:forEach>
							</c:if>
						</div>
						<!-- 상품 정보 제공 공시 -->
						<div class="product-view__guide">
							<p class="product-view__detail-title hide">
								<!-- 상품명 넣기 -->
							</p>
							<div class="product-view__guide-item">
								<div class="product-view__guide-item-header">
									<p class="product-view__guide-item-title">상품 정보 제공 고시</p>
									<span
										class="product-view__guide-item-arrow product-view__guide-item-arrow--active"></span>
								</div>
								<div
									class="product-view__guide-contents product-view__guide-contents--active">
									<ul class="product-view__guide-contents-list">
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">상품명</p>
											<p class="product-view__guide-contents-value">
												${product.pname}</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">품목제조관리번호</p>
											<p class="product-view__guide-contents-value">
												${product.sttenmtNo}</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">용량</p>
											<p class="product-view__guide-contents-value">
												${product.amount}</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">섭취가능기한</p>
											<p class="product-view__guide-contents-value">
												${product.distbPd}</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">제조사</p>
											<p class="product-view__guide-contents-value">
												${product.manu}</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">효능</p>
											<p class="product-view__guide-contents-value">
												${product.mainFnctn}</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">섭취 주의사항</p>
											<p class="product-view__guide-contents-value">
												${product.intakeHint1}</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">용법</p>
											<p class="product-view__guide-contents-value">
												${product.srvUse}</p>
										</li>
									</ul>
								</div>
							</div>
							<div class="product-view__guide-item">
								<div class="product-view__guide-item-header">
									<p class="product-view__guide-item-title">배송안내</p>
									<span class="product-view__guide-item-arrow"></span>
								</div>
								<div class="product-view__guide-contents">
									<ul class="product-view__guide-contents-list">
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">배송업체</p>
											<p class="product-view__guide-contents-value">CJ대한통운</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">배송비</p>
											<p class="product-view__guide-contents-value">
												2,500원 (단, 정기 구독 상품은 무료 배송) <br /> * 배송비는 한번에 결제하신 동일 주문번호,
												동일 배송지 기준으로 부과됩니다.
											</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">배송안내</p>
											<p class="product-view__guide-contents-value">
												- 영업일 기준 오후 2시 이전 입금 확인분에 한해 당일 출고됩니다(주말 및 월, 화 주문건 제외) <br />
												- 원요일, 화요일 주문건은 주말 배송물량이 많아 주문일로부터 1~2일내 순차 출고됩니다 <br /> -
												이벤트 진행으로 주문건 증가 시 모든 주문건 순차적으로 출고됩니다 <br /> - 결제 완료 후 평일 기준
												평균 2~3일정도 이내에 배송되며(산간지역 제외), 주말/공휴일/명절 연휴가 포함되거나 택배사 사정으로 인해
												배송소요 시일은 달라질 수 있습니다. <br /> - 제품 발송이 진행된 이후에는 교환/취소/주소 변경이
												어려우며, 발송 후 변경사항이 있을 경우에는 왕복 택배비는 5,000원이 발생됩니다 <br /> - 주문
												접수 후 1일 이내에 입금이 확인되지 않는 경우 자동으로 주문취소가 됩니다
											</p>
										</li>
									</ul>
								</div>
							</div>
							<div class="product-view__guide-item">
								<div class="product-view__guide-item-header">
									<p class="product-view__guide-item-title">교환/반품/배송정보</p>
									<span class="product-view__guide-item-arrow"></span>
								</div>
								<div class="product-view__guide-contents">
									<ul class="product-view__guide-contents-list">
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">교환/환불절차</p>
											<p class="product-view__guide-contents-value">
												1. DRUGSTORE 고객센터나 홈페이지 1:1문의 게시판을 통해 접수 <br /> 2. 당사로부터 전화
												답신이나 게시판 답변을 확인(비용, 주소, 방법 및 절차 등을 안내) <br /> 3. 반품접수 후 영업일
												기준 2~3일 이내에 자사 지정 택배기사님이 직접 방문 수거 <br /> 4. 제품 도착 후
												DRUGSTORE 환불 규정에 따라 7일 이내 순차적 처리됩니다 <br />
											</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">환불방법</p>
											<p class="product-view__guide-contents-value">
												반품 및 환불 접수된 상품이 정상적으로 회수 완료된 경우 아래와 같은 절차로 처리됩니다 <br /> -
												무통장입금 : 고객님께서 남겨주신 계좌로 입금해드립니다 <br /> - 신용카드 결제 : 카드 결제
												취소처리 해드리며, 처리 완료 후 카드사 사정에 따라 3~7일 후 승인취소 확인 될 수 있습니다(취소 내역
												확인은 이용하신 카드사로 문의주시면 정확한 안내 받으실 수 있습니다) <br /> - 적립금 결제 :
												고객님 아이디의 적립금으로 환원됩니다 <br /> - 휴대폰 결제 : 결제 달 이내라면 결제 취소처리
												가능하나, 다음 달로 넘어가게되는 경우 휴대폰 요금이 이미 납부처리되어 승인취소가 불가하여 남겨주시는 계좌로
												입금해드립니다
											</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">반품/교환철회</p>
											<p class="product-view__guide-contents-value">교환, 반품을
												요청하였으나 철회하고자 할 경우에는 당사 고객센터(02-6013-0855)나 1:1문의게시판으로 문의해주시면
												신속하게 처리해드립니다</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">
												반품/교환<br />가능 시점
											</p>
											<p class="product-view__guide-contents-value">
												반품 및 환불 접수된 상품이 정상적으로 회수 완료된 경우 아래와 같은 절차로 처리됩니다 <br /> -
												상품을 사용하지 않았거나 포장을 훼손하지 않은 경우, 7일 이내에 반품 신청 가능합니다 <br /> -
												상품 파손 및 오배송의 경우 <br /> - 제품 사용 후 부작용이 생긴 경우 <br /> - 내용물이
												2/3이상 남은 경우에 한해, 증상이 나타난 사진이나 진단서 첨부 시 (진료비 및 약제등은 지원되지
												않습니다) <br /> - 상품 불량 및 트러블로인한 교환 및 반품(환불)은 전자상거래법에 의거, 주문
												날짜로부터 30일이 지나면 반품 및 환불이 불가능합니다
											</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">
												반품/교환<br />불가 사유
											</p>
											<p class="product-view__guide-contents-value">
												- 제품 포장 손상 또는 개봉 및 사용한 경우 <br /> - 배송일로 부터 7일이 경과된 경우 <br />
												- DRUGSTORE 공식 판매처에서 구입한 제품이 아니거나, 구매내역이 확인되지 않는 경우 <br />
												- 고객님의 부주의로 제품이 파손 및 손상된 경우 <br /> - 제품의 겉포장이 손상되거나 분실한 경우
												<br /> - 부작용으로 인한 교환 및 반품 요청 시 진단서가 제출되지 않은 경우 <br /> -
												부작용으로 인한 교환 및 반품 요청 시 배송일로 부터 20일이 지난 경우 <br /> - 왕복 배송비
												5,000원이 동봉되지 않은 경우
											</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">반품/교환 택배비</p>
											<p class="product-view__guide-contents-value">
												반품/교환 또는 무료배송 시 왕복 배송비 5,000원 <br /> 상품 불량 및 오배송 등의 이유로
												반품하실 경우, 반품 배송비는 무료입니다 <br /> 단순변심 및 고객님의 사정으로 반품/교환 하실 경우
												배송비는 고객님 부담입니다
											</p>
										</li>
										<li class="product-view__guide-contents-item">
											<p class="product-view__guide-contents-title">신청방법</p>
											<p class="product-view__guide-contents-value">
												반드시 DRUGSTORE 1:1문의게시판이나 고객센터로 접수해주세요 <br /> 교환, 반품, 환불은
												공정거래위원회의 표준약관에 의거하여 제품이 배송일로부터 7일이내에 교환 및 환불이 가능합니다
											</p>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<!-- // 교환/반품/배송정보 -->
					</div>
					<!-- 리뷰 시작 -->
					<!-- 리뷰 탭 클릭하면 style="display: block; outline: 0px;" 추가하기-->
					<div id="product_review" class="product-view__review-board">
						<div id="product_review_wrap">
							<div class="layout_body">
								<div style="margin: auto;">
									<div class="boardlayout">
										<p class="product-view__detail-title">상콤 비타민</p>
										<div class="bbslist product-review pd0">
											<form:form action="" name="reviewboardsearch"
												id="reviewboardsearch">
												<!-- 리뷰 검색시 필요한 정보를 hidden으로 넣기 현재 아래는 예시임 -->
												<input type="hidden" name="pcode" value="" />
												<input type="hidden" name="star" value="" />
												<input type="hidden" name="perpage" value="10" />
												<input type="hidden" name="page" id="page" value="" />
												<input type="hidden" name="categoryId" value="categoryId" />
												<ul class="bbsbtn_wrap product-review__top">
													<li class="product-review__top-item">
														<ul class="product-review__type-list">
															<li class="product-review__type-item">
																<button
																	class="product-review__type-title product-review__type-title--active">전체리뷰</button>
															</li>
															<li class="product-review__type-item">
																<button
																	class="product-review__type-title product-review__type-title--active">텍스트리뷰</button>
															</li>
															<li class="product-review__type-item">
																<button
																	class="product-review__type-title product-review__type-title--active">사진리뷰</button>
															</li>
														</ul>
													</li>
													<li class="product-review__top-item"><input
														type="button" value="리뷰작성" name="board_write_btn"
														id="product_review_write_btn"
														class="btn_chg product-review__write-btn" /></li>
												</ul>
											</form:form>
											<!-- // 검색폼 -->
											<table class="bbslist_table_style product-review__table">
												<tbody>
													<!-- 반복문 시작 -->
													<!-- 리뷰 미리보기 -->
													<tr class="product-review__item-header datalist review">
														<td
															class="sbj product-review__item-header-contents relative">
															<div
																class="product-review__item-header-box hand boad_view_btn">
																<div class="product-review__item-header-top">
																	<div class="product-review__item-header-top-wrapper">
																		<div class="product-review__star">
																			<!-- 별점 개수에 따라서 별 i태그 넣기 -->
																		</div>
																		<div class="memberId product-review__writer">
																			pota**</div>
																	</div>
																	<div class="product-review__arrow-btn">
																		<img
																			src="${pageContext.request.contextPath}/resources/css/images/angle-down-solid.svg"
																			class="product-review__arrow-btn-img">
																	</div>
																</div>
																<!-- 토글 열리면 #productview는 display="none"-->
																<div id="productview"
																	class="productviewbox product-review__view-box">
																	<div class="pic product-review__img-wrap">
																		<span> <img src="" alt=""
																			class="hand small_product_img pic product-review__img">
																		</span>
																	</div>
																	<div class="info product-review__subject-wrap">
																		<div class="board-cont product-review__subject-btn">
																			<p class="product-review__subject">
																				<!-- 리뷰 제목 넣기 -->
																			</p>
																		</div>
																	</div>
																	<div class="date product-review__date">
																		<!-- 리뷰 작성일자 넣기 -->
																	</div>
																</div>
															</div>
														</td>
													</tr>
													<!-- // 리뷰 미리보기 -->
													<!-- 토글 누르면 나오는 리뷰 디테일 -->
													<!-- 토글 누르면 style="display: none에서 table-row;로 변경"-->
													<tr
														class="hide productviewer product-review__item-viewer review">
														<td
															class="pd0 product-review__item-viewer-contents-wrap relative">
															<p class="product-review_viewer-date">2022.09.18</p>
															<div class="product-review__viewer-img-list">
																<div class="product-review__viewer-img-wrap">
																	<img src="" alt="" class="product-review__viewer-img">
																</div>
															</div>
															<div class="productviewer product-review__viewer">
																<div class="boardlayout">
																	<div class="bbsview">
																		<div class="viewbox">
																			<form:form action="#" name="review-form1"
																				id="review-form1" method="POST">
																				<!-- 리뷰 수정/삭제에 필요한 정보들 hidden으로 넣어주세요 -->
																				<input type="hidden" name="pcode" id="pcode" />
																				<table style="width: 100%;">
																					<tbody>
																						<tr>
																							<td colspan="2"
																								class="relative product-review__viewer-td">
																								<div
																									class="content hand viewerlay_close_btn product-review__viewer-contents">
																									이게 바로 말로만 듣던 소매넣기 인가요?</div>
																								<div class="product-review__viewer-btn-wrap">
																									<input type="button" value="수정"
																										id="review-update-btn"
																										class="product-review__update-btn" /> <input
																										type="button" value="삭제"
																										id="review-delete-btn"
																										class="product-review__delete-btn" />
																								</div>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</form:form>
																		</div>
																	</div>
																</div>
															</div>
														</td>
													</tr>
													<tr class="product-review__item-header datalist review">
														<td
															class="sbj product-review__item-header-contents relative">
															<div
																class="product-review__item-header-box hand boad_view_btn">
																<div class="product-review__item-header-top">
																	<div class="product-review__item-header-top-wrapper">
																		<div class="product-review__star">
																			<!-- 별점 개수에 따라서 별 i태그 넣기 -->
																		</div>
																		<div class="memberId product-review__writer">
																			pota**</div>
																	</div>
																	<div class="product-review__arrow-btn">
																		<img
																			src="${pageContext.request.contextPath}/resources/css/images/angle-down-solid.svg"
																			class="product-review__arrow-btn-img">
																	</div>
																</div>
																<!-- 토글 열리면 #productview는 display="none"-->
																<div id="productview"
																	class="productviewbox product-review__view-box">
																	<div class="pic product-review__img-wrap">
																		<span> <img src="" alt=""
																			class="hand small_product_img pic product-review__img">
																		</span>
																	</div>
																	<div class="info product-review__subject-wrap">
																		<div class="board-cont product-review__subject-btn">
																			<p class="product-review__subject">
																				<!-- 리뷰 제목 넣기 -->
																			</p>
																		</div>
																	</div>
																	<div class="date product-review__date">
																		<!-- 리뷰 작성일자 넣기 -->
																	</div>
																</div>
															</div>
														</td>
													</tr>
													<tr
														class="hide productviewer product-review__item-viewer review">
														<td
															class="pd0 product-review__item-viewer-contents-wrap relative">
															<p class="product-review_viewer-date">2022.09.18</p>
															<div class="product-review__viewer-img-list">
																<div class="product-review__viewer-img-wrap">
																	<img src="" alt="" class="product-review__viewer-img">
																</div>
															</div>
															<div class="productviewer product-review__viewer">
																<div class="boardlayout">
																	<div class="bbsview">
																		<div class="viewbox">
																			<form:form action="#" name="review-form1"
																				id="review-form1" method="POST">
																				<!-- 리뷰 수정/삭제에 필요한 정보들 hidden으로 넣어주세요 -->
																				<input type="hidden" name="pcode" id="pcode" />
																				<table style="width: 100%;">
																					<tbody>
																						<tr>
																							<td colspan="2"
																								class="relative product-review__viewer-td">
																								<div
																									class="content hand viewerlay_close_btn product-review__viewer-contents">
																									이게 바로 말로만 듣던 소매넣기 인가요?</div>
																								<div class="product-review__viewer-btn-wrap">
																									<input type="button" value="수정"
																										id="review-update-btn"
																										class="product-review__update-btn" /> <input
																										type="button" value="삭제"
																										id="review-delete-btn"
																										class="product-review__delete-btn" />
																								</div>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</form:form>
																		</div>
																	</div>
																</div>
															</div>
														</td>
													</tr>
													<!-- // 리뷰 미리보기 -->
													<!-- 토글 누르면 나오는 리뷰 디테일 -->
													<!-- 토글 누르면 style="display: none에서 table-row;로 변경"-->
													<!-- // 리뷰 디테일 -->
													<!-- // 반복문 -->
												</tbody>
											</table>
											<!-- 페이징 넣어주세요 -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- // 리뷰 -->
					<!-- 문의 시작 -->
					<div id="product_qna" class="product-view__qna">
						<div class="product_qna_wrap">
							<div class="layout_body">
								<div style="margin: auto;">
									<div class="boardlayout">
										<div class="bbslist product-qna pd0">
											<form:form action="" name="qnaboardsearch"
												id="qnaboardsearch">
												<div class="product-qna__top">
													<div class="board_info_top">
														<p>배송, 주문(취소/교환/환불)관련 문의는 고객센터 1:1 고객상담에 남겨주세요.</p>
														<a href="#">1:1 문의하기</a>
													</div>
													<div class="product-qna__top_btn_wrapper">
														<span>제품 문의</span> <input type="button" value="문의하기"
															name="board_write_btn" id="product_qna_write_btn"
															class="btn_chg product-qna__write-btn hand" />
													</div>
												</div>
											</form:form>
											<!-- // qnaboardsearch 히든폼 -->
											<table class="bbslist_table_style product-qna__table">
												<tbody>
													<!-- 반복문 시작 -->
													<c:if test="${empty qnaList}">
														<div style="width: 100%; text-align: center; font-size: 20px; margin: 50px;">
															아직 작성된 문의글이 없습니다.</div>
													</c:if>
													<c:if test="${not empty qnaList}">
														<!-- 반복문 시작 -->
														<c:forEach items="${qnaList}" var="qna" varStatus="vs">
															<c:if test="${qna.commentLevel eq 1}">
																<tr class="datalist product-qna__item-header">
																	<td class="product-qna__item pd0">
																		<!-- 미리보기 -->
																		<div class="product-qna__item-contents relative">
																			<!-- 비밀글, 내 글 아님 -->
																			<c:if test="${qna.secretPassword != 0 and qna.writer != memberId and qna.commentLevel eq 1}">
																				<div class="board_cont product-qna__contents hand boad_view_btn_mbno">
																					<div>
																						<span class="product-qna__secret"></span>
																						<span class="product-qna__contents-text"> 비밀글입니다 </span>
																					</div>
																					<div class="product-review__arrow-btn">
																						<img src="${pageContext.request.contextPath}/resources/css/images/angle-down-solid.svg"
																							class="product-review__arrow-btn-img">
																					</div>
																				</div>
																			</c:if>
																			<!-- 비밀글 아님 -->
																			<c:if test="${qna.secretPassword eq 0 and qna.commentLevel eq 1}">
																				<div class="board_cont product-qna__contents hand boad_view_btn">
																					<div>
																						<span class="product-qna__contents-text">${qna.content}</span>
																					</div>
																					<div class="product-review__arrow-btn">
																						<img
																							src="${pageContext.request.contextPath}/resources/css/images/angle-down-solid.svg"
																							class="product-review__arrow-btn-img">
																					</div>
																				</div>
																			</c:if>
																			<div class="product-qna__item-info">
																				<p class="product-qna__status product-qna__status--complete">${qna.answered eq 'Y' ? '답변완료' : '답변 전'}</p>
																				<div class="product-qna__item-info-right">
																					<div class="product-qna__item-writer">${qna.writer}</div>
																					<div class="product-qna__item-date">${qna.regDate}</div>
																				</div>
																			</div>
																		</div>
																		<!-- 상세보기 -->
																		<article class="productviewer product-qna__viewer" style="block;">
																			<div class="product-qna__viewer-contents-wrap">
																				<div class="productviewer">
																					<div class="boardlayout">
																						<div class="bbsview">
																							<div class="viewbox">
																								<table style="width: 100%;">
																									<tbody>
																										<tr>
																											<td>
																												<div class="contet product-qna__viewer-contents pd0">
																													<p class="product-qna__viewer-mark">Q</p>
																													<div
																														class="product-qna__viewer-contents-text-wrap relative">
																														<div class="product-qna__viewer-contents-text viewerlay_close_btn hand">
																															${qna.content}
																														</div>
																													</div>
																													<c:if test="${qna.writer eq memberId}">
																														<div class="product-qna__viewer-btn-wrap">
																															<button id="qna-update-btn"
																																class="product-qna__update-btn"
																																onclick="updateQna(this);" value="${qna.qnaId}">수정</button>
																															<form:form name="qnaDeleteForm"
																																	action="${pageContext.request.contextPath}/qna/deleteQna.do"> 
																																<input type="hidden" name="qnaId"
																																	value="${qna.qnaId}" />
																																<input type="hidden" name="pcode"
																																	value="${product.pcode}" />
																																<button id="qna-delete-btn"
																																	class="product-qna__delete-btn">삭제</button>
																															</form:form>
																														</div>
																													</c:if>
																												</div>
																												<c:if test="${qna.answered eq 'Y'}">
																													<div class="reply product-qna__reply">
																														<p class="product-qna__viewer-mark product-qna__viewer-mark--answer">A</p>
																														<div class="product-qna__reply-text">
																															
																														</div>
																													</div>
																												</c:if>
																											</td>
																										</tr>
																									</tbody>
																								</table>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>
																		</article>
																	</td>
																	<input type="hidden" name="qnaId" value="${qna.qnaId}" class="qnaId"/>
																</tr>
															</c:if>
														</c:forEach>
														<!-- // 문의 반복문 -->
													</c:if>
												</tbody>
											</table>
										</div>
										<!-- 페이징 넣어주세요 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
    document.querySelector('.tab_01').addEventListener('click', (e) => {
        document.querySelector('#product_description').style.display = "inline-block";
        document.querySelector('#product_review').style.display = "none";
        document.querySelector('#product_qna').style.displqy = "none";
    });
    document.querySelector('.tab_02').addEventListener('click', (e) => {
        document.querySelector('#product_description').style.display = "none";
        document.querySelector('#product_review').style.display = "inline-block";
        document.querySelector('#product_qna').style.displqy = "none";
    });
    document.querySelector('.tab_03').addEventListener('click', (e) => {
        document.querySelector('#product_description').style.display = "none";
        document.querySelector('#product_review').style.display = "none";
        document.querySelector('#product_qna').style.display = "inline-block";
    });
</script>
<script>
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
// 위시리스트 추가
document.querySelector('.product-view__whish').addEventListener('click', (e) => {
    const headers = {};
    headers['${_csrf.headerName}'] = '${_csrf.token}';
    const pcode = ${ product.pcode };
    $.ajax({
        url: "${pageContext.request.contextPath}/wish/insertPickedList.do",
        data: { pcode },
        headers,
        method: "post",
        dataType: "json",
        success(response) {
            console.log(response);
            alert(response.msg);
        },
        error: console.log
    });
});
// 문의 수정 폼 연결
const updateQna = (e) => {
    const qnaId = e.value;
    location.href = "${pageContext.request.contextPath}/qna/qnaUpdateForm.do?qnaId=" + qnaId;
}
// 문의 삭제 전 확인 메세지
document.querySelectorAll('[name=qnaDeleteForm]').forEach((form) => {
	form.addEventListener('submit', (e) => {
		e.preventDefault();
		if(confirm("정말 삭제하시겠습니까?")){
			form.submit();
		} else{
			return;
		}
	});
});
// 수량 변경
document.querySelector('.btn-minus').addEventListener('click', (e) => {
    // 수량 마이너스 처리
    let count = document.querySelector('.count').value;
    count = parseInt(count);
    document.querySelector('.count').value = count - 1;
    if (count < 0) count = 0;
    // 총 금액
    const totalPrice = document.querySelector('#total_product_price');
    const productPrice = ${ product.price };
    const discount = ${ product.discount };
    let price = (productPrice - discount) * count;
    totalPrice.innerHTML = price;
});
document.querySelector('.btn-plus').addEventListener('click', (e) => {
    let count = document.querySelector('.count').value;
    count = parseInt(count);
    document.querySelector('.count').value = count + 1;
    // 총 금액
    const totalPrice = document.querySelector('#total_product_price');
    const productPrice = ${ product.price };
    const discount = ${ product.discount };
    let price = (productPrice - discount) * count;
    totalPrice.innerHTML = price;
});
$(document).ready(function () {
    // 상품 정보 토글
    $('.product-view__guide-item-title:eq(0)').on('click', function () {
        if ($('.product-view__guide-contents:eq(0)').hasClass('product-view__guide-contents--active') == false) {
            $('.product-view__guide-contents:eq(0)').addClass('product-view__guide-contents--active');
            $('.product-view__guide-item-arrow:eq(0)').addClass('product-view__guide-item-arrow--active');
        } else {
            $('.product-view__guide-contents:eq(0)').removeClass('product-view__guide-contents--active');
            $('.product-view__guide-item-arrow:eq(0)').removeClass('product-view__guide-item-arrow--active');
        }
    });
    $('.product-view__guide-item-title:eq(1)').on('click', function () {
        if ($('.product-view__guide-contents:eq(1)').hasClass('product-view__guide-contents--active') == false) {
            $('.product-view__guide-contents:eq(1)').addClass('product-view__guide-contents--active');
            $('.product-view__guide-item-arrow:eq(1)').addClass('product-view__guide-item-arrow--active');
        } else {
            $('.product-view__guide-contents:eq(1)').removeClass('product-view__guide-contents--active');
            $('.product-view__guide-item-arrow:eq(1)').removeClass('product-view__guide-item-arrow--active');
        }
    });
    $('.product-view__guide-item-title:eq(2)').on('click', function () {
        if ($('.product-view__guide-contents:eq(2)').hasClass('product-view__guide-contents--active') == false) {
            $('.product-view__guide-contents:eq(2)').addClass('product-view__guide-contents--active');
            $('.product-view__guide-item-arrow:eq(2)').addClass('product-view__guide-item-arrow--active');
        } else {
            $('.product-view__guide-contents:eq(2)').removeClass('product-view__guide-contents--active');
            $('.product-view__guide-item-arrow:eq(2)').removeClass('product-view__guide-item-arrow--active');
        }
    });
    // 리뷰 토글
    const trs = document.querySelectorAll('.review');
    trs.forEach(function (tr, item) {
        $(tr).on('click', function () {
            console.log(this);
            const $headerBox = $(this).children().first().children().first();
            const $headerTop = $headerBox.children().first();
            const $nextTr = $(this).next();
            const $reviewViewer = $nextTr.children('.product-review__viewer');
            console.log($reviewViewer);
            if ($headerBox.hasClass('boad_view_btn') == true) {
                // 토글 열기
                console.log("닫힘 -> 열림");
                $headerBox.removeClass('boad_view_btn');
                $headerTop.children('.product-review__arrow-btn').addClass('product-review__arrow-btn--active');
                $nextTr.css("display", 'table-row');
                $reviewViewer.css('display', 'block');
                $headerTop.next().css('display', 'none');
            } else {
                // 토글 닫기
                console.log("열림 -> 닫힘");
                $headerBox.addClass('boad_view_btn');
                $headerTop.children('.product-review__arrow-btn').removeClass('product-review__arrow-btn--active');
                $nextTr.css("display", 'none');
                $reviewViewer.css('display', 'none');
                $headerTop.next().css('display', 'flex');
            }
        });
    });
    // 문의 토글
    const qnaTrs = document.querySelectorAll('.product-qna__item-header');
    qnaTrs.forEach(function (qnaTr, item) {
        const $qnaItem = $(qnaTr).children().first();
        const $itemContents = $qnaItem.children().first();
        const $qnaContents = $itemContents.children().first();
		const $qnaId = $(qnaTr).children('.qnaId');
        const $article = $itemContents.next();
        
        $itemContents.on('click', function () {
            if ($qnaContents.hasClass('boad_view_btn') == true) { // 닫혀있는 상태
            	console.log($qnaId.val());
            	console.log($article);
                let qnaId = $qnaId.val();
                const reply = $article.find('div.product-qna__reply-text');
                console.log(reply);
                
                // 답변 만들기
                $.ajax({
                	url : "${pageContext.request.contextPath}/qna/selectOneAnswer.do",
                	method: "GET",
                	data: {qnaId},
                	dataType: "json",
                	success(response){
                		console.log(response);
                		const {qnaId, commentRef, pcode, writer, answered, regDate, content, secretPassword, commentLevel} = response;
                		console.log(content);
                		$(reply).html(content);
                	},
                	error : console.log
                });
                
             	// 토글 열기
                console.log("닫힘 -> 열림");
                $qnaContents.removeClass('boad_view_btn');
                $qnaContents.children('.product-review__arrow-btn').addClass('.product-review__arrow-btn--active');
                $itemContents.nextAll('.product-qna__viewer').css('display', 'block');
                
                
            } else {
                // 토글 닫기
                console.log("열림 -> 닫힘");
                $qnaContents.addClass('boad_view_btn');
                $qnaContents.children('.product-review__arrow-btn').removeClass('.product-review__arrow-btn--active');
                $itemContents.nextAll('.product-qna__viewer').css('display', 'none');
            }
        });
    });
    
    // 비밀글 눌렀을 때
    document.querySelector('.boad_view_btn_mbno').addEventListener('click', (e) => {
    	alert("작성자만 확인 가능합니다.");
    });
});
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>