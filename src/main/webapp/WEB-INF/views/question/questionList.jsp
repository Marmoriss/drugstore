<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InquiryList</title>
</head>
<body>

	<form name="userForm">
	<h1>1 : 1 문의 게시판형태로 출력</h1>
	
	<table>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">답변 여부</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list}" var="list">
			<tr>
				<td class="text_list">${list.no}&nbsp;</td>
				<td class="text_list">${list.title}&nbsp;</td>
				<td class="text_list">${list.writer}&nbsp;</td>
				<td class="text_list"><fmt:formatdate value="${list.reg_date}" pattern="yyyy/MM/dd" /></td>
				<td class="text_list">${list.answered}&nbspp;</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>
</body>
</html>