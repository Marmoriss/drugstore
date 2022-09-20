<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="${param.title}" />
</jsp:include>

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/34c760bbb4.js" crossorigin="anonymous"></script>

<!-- 사용자 작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product/product-detail.css" />

<body>
    <div id="layout-config">
        <div id="layout-config-full">
            <div id="product_view" class="product_view">
                <dl class="product-wrap product-view__wrapper">
                    <dt class="product-view__thumb-wrap">
                        <div id="product_thumbs" class="product-view__thumb">
                            <div class="product-view__thumb-img-wrap">
                                <img src="" alt="" class="product-view__thumb-img" />
                                <!-- 이미지 파일 소스 넣기 -->
                            </div>
                        </div>
                    </dt>
                    <dd class="product-view__info">
                        <form:form name="productForm" method="post" action="">
                            <input type="hidden" name="pcode" value="" />
                            <ul>
                                <li>
                                    <div class="product_spec_table product-view__info-contents">
                                        <div class="product-view__info-top">
                                            <p class="product-view__pname">비피다 바이옴 콤플렉스 앰플 50ml</p>
                                            <div class="product-view__top-btn">
                                                <button class="product-view__share">공유하기</button>
                                                <a target="actionFrame" class="product-view__whish"
                                                    onclick="wish_chg();">
                                                </a>
                                            </div>
                                        </div>
                                        <dl class="product-view__price-wrap">
                                            <dd class="product-view__price-contents">
                                                <div class="price_wrap product-view__price">
                                                    <p class="product-view__price-sale">40%</p>
                                                    <strong
                                                        class="sell_price price product-view__price-selling">17,500원</strong>
                                                    <div class="consumer_wrap product-view__price-consumer-wrap">
                                                        <span
                                                            class="consumer product-view__price-consumer">29,000원</span>
                                                    </div>
                                                </div>
                                            </dd>
                                        </dl>
                                        <dl class="product-view__additions">
                                            <dt class="product-view__addtions-title">용량</dt>
                                            <dd class="product-view_additions-contents">30정</dd>
                                        </dl>
                                        <dl class="product-view__additions">
                                            <dt class="product-view__additions-title">섭취 가능 기한</dt>
                                            <dd class="product-view__additions-contents">제조일로부터 2년</dd>
                                        </dl>
                                    </div>
                                </li>
                                <li class="product-view__option-wrap">
                                    <div id="select_option_lay" class="product-option">
                                        <!-- 수량 선택 태그 넣기 -->
                                        <ul class="total_price product-option__total">
                                            <li class="th product-option__total-title pd0">총 상품 금액</li>
                                            <li
                                                class="total_product_price right pd0 price product-option__total-price-wrap">
                                                <div class="price product-option__total-price">
                                                    <span id="total_product_price"
                                                        class="product-option__total-price-text">24,500</span>
                                                    &nbsp;원
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="btn_wrap product-view__btn-wrap">
                                    <button class="btn_move medium product-view__btn" id="addCart">장바구니</button>
                                    <button class="btn_chg medium product-view__btn product-view__btn-red-bg"
                                        id="buy">바로구매</button>
                                </li>
                            </ul>
                        </form:form>
                    </dd>
                </dl>
                <!-- // 상품 스펙 -->
                <div class="set_preload product-view__detail">
                    <div class="product_tabs product-view__detail-tab-wrap">
                        <ul class="detail_tab product-view__detial-tab-list">
                            <li class="product-view__detail-tab-item">
                                <a href="#"
                                    class="tab-01 product-view__detail-tab-title product-view__detail-tab-title--active">상세정보</a>
                            </li>
                            <li class="product-view__detail-tab-item relative">
                                <a href="#" class="tab_02 product-view__detail-tab-title">
                                    <div class="product-view__review-wrap product-view__review-wrap--grade">
                                        <div class="product-view__review-img-wrap">
                                            <!-- i태그 별 넣기 -->
                                        </div>
                                        <p class="product-view__review-grade">4.8</p>
                                    </div>
                                    <div class="product-view__review-wrap">리뷰 1,426</div>
                                </a>
                            </li>
                            <li class="product-view__detail-tab-item">
                                <a href="#" class="tab_03 product-view__detail-tab-title">문의 30</a>
                            </li>
                        </ul>
                    </div>
                    <div id="product_description" class="product-view__description">
                        <a href="" name="product_description"></a>
                        <div class="product_description product-view__description-contents">
                            <!-- 상품 상세 정보 사진들 들어갈 자리 -->
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
                                <div class="product-view__guide-contents product-view__guide-contents--active">
                                    <ul class="product-view__guide-contents-list">
                                        <!-- 보여주고싶은 항목만큼 반복문 돌리기 -->
                                        <li class="product-view__guide-contents-item">
                                            <p class="product-view__guide-contents-title">품목제조관리번호</p>
                                            <p class="product-view__guide-contents-value">01023120481348956</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-view__guide-item">
                                <div class="product-view__guide-item-header">
                                    <p class="product-view__guide-item-title">배송안내</p>
                                    <span
                                        class="product-view__guide-item-arrow product-view__guide-item-arrow--active"></span>
                                </div>
                                <div class="product-view__guide-contents product-view__guide-contents--active">
                                    <ul class="product-view__guide-contents-list">
                                        <li class="product-view__guide-contents-item">
                                            <p class="product-view__guide-contents-title">배송업체</p>
                                            <p class="product-view__guide-contents-value">CJ대한통운</p>
                                        </li>
                                        <li class="product-view__guide-contents-item">
                                            <p class="product-view__guide-contents-title">배송비</p>
                                            <p class="product-view__guide-contents-value">
                                                2,500원 (단, 정기 구독 상품은 무료 배송)
                                                <br />
                                                * 배송비는 한번에 결제하신 동일 주문번호, 동일 배송지 기준으로 부과됩니다.
                                            </p>
                                        </li>
                                        <li class="product-view__guide-contents-item">
                                            <p class="product-view__guide-contents-title">배송안내</p>
                                            <p class="product-view__guide-contents-value">
                                                - 영업일 기준 오후 2시 이전 입금 확인분에 한해 당일 출고됩니다(주말 및 월, 화 주문건 제외)
                                                <br />
                                                - 원요일, 화요일 주문건은 주말 배송물량이 많아 주문일로부터 1~2일내 순차 출고됩니다
                                                <br />
                                                - 이벤트 진행으로 주문건 증가 시 모든 주문건 순차적으로 출고됩니다
                                                <br />
                                                - 결제 완료 후 평일 기준 평균 2~3일정도 이내에 배송되며(산간지역 제외), 주말/공휴일/명절 연휴가 포함되거나 택배사
                                                사정으로 인해 배송소요 시일은 달라질 수 있습니다.
                                                <br />
                                                - 제품 발송이 진행된 이후에는 교환/취소/주소 변경이 어려우며, 발송 후 변경사항이 있을 경우에는 왕복 택배비는 5,000원이
                                                발생됩니다
                                                <br />
                                                - 주문 접수 후 1일 이내에 입금이 확인되지 않는 경우 자동으로 주문취소가 됩니다
                                            </p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-view__guide-item">
                                <div class="product-view__guide-item-header">
                                    <p class="product-view__guide-item-title">교환/반품/배송정보</p>
                                    <span
                                        class="product-view__guide-item-arrow product-view__guide-item-arrow--active"></span>
                                </div>
                                <div class="product-view__guide-contents product-view__guide-contents--active">
                                    <ul class="product-view__guide-contents-list">
                                        <li class="product-view__guide-contents-item">
                                            <p class="product-view__guide-contents-title">교환/환불절차</p>
                                            <p class="product-view__guide-contents-value">
                                                1. DRUGSTORE 고객센터나 홈페이지 1:1문의 게시판을 통해 접수
                                                <br />
                                                2. 당사로부터 전화 답신이나 게시판 답변을 확인(비용, 주소, 방법 및 절차 등을 안내)
                                                <br />
                                                3. 반품접수 후 영업일 기준 2~3일 이내에 자사 지정 택배기사님이 직접 방문 수거
                                                <br />
                                                4. 제품 도착 후 DRUGSTORE 환불 규정에 따라 7일 이내 순차적 처리됩니다
                                                <br />
                                            </p>
                                        </li>
                                        <li class="product-view__guide-contents-item">
                                            <p class="product-view__guide-contents-title">환불방법</p>
                                            <p class="product-view__guide-contents-value">
                                                반품 및 환불 접수된 상품이 정상적으로 회수 완료된 경우 아래와 같은 절차로 처리됩니다
                                                <br />
                                                - 무통장입금 : 고객님께서 남겨주신 계좌로 입금해드립니다
                                                <br />
                                                - 신용카드 결제 : 카드 결제 취소처리 해드리며, 처리 완료 후 카드사 사정에 따라 3~7일 후 승인취소 확인 될 수
                                                있습니다(취소 내역 확인은 이용하신 카드사로 문의주시면 정확한 안내 받으실 수 있습니다)
                                                <br />
                                                - 적립금 결제 : 고객님 아이디의 적립금으로 환원됩니다
                                                <br />
                                                - 휴대폰 결제 : 결제 달 이내라면 결제 취소처리 가능하나, 다음 달로 넘어가게되는 경우 휴대폰 요금이 이미 납부처리되어
                                                승인취소가 불가하여 남겨주시는 계좌로 입금해드립니다
                                            </p>
                                        </li>
                                        <li class="product-view__guide-contents-item">
                                            <p class="product-view__guide-contents-title">반품/교환철회</p>
                                            <p class="product-view__guide-contents-value">
                                                교환, 반품을 요청하였으나 철회하고자 할 경우에는 당사 고객센터(02-6013-0855)나 1:1문의게시판으로 문의해주시면
                                                신속하게 처리해드립니다
                                            </p>
                                        </li>
                                        <li class="product-view__guide-contents-item">
                                            <p class="product-view__guide-contents-title">반품/교환<br />가능 시점</p>
                                            <p class="product-view__guide-contents-value">
                                                반품 및 환불 접수된 상품이 정상적으로 회수 완료된 경우 아래와 같은 절차로 처리됩니다
                                                <br />
                                                - 상품을 사용하지 않았거나 포장을 훼손하지 않은 경우, 7일 이내에 반품 신청 가능합니다
                                                <br />
                                                - 상품 파손 및 오배송의 경우
                                                <br />
                                                - 제품 사용 후 부작용이 생긴 경우
                                                <br />
                                                - 내용물이 2/3이상 남은 경우에 한해, 증상이 나타난 사진이나 진단서 첨부 시 (진료비 및 약제등은 지원되지 않습니다)
                                                <br />
                                                - 상품 불량 및 트러블로인한 교환 및 반품(환불)은 전자상거래법에 의거, 주문 날짜로부터 30일이 지나면 반품 및 환불이
                                                불가능합니다
                                            </p>
                                        </li>
                                        <li class="product-view__guide-contents-item">
                                            <p class="product-view__guide-contents-title">반품/교환<br />불가 사유</p>
                                            <p class="product-view__guide-contents-value">
                                                - 제품 포장 손상 또는 개봉 및 사용한 경우
                                                <br />
                                                - 배송일로 부터 7일이 경과된 경우
                                                <br />
                                                - DRUGSTORE 공식 판매처에서 구입한 제품이 아니거나, 구매내역이 확인되지 않는 경우
                                                <br />
                                                - 고객님의 부주의로 제품이 파손 및 손상된 경우
                                                <br />
                                                - 제품의 겉포장이 손상되거나 분실한 경우
                                                <br />
                                                - 부작용으로 인한 교환 및 반품 요청 시 진단서가 제출되지 않은 경우
                                                <br />
                                                - 부작용으로 인한 교환 및 반품 요청 시 배송일로 부터 20일이 지난 경우
                                                <br />
                                                - 왕복 배송비 5,000원이 동봉되지 않은 경우
                                            </p>
                                        </li>
                                        <li class="product-view__guide-contents-item">
                                            <p class="product-view__guide-contents-title">반품/교환 택배비</p>
                                            <p class="product-view__guide-contents-value">
                                                반품/교환 또는 무료배송 시 왕복 배송비 5,000원
                                                <br />
                                                상품 불량 및 오배송 등의 이유로 반품하실 경우, 반품 배송비는 무료입니다
                                                <br />
                                                단순변심 및 고객님의 사정으로 반품/교환 하실 경우 배송비는 고객님 부담입니다
                                            </p>
                                        </li>
                                        <li class="product-view__guide-contents-item">
                                            <p class="product-view__guide-contents-title">신청방법</p>
                                            <p class="product-view__guide-contents-value">
                                                반드시 DRUGSTORE 1:1문의게시판이나 고객센터로 접수해주세요
                                                <br />
                                                교환, 반품, 환불은 공정거래위원회의 표준약관에 의거하여 제품이 배송일로부터 7일이내에 교환 및 환불이 가능합니다
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
                                            <form action="" name="reviewboardsearch" id="reviewboardsearch">
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
                                                    <li class="product-review__top-item">
                                                        <input type="button" value="리뷰작성" name="board_write_btn"
                                                            id="product_review_write_btn"
                                                            class="btn_chg product-review__write-btn" />
                                                    </li>
                                                </ul>
                                            </form>
                                            <!-- // 검색폼 -->
                                            <table class="bbslist_table_style product-review__table">
                                                <tbody>
                                                    <!-- 반복문 시작 -->
                                                    <!-- 리뷰 미리보기 -->
                                                    <tr class="product-review__item-header datalist">
                                                        <td class="sbj product-review__item-header-contents relative">
                                                            <div
                                                                class="product-review__item-header-box hand boad_view_btn">
                                                                <div class="product-review__item-header-top">
                                                                    <div
                                                                        class="product-review__item-header-top-wrapper">
                                                                        <div class="product-review__star">
                                                                            <!-- 별점 개수에 따라서 별 i태그 넣기 -->
                                                                        </div>
                                                                        <div class="memberId product-review__writer">
                                                                            pota**</div>
                                                                    </div>
                                                                    <div
                                                                        class="product-review__arrow-btn product-review__arrow-btn--active">
                                                                        <img src="" alt=""
                                                                            class="product-review__arrow-btn-img">
                                                                    </div>
                                                                </div>
                                                                <!-- 토글 열리면 #productview는 display="none"-->
                                                                <div id="productview"
                                                                    class="productviewbox product-review__view-box">
                                                                    <div class="pic product-review__img-wrap">
                                                                        <span>
                                                                            <img src="" alt=""
                                                                                class="hand small_product_img pic product-review__img">
                                                                        </span>
                                                                    </div>
                                                                    <div class="info product-review__subject-wrap">
                                                                        <div
                                                                            class="board-cont product-review__subject-btn">
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
                                                    <tr class="hide productviewer product-review__item-viewer"
                                                        style="display: table-row;">
                                                        <td
                                                            class="pd0 product-review__item-viewer-contents-wrap relative">
                                                            <p class="product-review_viewer-date">2022.09.18</p>
                                                            <div class="product-review__viewer-img-list">
                                                                <div class="product-review__viewer-img-wrap">
                                                                    <img src="" alt=""
                                                                        class="product-review__viewer-img">
                                                                </div>
                                                            </div>
                                                            <div class="productviewer product-review__viewer">
                                                                <div class="boardlayout">
                                                                    <div class="bbsview">
                                                                        <div class="viewbox">
                                                                            <form action="#" name="review-form1"
                                                                                id="review-form1" method="POST">
                                                                                <!-- 리뷰 수정/삭제에 필요한 정보들 hidden으로 넣어주세요 -->
                                                                                <input type="hidden" name="pcode"
                                                                                    id="pcode" />
                                                                                <table style="width: 100%;">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td colspan="2"
                                                                                                class="relative product-review__viewer-td">
                                                                                                <div
                                                                                                    class="content hand viewerlay_close_btn product-review__viewer-contents">
                                                                                                    이게 바로 말로만 듣던 소매넣기
                                                                                                    인가요?
                                                                                                    이게 바로 말로만 듣던 소매넣기
                                                                                                    인가요?
                                                                                                    이게 바로 말로만 듣던 소매넣기
                                                                                                    인가요?
                                                                                                    이게 바로 말로만 듣던 소매넣기
                                                                                                    인가요?
                                                                                                    이게 바로 말로만 듣던 소매넣기
                                                                                                    인가요?
                                                                                                    이게 바로 말로만 듣던 소매넣기
                                                                                                    인가요?
                                                                                                    이게 바로 말로만 듣던 소매넣기
                                                                                                    인가요?

                                                                                                </div>
                                                                                                <div
                                                                                                    class="product-review__viewer-btn-wrap">
                                                                                                    <input type="button"
                                                                                                        value="수정"
                                                                                                        id="review-update-btn"
                                                                                                        class="product-review__update-btn" />
                                                                                                    <input type="button"
                                                                                                        value="삭제"
                                                                                                        id="review-delete-btn"
                                                                                                        class="product-review__delete-btn" />
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
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
                                            <form action="" name="qnaboardsearch" id="qnaboardsearch">
                                                <div class="product-qna__top">
                                                    <div class="board_info_top">
                                                        <p>배송, 주문(취소/교환/환불)관련 문의는 고객센터 1:1 고객상담에 남겨주세요.</p>
                                                        <a href="#">1:1 문의하기</a>
                                                    </div>
                                                    <div class="product-qna__top_btn_wrapper">
                                                        <span>제품 문의</span>
                                                        <input type="button" value="문의하기" name="board_write_btn"
                                                            id="product_qna_write_btn"
                                                            class="btn_chg product-qna__write-btn hand" />
                                                    </div>
                                                </div>
                                            </form>
                                            <!-- // qnaboardsearch 히든폼 -->
                                            <table class="bbslist_table_style product-qna__table">
                                                <tbody>
                                                    <!-- 반복문 시작 -->
                                                    <tr class="datalist product-qna__item-header">
                                                        <td class="product-qna__item pd0">
                                                            <div class="product-qna__item-contents relative">
                                                                <!-- 비밀글일 때 -->
                                                                <div
                                                                    class="board_cont product-qna__contents hand board_view_btn_mbno">
                                                                    <div>
                                                                        <span class="product-qna__secret">
                                                                            <!-- 자물쇠 i코드 -->
                                                                        </span>
                                                                        <span class="product-qna__contents-text">
                                                                            비밀글입니다
                                                                        </span>
                                                                    </div>
                                                                    <div
                                                                        class="product-review__arrow-btn product-review__arrow-btn--active">
                                                                        <img src="" alt=""
                                                                            class="product-review__arrow-btn-img">
                                                                    </div>
                                                                </div>
                                                                <div class="product-qna__item-info">
                                                                    <p
                                                                        class="product-qna__status product-qna__status--complete">
                                                                        답변완료</p>
                                                                    <div class="product-qna__item-info-right">
                                                                        <div class="product-qna__item-writer">pota**
                                                                        </div>
                                                                        <div class="product-qna__item-date">2022.09.18
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr class="datalist product-qna__item-header">
                                                        <td class="product-qna__item pd0">
                                                            <!-- 비밀글 아닐 때 -->
                                                            <div class="product-qna__item-contents relative">
                                                                <div
                                                                    class="board_cont product-qna__contents hand board_view_btn">
                                                                    <div>
                                                                        <span class="product-qna__contents-text">
                                                                            비피다 바이옴 콤플렉스 앰플 구성인거죠?
                                                                        </span>
                                                                    </div>
                                                                    <div
                                                                        class="product-review__arrow-btn product-review__arrow-btn--active">
                                                                        <img src="" alt=""
                                                                            class="product-review__arrow-btn-img">
                                                                    </div>
                                                                </div>
                                                                <div class="product-qna__item-info">
                                                                    <p
                                                                        class="product-qna__status product-qna__status--complete">
                                                                        답변완료</p>
                                                                    <div class="product-qna__item-info-right">
                                                                        <div class="product-qna__item-writer">pota**
                                                                        </div>
                                                                        <div class="product-qna__item-date">2022.09.18
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- // 비밀글 아닐 때 -->
                                                            <!-- 문의글 토글 열면 나오는 부분 -->
                                                            <!-- 토글 누르면 display="block"으로 수정-->
                                                            <article class="hide productviewer product-qna__viewer">
                                                                <div class="product-qna__viewer-contents-wrap">
                                                                    <div class="productviewer">
                                                                        <div class="boardlayout">
                                                                            <div class="bbsview">
                                                                                <div class="viewbox">
                                                                                    <form action="#" name="qna-form1"
                                                                                        id="qna-from1" method="POST">
                                                                                        <!-- qna 수정에 필요한 정보들 input hidden으로 넣기 -->
                                                                                        <table style="width: 100%;">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <div
                                                                                                            class="contet product-qna__viewer-contents pd0">
                                                                                                            <p
                                                                                                                class="product-qna__viewer-mark">
                                                                                                                Q
                                                                                                            </p>
                                                                                                            <div
                                                                                                                class="product-qna__viewer-contents-text-wrap relative">
                                                                                                                <div
                                                                                                                    class="product-qna__viewer-contents-text viewerlay_close_btn hand">
                                                                                                                    이미지는
                                                                                                                    비피다
                                                                                                                    콤플렉스
                                                                                                                    앰플인데
                                                                                                                    제목은
                                                                                                                    바이옴이라고
                                                                                                                    써있어서
                                                                                                                    정확한
                                                                                                                    구성품이
                                                                                                                    뭔지 잘
                                                                                                                    모르겠어요
                                                                                                                </div>
                                                                                                            </div>
                                                                                                            <div
                                                                                                                class="product-qna__viewer-btn-wrap">
                                                                                                                <input
                                                                                                                    type="button"
                                                                                                                    value="수정"
                                                                                                                    id="qna-update-btn"
                                                                                                                    class="product-qna__update-btn" />
                                                                                                                <input
                                                                                                                    type="button"
                                                                                                                    value="삭제"
                                                                                                                    id="qna-delete-btn"
                                                                                                                    class="product-qna__delete-btn" />
                                                                                                            </div>
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="reply product-qna__reply">
                                                                                                            <p
                                                                                                                class="product-qna__viewer-mark product-qna__viewer-mark--answer">
                                                                                                                A
                                                                                                            </p>
                                                                                                            <div
                                                                                                                class="product-qna__reply-text">
                                                                                                                안녕하세요,고객님.
                                                                                                                마녀공장입니다
                                                                                                                ^ㅂ^
                                                                                                                <br>
                                                                                                                문의주신 상품은
                                                                                                                비피다 바이옴
                                                                                                                콤플렉스 앰플
                                                                                                                50ml 더블
                                                                                                                세트로
                                                                                                                <br>
                                                                                                                '비피다 바이옴
                                                                                                                콤플렉스 앰플'
                                                                                                                제품 2입으로
                                                                                                                구성되어
                                                                                                                있습니다.
                                                                                                                <br>
                                                                                                                이미지상에
                                                                                                                오류가 있어,
                                                                                                                제품선택에
                                                                                                                혼동을 드린 점
                                                                                                                죄송합니다.
                                                                                                                ㅜㅜ
                                                                                                                <br>
                                                                                                                고객님의 소중한
                                                                                                                의견 덕분에
                                                                                                                많은 고객분들께
                                                                                                                더욱 더 정확한
                                                                                                                정보를 제공드릴
                                                                                                                수 있게
                                                                                                                되었습니다.
                                                                                                                감사합니다.
                                                                                                                <br>
                                                                                                                추가 문의사항이
                                                                                                                있으시면 언제든
                                                                                                                게시판에
                                                                                                                남겨주시면,
                                                                                                                확인후
                                                                                                                답변드리겠습니다.
                                                                                                                <br>
                                                                                                                감사합니다~
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </form>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </article>
                                                        </td>
                                                    </tr>
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




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>