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
	<tr>
		<th class="title">제목</th>
		<td colspan="5" class="left">${qna.title}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${qna.name}</td>
		<th class="answered">답변여부</th>
		<td class="answered">${qna.answered}</td>
		<th class="regDate">작성일</th>
		<td class="regDate">${qna.regDate}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="5" class="left">${fn:replace(qna.content, '<br>') }</td>
	</tr>
</table>
   <br />
   <%-- 해당 게시글 작성자가(관리자)한테만 수정/답글/삭제버튼이 보일것 --%>
   <sec:authorize access="hasRole('ADMIN')">
   	<button type="button" 
			class="btn-update"
			onclick="location.href='${pageContext.request.contextPath}/qna/qnaUpdate.do?no=${qna.qnaId}';">수정</button>
   	<button type="button" 
			class="btn-replay"
			onclick="location.href='${pageContext.request.contextPath}/qna/qnaReplay.do?no=${qna.qnaId}';">답글</button>
	<button type="button" 
			class="btn-delete"
			onclick="location.href='${pageContext.request.contextPath}/qna/qnaDelete.do?no=${qna.qnaId}';">삭제</button>   
</sec:authorize>

    <hr style="margin-top:30px;" />    
    
    <div class="comment-container">
        <div class="comment-editor">
            <form
            	action="${pageContext.request.contextPath}/qna/qnaReplay.do" method="post" name="qnaCommentFrm">
                <input type="hidden" name="qnadId" value="${qna.qnaId}" />
                <input type="hidden" name="writer" value="${qna.writer}" />                
                <input type="hidden" name="commentLevel" value="1" />
                <input type="hidden" name="commentRef" value="0" />    
                <textarea name="content" cols="60" rows="3"></textarea>
                <button type="submit" id="btn-comment-enroll1">등록</button>
            </form>
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
    </div>
