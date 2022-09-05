<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Q&A" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/detailInfo.css" />
<div id="container">
	<h3 class="contain-title">Q&A</h3>
	<br>
	<p class="contain-content">
		"구매하시려는 상품에 대해 궁금한 점이 있는 경우 문의해주세요."
	</p>
	<div>
		<a href="${pageContext.request.contextPath}/product/productQna.do">상품 Q&A 작성하기</a>
	</div>
	<div class="content-myQna">
		<div class="content-myQna wrap">
			<input type="checkbox" class="myQna" id="qnaSwitch" checked />
			<label class="qna_box" for="qnaSwitch">
				<span class="myQna_see">내 Q&A 보기</span>
			</label>
		</div>
		<div class="dropdown">
		  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    답변상태
		  </button>
		  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
		    <a class="dropdown-item" href="#">답변상태</a>
		    <a class="dropdown-item" href="#">미답변</a>
		    <a class="dropdown-item" href="#">답변완료</a>
		  </div>
		</div>
	</div>
		<table id="tbl-qna" class="table table-striped table-hover">
		<tr>
			<th>답변상태</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:if test="${empty list}">
			<tr>
				<td colspan="4" class="text-center">조회된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty list}">
			<c:forEach items="${list}" var="qna">
				<tr data-no="${qna.no}">
					<td>${qna.no}</td>
					<td>${qna.title}</td>
					<td>${qna.memberId}</td>
					<td>
						<fmt:parseDate value="${qna.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
						<fmt:formatDate value="${createdAt}" pattern="MM-dd HH:mm"/>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<nav>
		${pagebar}
	</nav>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>