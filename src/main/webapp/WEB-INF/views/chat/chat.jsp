<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.drugstore.chat.model.dto.ChatLog"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="관리자와 채팅" name="title" />
</jsp:include>
<style>
#chatFrm{
	padding-top : 350px;
}

</style>
<div id="chatFrm" class="input-group mb-3">
	<input type="text" id="msg" class="form-control"
		placeholder="문의 내용 작성">
	<div class="input-group-append" style="padding: 0px;">
		<button id="sendBtn" class="btn btn-outline" type="button">Send</button>
	</div>
</div>
<div>
    <ul class="list-group list-group-flush" id="data">
	<%-- 전 채팅 내역 불러오기 --%>
	<c:forEach items="${chatLogs}" var="chat">
    		<%
    			ChatLog chat = (ChatLog) pageContext.getAttribute("chat");
    			String time = new Date(chat.getTime()).toString(); 
    			
    		%>
    		<li class="list-group-item" title="<%= time %>">${chat.time}>> ${chat.memberId} : ${chat.msg}</li>
    	</c:forEach> 
    </ul>
</div>
<script>
document.querySelector("#sendBtn").addEventListener('click', () => {
	const msg = document.querySelector("#msg").value;
	if(!msg) return;
	
	const payload = {
		chatroomId : '${chatroomId}',
		memberId : '<sec:authentication property="principal.username"/>',
		msg,
		time : Date.now()
	};
	
	stompClient.send(`/app/chat/${chatroomId}`, {}, JSON.stringify(payload));
	
	document.querySelector("#msg").value = "";
	
});

setTimeout(() => {
	stompClient.subscribe(`/app/chat/${chatroomId}`, (message) => {
		console.log(`/app/chat/${chatroomId} : `, message);

		// 채팅내용 두 번 입력되는 거 방지
		const {'content-type' : contentType} = message.headers;
		if(!contentType) return;
		
		// message.body 문자열 이므로 json 객체로 만들기
		const {memberId, msg, time} = JSON.parse(message.body);
		const html = `
			<li class="list-group-item" title="\${new Date(time).toLocaleString()}">\${memberId} : \${msg}</li>
		`;
		
		// 채팅내용 append
		const wrapper = document.querySelector("#data");
		wrapper.insertAdjacentHTML('beforeend', html);
	});	
}, 500);
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>