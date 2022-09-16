<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="조회" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/qna.css" />
<table>
	<c:forEach items="${qna}" var="qna">
	<th>
		<td class="content">제목</td>
		<td colspan="5" class="left">${qna.content}</td>
	</th>
	<tr>
		<td>작성자</td>
		<td>${qna.writer}</td>
	</tr>
	<tr>
		<td class="answered">답변여부</td>
		<td class="answered">${qna.answered}</td>
	</tr>
	<tr>
		<td class="regDate">작성일</td>
		<td class="regDate">${qna.regDate}</td>
	</tr>
	<tr>
		<td colspan="2">내용</td>
	</tr>
	<tr>
		<td colspan="2" class="left">${qna.content}</td>
	</tr>
	</c:forEach>
</table>
   <br />
   <div class="btnSet">
   	<a class="btn-fill" href="${pageContext.request.contextPath}/qna/qnaList.do">목록으로</a>
   	<!-- 작성자 본인만 수정/삭제 가능. 수정/삭제 버튼은 작성자가 본인일때만 보여야함 -->
   	<c:if test="${qna.writer eq 'Y'}">
		<input type="button" value="수정" id="btn-update" class="btn-update" 
			onclick="location.href='${pageContext.request.contextPath}/qna/qnaUpdate.do';"/>
				<input type="button" value="삭제" id="btn-delete" class="btn-delete" 
			onclick="location.href='${pageContext.request.contextPath}/qna/qnaDelete.do';"/>
   	</c:if>
   </div>
   		
		<input type="button" value="답글" id="btn-write" class="btn-write" 
			onclick="location.href='${pageContext.request.contextPath}/qna/qnaReply.do';"/>
		
		
    <hr style="margin-top:30px;" />    
    <hr/>
    
    <div class="comment-container">
        <div class="comment-editor">
        	<sec:authorize access="hasRole('ADMIN')">
	            <form
	            	action="${pageContext.request.contextPath}/qna/qnaReplay.do" method="post" name="qnaCommentFrm">
	                <input type="hidden" name="qnaId" value="${qna.qnaId}" />
	                <input type="hidden" name="writer" value="${qna.writer}" />                
	                <input type="hidden" name="commentLevel" value="1" />
	                <input type="hidden" name="commentRef" value="0" />    
	                <textarea name="content" cols="60" rows="3"></textarea>
	                <button type="submit" id="btn-comment-enroll1">등록</button>
	            </form>
           	</sec:authorize>
        </div>
    </div>
         <!--table#tbl-comment-->
			<table id="tbl-comment">
				<tbody>
					<tr class="level1">
						<td>
							<sub class="comment-writer"></sub>
							<sub class="comment-date"></sub>
							<br />
						</td>
						<td>
							<button class="btn-reply" value="">답글</button>
							<button class="btn-delete" value="">삭제</button>
						</td>
					</tr>
					<tr class="level2">
						<td>
							<sub class="comment-writer"></sub>
							<sub class="comment-date"></sub>
							<br />
						</td>
						<td>
							<button class="btn-delete" value="">삭제</button>
	
						</td>
					</tr>
	
				</tbody>
			</table>
	
