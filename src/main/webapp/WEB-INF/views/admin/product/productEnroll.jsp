<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="/WEB-INF/views/admin/header.jsp">
	<jsp:param name="title" value="헬로우 스프링" />
</jsp:include>

<!-- 사용자 작성 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/header.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/product-list.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/product-enroll.css" />

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
				<form:form name="productEnrollFrm"
					action="${pageContext.request.contextPath}/admin/product/productEnroll.do"
					method="post" enctype="multipart/form-data">
					<!-- 조회폼 선택지 시작 -->
					<div class="panel-body">
						<div class="admin-search-section">
							<ul class="admin-list-border">
								<!-- 카테고리 선택 시작 -->
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
								<!-- /카테고리 선택 끝 -->
								<!-- 상품명 입력 시작 -->
								<li>
									<div class="controll-label">상품명 / 제조사명</div>
									<div class="form-inline">
										<div class="form-group">
											<label>상품명</label>
											<input type="text" name="pname" id="pname" required/>
										</div>
										<div class="form-group">
											<label>제조사명</label>
											<input type="text" name="manu" id="manu" required/>
										</div>
									</div>
								</li>
								<!-- /상품명 입력 끝 -->
								<!-- 판매 금액 입력 시작 -->
								<li>
									<div class="control-label">판매 금액</div>
									<div class="form-inline price-wrap">
										<div class="form-group">
											<label for="price">판매가</label>
											<input type="text" name="price" required/>
										</div>
										<div class="form-group">
											<label for="discount-price">할인 금액</label>
											<input type="text" name="discount" required/>
										</div>
										<div class="form-group">
											<div class="control-label discount-price">할인가</div>
											<div class="text">
												<strong>0원</strong> <em>(0원 할인)</em>
											</div>
										</div>
									</div>
								</li>
								<!-- /판매 금액 입력 끝 -->
								<!-- 재고수량 입력 시작 -->
								<li>
									<div class="control-label">내용량</div>
									<div class="form-inline">
										<div class="form-group">
											<label for="amount">내용량</label>
											<input type="text" name="amount" required/>
										</div>
									</div>
								</li>
								<!-- /재고수량 입력 끝 -->
								<!-- 상품 이미지 입력 시작 -->
								<li>
									<div class="control-label">상품 이미지</div>
									<div class="input-group mb-3" style="padding: 0px;">
										<div class="input-group-prepend" style="padding: 0px;">
											<span class="input-group-text">메인 이미지</span>
										</div>
										<div class="custom-file">
											<input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
												<label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
										</div>
									</div>
									<div class="input-group mb-3" style="padding: 0px;">
										<div class="input-group-prepend" style="padding: 0px;">
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
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="button" class="btn btn-default">초기화</button>
						</div>
					</div>
					<!-- /검색 / 초기화 버튼 끝 -->
				</form:form>
			</div>
		</div>
		<script>

document.productEnrollFrm.addEventListener('submit', (e) => {
	e.preventDefault();
	const frm = e.target;
	const category = 
		document.querySelector('.small-category').value == null ? null : 
			document.querySelector('.small-category').value == '소분류' ? null : document.querySelector('.small-category').value;
	document.querySelector('#categoryId').value = category;
	
	if(category == null) {
		alert("카테고리를 선택해주세요.");
		return;
	}
	
	const pname = frm.pname.value;
	const manu = frm.manu.value;
	const price = frm.price.value;
	const discount = frm.discount.value;
	const amount = frm.amount.value;
	const upFile1 = document.querySelector('#upFile1').value;
	const upFile2 = document.querySelector('#upFile2').value;
	
	console.log(category, pname, manu, price, discount, amount, upFile1, upFile2);

	frm.submit();
})

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

// openApi 상품 리스트 등록
// document.querySelector('.btn-default').addEventListener('click', (e) => {
// 	$.ajax({
// 		url: "${pageContext.request.contextPath}/data/data.do",
// // 		url: "https://apis.data.go.kr/1471000/HtfsInfoService2/getHtfsItem?serviceKey=guVozzj6L6NkisOO0rbzbNW452DgE9%2BlwN2QEWSeXtPyVmOY7ZVd9DHA6hVwbHyIV6jPP79NaXo%2BY36RkyNIsQ%3D%3D&pageNo=1&numOfRows=10&type=xml",
// 		success(data){
// 			console.log(data);
// 		},
// 		error : console.log
// 	})
// });


</script>
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