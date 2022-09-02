<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1 : 1 문의하기</title>
</head>
<body>
	<h2>1 : 1 문의하기</h2>
	
	<form action="">
		<fieldset>
			<legend>문의 등록하기</legend>
			<tabel>
				<tr>
					<td>분류</td>
					<td>
						<select name="gubun">
							<option value="1">제품문의</option>
							<option value="2">회원관리</option>
							<option value="3">배송문의</option>
							<option value="4">주문/결제</option>
							<option value="5">취소/반품/환불</option>
							<option value="6">기타</option>	
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="questTitle">문의 제목</label></td>
					<td><input type="text" id="questTitle" size="50" placeholder="문의 제목을 입력하세요."/></td>
				</tr>
				<tr>
					<td><label for="questContent">문의 내용</label></td>
					<td><input type="text" id="questContent" size="50" placeholder="문의 내용을 입력하세요."/></td>
				</tr>
				<tr>
					<td><label for="file">파일</label></td>
					<td><input type="file" name="selectfile"/></td>
				</tr>
			</tabel>
			<button type="button" onclick="submit('questionInsert');">제출하기</button>
		</fieldset>	
	</form>

</body>
</html>