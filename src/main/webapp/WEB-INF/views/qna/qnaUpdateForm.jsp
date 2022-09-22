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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/qna/qnaUpdateForm.css" />

<body>
	<div id="layout_body">
		<div style="margin:quto;">
			<div id="boardlayout" class="product-view__wrapper">
				<div id="bbswrite">
					<form:form name="updateQnaForm" id="updateQnaForm" method="POST" action="${pageContext.request.contextPath}/qna/qnaUpdate.do">
						<div class="bbswite_table_style product-qna__write">
							<div>
								<div class="product-qna__write-item">
									<p class="product-qna__write-item-title">제목</p>
									<input type="text" name="subject" id="subject" class="product-qna__write-input" value="제목을 입력해주세요." placeholder="제목을 입력해주세요."/>
									<div class="product-qna__write-secret">
										<input type="checkbox" name="secret-check" id="secret-check" />
										<label for="secret-check">비밀글</label>
										<input type="number" name="password" id="password" />
									</div>
								</div>
							</div>
							<div>
								<div colspan="2" class="contents contents-change">
									<p class="product-qna__write-item-title">내용</p>
									<textarea name="contents" id="contents" class="contents-textarea" style="width:100%; height:300px;" contentheight="300px"></textarea>
								</div>
							</div>
						</div>
						<div class="btn-wrap mt40">
							<button class="btn_wrap__cancel">취소</button>
							<button class="btn_wrap__register" name="data_save_btn" id="data_save_btn">등록</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>













<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>