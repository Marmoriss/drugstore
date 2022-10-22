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

<!-- bootstrap js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<!-- 폰트 -->
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/34c760bbb4.js" crossorigin="anonymous"></script>

<!-- 사용자 작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review/reviewEnroll.css" />

<c:if test="${not empty msg}">
	<script>
		alert(${msg});
	</script>
</c:if>
<body>
	<div id="layout_body">
		<div style="margin:auto;">
			<div id="boardlayout" class="products-view__wrapper">
		        <div id="bbswrite">
		            <div class="products-view__board-products">
		                <div class="products-view__board-products-img-wrap">
		                    <img src="${pageContext.request.contextPath}/resources/upload/product/${renamedFilename}" class="products-view__board-products-img">
		                </div>
		                <p class="products-view__board-products-title">${product.pname}</p>
		            </div>
		            <form:form name="writeform" action="${pageContext.request.contextPath}/review/reviewEnroll.do" id="writeform"
		                method="POST" enctype="multipart/form-data">
		                <div class="table-wrap">
		                    <input type="hidden" name="memberId" id="memberId" value="${memberId}">
		                    <input type="hidden" name="pcode" id="pcode" value="${product.pcode}">
		                    <div>
		                        <p scope="row" class="products__star">별점</p>
		                        <div class="products__star--checkbox">
		                            <div class="score-wrap">
		                                <input type="radio" name="star" id="star05" class="star-input hide" value="5" checked>
		                                <label for="star05" class="score"></label>
		                                <input type="radio" name="star" id="star04" class="star-input hide" value="4">
		                                <label for="star04" class="score"></label>
		                                <input type="radio" name="star" id="star03" class="star-input hide" value="3">
		                                <label for="star03" class="score"></label>
		                                <input type="radio" name="star" id="star02" class="star-input hide" value="2">
		                                <label for="star02" class="score"></label>
		                                <input type="radio" name="star" id="star01" class="star-input hide" value="1">
		                                <label for="star01" class="score"></label>
		                            </div>
		                        </div>
		                    </div>
		                    <div>
		                        <p class="products__contents">내용</p>
		                        <textarea name="content" id="content" class="contents-textarea"></textarea>
		                    </div>
		                    <div>
		                        <p class="mobile-file-name">첨부파일</p>
		                        <p class="mobile-file-info">* 최대 20MB까지 가능</p>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="inputGroupFileAddon01">첨부파일</span>
									</div>
									<div class="custom-file">
										<input type="file" class="custom-file-input" name="upFile" id="upFile" aria-describedby="inputGroupFileAddon01">
										<label class="custom-file-label" for="upFile"></label>
									</div>
								</div>
		                    </div>
		                </div>
		                <div class="btn_wrap mt40">
		                    <button type="button" class="btn_wrap__cancel" onclick="history.go(-1);">
		                        <p class="btn_wrap__cancel--text1">취소</p>
		                    </button>
		                    <button type="submit" class="btn_wrap__register" name="data_save_btn" id="data_save_btn">
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
document.querySelectorAll("[name=upFile]").forEach((input) => {
	input.addEventListener("change", (e) => {
		const {files} = e.target;
		const label = e.target.nextElementSibling;
		if(files[0]){
			label.textContent = files[0].name;
		}
		else{
			label.textContent = "파일을 선택하세요";
		}
	});
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>