// ws.js
const ws = new SockJS(`http://${location.host}/drugstore/stomp`);
const stompClient = Stomp.over(ws);


stompClient.connect({}, (frame) => {
	console.log("connect : ", frame);
	
	// 연결이후 구독신청
	/*
	stompClient.subscribe("/topic/a", (message) => {
		console.log("topic/a : ", message);
	});
	
	stompClient.subscribe("/app/a", (message) => {
		console.log("app/a : ", message);
	}); 
	*/
	
});


