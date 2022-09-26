<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<!-- WebSocket:sock.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.js"></script>
<!-- WebSocket: stomp.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<style>
#chatFrm{
	margin: 0 auto;
	width: 400px;

}
#sendBtn{
	outline: none;
    border: none;
    background-color: rgb(122, 158, 177);
    color: white;
    font-size: 17px;
    font-weight: 500;
    border-radius:30px;
}
#header{
  height: 15px;
  background-color: rgb(255, 225, 182);
}
</style>
</head>
<body>
<div id="header"> </div>
<div id="chatFrm">
    <ul class="list-group list-group-flush" id="data">
    	<c:forEach items="${chatLogs}" var="chat">
    		<li class="list-group-item">${chat.memberId} : ${chat.msg}</li>
    	</c:forEach>  
    </ul>
    
	<input type="text" id="msg" class="form-control"
		placeholder="답변"> 
	<div class="input-group-append">
		<button id="sendBtn" class="btn btn-outline" type="button">전송</button>
	</div>
</div>
<script>
document.querySelector("#sendBtn").addEventListener('click', (e) => {
	const msg = document.querySelector("#msg").value;
	if(!msg) return;
	
	const payload = {
		chatroomId : '${param.chatroomId}',
		memberId : 'admin',
		msg,
		time : Date.now()
	};
	stompClient.send(`/app/chat/${param.chatroomId}`, {}, JSON.stringify(payload));
	
	document.querySelector("#msg").value = "";
});


// 새로운 윈도우이기 때문에 stomp connect 새로 해야함
const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);
const stompClient = Stomp.over(ws);

stompClient.connect({}, (frame) => {
	console.log("connect : ", frame);
	
	stompClient.subscribe(`/app/chat/${param.chatroomId}`, (message) => {
		console.log(`/app/chat/${param.chatroomId} : `, message);
		
		const {'content-type' : contentType} = message.headers;
		if(!contentType) return;
		
		const {memberId, msg} = JSON.parse(message.body);
		const html = `<li class="list-group-item">\${memberId} : \${msg}</li>`;
		
		document.querySelector("#data").insertAdjacentHTML('beforeend', html);
		
	});
});


</script>
</body>
</html>








