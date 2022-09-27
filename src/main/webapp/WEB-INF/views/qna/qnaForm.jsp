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

<c:if test="${not empty msg}">
	<script>
		alert(${msg});
	</script>
</c:if>
 
<body>
	<div id="layout_body">
		<div style="margin:auto;">
			<div id="boardlayout" class="product-view__wrapper">
				<div id="bbswrite">
					<form:form name="EnrollQnaForm" id="EnrollQnaForm" method="POST" action="${pageContext.request.contextPath}/qna/qnaEnroll.do">
						<input type="hidden" name="qnaId" value="${qna.qnaId}"/>
						<input type="hidden" name="pcode" value="${qna.pcode}"/>
						<div class="bbswrite_table_style product-qna__write">
							<div>
								<div class="product-qna__write-item">
									<div class="product-qna__write-secret">
										<input type="checkbox" name="secret-check" id="secret-check" ${qna.secretPassword eq 0 ? "" : "checked"}/>
										<label for="secret-check" class="secret-label">비밀글</label>
										<input type="password" name="secretPassword" id="password" placeholder="비밀번호 4자리" />
									</div>
								</div>
							</div>
							<div>
								<div colspan="2" class="contents contents-change">
									<p class="product-qna__write-item-title">내용</p>
									<textarea name="content" id="contents" class="contents-textarea" contentheight="300px">${qna.content}</textarea>
								</div>
							</div>
						</div>
						<div class="btn-wrap mt40">
							<button class="btn_wrap__cancel" onclick="history.go(-1);">
								<p class="btn_wrap__cancel--text1">취소</p>
							</button>
							<button class="btn_wrap__register" name="data_save_btn" id="data_save_btn">
								<p class="btn_wrap__register--text2">등록</p>
							</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
document.EnrollQnaForm.addEventListener('submit', (e) => {
	e.preventDefault();
	const frm = e.target;
	const secretPassword = frm.secretPassword;
	const checkbox = document.querySelector('#secret-check');
	
	if(checkbox.checked && !/^[0-9]{4}$/.test(secretPassword))
		alert('비밀번호는 0부터 9까지 4자리 숫자만 가능합니다.');

	if(secretPassword.value == ''){
		secretPassword.value = 0;
		console.log(secretPassword.value);
	}
	
	frm.submit();
});

</script>











<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>