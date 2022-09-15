<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="title" value="헬로우 스프링" />
</jsp:include>

<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/34c760bbb4.js" crossorigin="anonymous"></script>

<!-- datepicker -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

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
							<h2 class="title">상품 수정</h2>
						</div>
					</div>
				</div>
				<div class="admin-sub-content">
					<!-- 상품 수정 폼 시작 -->
					<div class="panel panel-admin">
						<form:form 
							action="${pageContext.request.contextPath}/admin/product/productUpdate.do" 
							name="productUpdateFrm" 
							method="POST"
							enctype="multipart/form-data">
							<!-- 조회폼 선택지 시작 -->
							<div class="panel-body">
								<div class="admin-search-section">
									<ul class="admin-list-border">
										<!-- 검색어로 검색 시작 -->
										<li>
											<div class="control-label">상품 정보</div>
											<div class="form-inline">
												<div class="form-group">
													<label>상품 번호</label>
													<input type="text" name="pcode" id="pcode" value="${product.pcode}" readonly/>
												</div>
												<div class="form-group">
													<label>상품명</label>
													<input type="text" name="pname" id="pname" value="${product.pname}"/>
												</div>
												<div class="form-group">
													<label>제조사명</label>
													<input type="text" name="manu" id="manu" value="${product.manu}"/>
												</div>
												<div class="form-group">
													<label>내용량</label>
													<input type="text" name="amount" id="amount" value="${product.amount}"/>&ensp; 개
												</div>
											</div>
										</li>
										<li>
											<div class="control-label">판매 금액</div>
											<div class="form-inline price-wrap">
												<div class="form-group">
													<label for="">판매가</label>
													<input type="text" value="${product.price}" name="price"/>
												</div>
												<div class="discount-wrap">
													<div class="form-group">
														<label for="">할인 금액</label>
														<input type="text" value="${product.discount}" name="discount"/>
													</div>
												</div>
											</div>
											<div class="control-label discount-price">총 금액</div>
											<div class="text">
												<strong>${product.price - product.discount}원</strong>
												<em>(${product.discount}원 할인)</em>
											</div>
										</li>
										<!-- /검색어로 검색 끝 -->
										<!-- 판매 상태 검색 시작 -->
										<li>
											<div class="control-label">판매 상태</div>
											<div class="form-group checkbox-wrap">
											<input type="hidden" name="saleStatus" id="saleStatus" value=""/>
												<div>
													<input type="radio" name="saleStatuses" value="Y" id="getY" ${product.saleStatus == 'Y' ? "checked" : ""} />
													<label for="getY">판매중</label>
												</div>
												<div>
													<input type="radio" name="saleStatuses" value="S" id="getSoldOut" ${product.saleStatus == 'S' ? "checked" : ""} />
													<label for="getSoldOut">품절</label>
												</div>
												<div>
													<input type="radio" name="saleStatuses" value="N" id="getN" ${product.saleStatus == 'N' ? "checked" : ""} />
													<label for="getN">판매 종료</label>
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
												<input type="hidden" name="categoryId" id="categoryId" value="" />
											</div>
										</li>
										<li>
											<div class="control-label">상품 이미지</div>
												<c:forEach items="${product.attachments}" var="attachment" varStatus="vs">
													<c:if test="${attachment.attachNo != 0}">
														<div class="btn-group-toggle p-0 mb-3" data-toggle="buttons">
															<label class="btn btn-outline-danger btn-block" style="overflow: hidden" title="">
																<input type="checkbox" id="delFile${vs.count}" name="delFile" value="${attachment.attachNo}">
																첨부파일 삭제 - ${attachment.originalFilename}
															</label>
														</div>
													</c:if>
												</c:forEach>
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
										<!-- /카테고리 검색 끝 -->
									</ul>
								</div>
							</div>
							<!-- /조회폼 선택지 끝 -->
							<!-- 수정 / 초기화 버튼 시작 -->
							<div class="panel-footer">
								<div class="admin-button-area">
									<button type="submit" class="btn btn-primary">수정</button>
									<button type="button" class="btn btn-default">초기화</button>
								</div>
							</div>
							<!-- /수정 / 초기화 버튼 끝 -->
						</form:form>
					</div>
					<!-- /상품 조회 폼 끝 -->
				</div>
			</div>
		</div>
		<!-- /admin content 끝 -->
<script>
document.querySelectorAll("[name=saleStatuses]").forEach((radio) => {
	radio.addEventListener("change", (e) => {
		saleStatus = e.target.value;
		document.querySelector('#saleStatus').value = saleStatus;
	});
});

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

window.addEventListener('load', (e) => {

	// 상품별로 카테고리 코드 띄우기
	const categoryId = ${product.categoryId};
	if(${product.categoryId} != 0){
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/getCategoryParentLevel.do",
			method: "GET",
			data : {categoryId},
			success(category){
				console.log(category);
				const {categoryId, categoryLev, categoryNm, categoryDetailName, categoryParentLev} = category;
				document.querySelector('.big-category').value = categoryParentLev;
				document.querySelector('.small-category').innerHTML = "<option id='small-category' value='" + categoryId + "' checked>" + categoryDetailName + "</option>";
				document.querySelector('#categoryId').value = categoryId;
			},
			error(jqxhr, statusText, err){
	            console.log(jqxhr, statusText, err);
	        }
		});
	};
	
});
// 제조사명 자동 완성
$('#manu').autocomplete({
	source(request, response){
		console.log(request);
		const {term} = request;
		
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/autocompleteManu.do",
			method : "GET",
			data : {term},
			success(manus){
				console.log(manus);
				const arr = manus.map((manu) => ({
					label : manu,
					value : manu
				}));
				console.log(arr);
				response(arr);
			},
			error(jqxhr, statusText, err){
                   console.log(jqxhr, statusText, err);
               }
		});
	},
	focus(e, selected){return false;}
});

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
			
			data.forEach(({categoryDetailName, categoryId}) => {
				console.log(categoryDetailName, categoryId);
				$(smallCategory).append("<option id='small-category' value='" + categoryId + "'>" + categoryDetailName + "</option>");
			});
		},
		error : console.log
	});
});
</script>
	</div>
</div>


</body>
</html>