<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="오더" name="title" />
</jsp:include>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cart/order.css" />
<main>
	<section>
		<article>
			<form action="${pageContext.request.contextPath}/cart/pay.do"
				method="POST" name="memberPayFrm">

				<div class="order-product-header">주문내역 및 배송지 정보</div>
				<div class="order-product-view">
					<table class="order-product">
						<thead>
							<tr>
								<th>이미지</th>
								<th>상품정보</th>
								<th>가격</th>
								<th>수량</th>
								<th>배송구분</th>
								<th>합계</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${order}" var="cart">
								<tr class="productInfo">
									<td id="productImg">
										<div id="product-img-wrap"><img
									src="${pageContext.request.contextPath}/resources/upload/product/${cart.product.attachments[0].renamedFilename}"
									alt="상품메인이미지" class="product-view__thumb-img" /></div>
									</td>
									<td id="productInfo">
										<div class="productName" class="strong">${cart.product.pname}</div>
										<input type="hidden" name="productCode"
										value="${cart.product.pcode}" /> 
										<input type="hidden"
										name="cartNo" value="${cart.cartNo}" />
										
									</td>
									<td><span><span><fmt:formatNumber
													value="${cart.product.price}" type="number" /></span>원</span></td>
									<td><span>${cart.amount}</span> <input type="hidden"
										name="cartAmount" value="${cart.amount}" /></td>
									<td><span>일반/택배배송</span></td>
									<td><span><span id="productPrice"><fmt:formatNumber
													value="${cart.product.price*cart.amount}" type="number" /></span>원</span></td>
								</tr>
							</c:forEach>
						</tbody>
						

						<tfoot>
							<tr>
								<td colspan="6" id="orderProductPrice">상품구매금액 <span
									id="productTotalPrice"></span>원 + 배송비 3,000 = 합계 : <span
									id="totalPrice" class="strong"></span>원
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div class="delivery-info-header">배송지 정보</div>
				<div class="delivery-info-wrap">
					<table class="delivery-product">
						<tbody>
							<tr>
								<th>주문자</th>
								<td><input name="memberName" type="text" class="input"
									value="${order[0].member.name}" />
								<input type="hidden" name="memberId"
										value="${order[0].member.memberId}" /> 	
								</td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td><input type="text" name="phone" id="phone"
									maxlength="11" class="input" value="${order[0].member.phone}" />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button type="button" class="address_btn address_btn_1"
							onclick="showAdress('1')" style="background-color: #3c3838;">기존 배송지</button>
						<button type="button" class="address_btn address_btn_2"
							onclick="showAdress('2')">신규 배송지</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1"
							style="display: block">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>${order[0].member.name}</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>${order[0].member.postCode}
											${order[0].member.address}<br>${order[0].member.detailAddress}
											<input class="selectAddress" value="T" type="hidden">
											<input class="addressee_input"
											value="${cartlist.member.name}" type="hidden"> <input
											class="address1_input" type="hidden"
											value="${order[0].member.postCode}"> <input
											class="address2_input" type="hidden"
											value="${order[0].member.address}"> <input
											class="address3_input" type="hidden"
											value="${order[0].member.detailAddress}">
										</td>
									</tr>
									<tr>
										<th>요청사항</th>
										<td><input class="memo"></td>
									<tr>
								</tbody>
							</table>
						</div>
						<div class="addressInfo_input_div addressInfo_input_div_2">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td><input name="recipient" id="recipient"
											class="addressee_input" ></td>
									</tr>
									<tr>
										<th>주소</th>
										<td><input class="selectAddress" value="F" type="hidden">
											<input name="postcode" class="address1_input"
											readonly="readonly" > <a
											class="address_search_btn" onclick="execution_daum_address()">주소
												찾기</a><br> <input name="address" class="address2_input"
											readonly="readonly" ><br> <input
											name="detailAddress" class="address3_input" >
										</td>
									</tr>
									<tr>
										<th>요청사항</th>
										<td><input name="memo" class="memo"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="fee-info-header">결제 예정 금액</div>
					<div class="fee-info-wrap">
						<table class="total">
							<thead>
								<tr>
									<th>총 주문 금액</th>
									<th>총 결제예정 금액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><span class="display"><span id="orderPrice"></span>원</span></td>
									<td><span class="display"><span id="total"
											class="strong"></span>원
									</span></td>
								</tr>
							</tbody>
						</table>
						<div class="payment-info-header">Payment info</div>
						<div class="total-wrap">
							<div>
								<div class="paymentSelect">
									<div class="cash-wrap">
										<input type="radio" name="payment" id="cash" checked /> <label
											for="cast">무통장입금</label>
									</div>
									<div class="card-wrap">
										<input type="radio" name="payment" id="card" /> <label
											for="card">카드결제</label>
									</div>
								</div>
								<div class="payment-info-wrap">
									<table id="cash-info" class="info">
										<tbody>
											<tr>
												<th>입금자명</th>
												<td><input type="text" name="paymentName" class="bank"
													value="${order[0].member.name}" readonly /></td>
											</tr>
											<tr>
												<th>입금은행</th>
												<td><input type="text" name="bank" class="bank"
													value="대한은행:111111-01-111111" readonly /></td>
											</tr>
										</tbody>
									</table>
									<div id="card-info" class="info">
										<p>환불은 환불 받으신 날짜 기준으로 3~5일(주말 제외) 후 <br/>
										결제대행사에서 직접 고객님의 계좌로 환불 처리됩니다</p>
									</div>
								</div>
							</div>
							<div class="final-wrap">
								<span class="final-wrap-header">결제안내</span>
								<p>고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다.<br/>
								확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 <br/>
								아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.  </p>
								
								<!--  <div class="flex">
									<div id="total" class="strong"></div>
									원
								</div>-->
								<input type="hidden" name="finalPayment" /> <input
									type="hidden" name="finalPrice" />
									
								<button id="orderBtn" type="button">결제하기</button>
							</div>
						</div>
					</div>
				</div>

			</form>
		</article>
	</section>
</main>
<script>
document.cookie = "safeCookie1=foo; SameSite=Lax"; 
document.cookie = "safeCookie2=foo";  
document.cookie = "crossCookie=bar; SameSite=None; Secure";

const headers = {};
headers['${_csrf.headerName}'] = '${_csrf.token}';
window.addEventListener('load', (e) => {
	const productPrice = document.querySelectorAll("#productPrice");
	const productTotalPrice = document.querySelector("#productTotalPrice");
	const totalPrice= document.querySelector("#totalPrice");
	const price = [...productPrice].map((span) => Number(span.innerHTML.replace(",",""))).reduce((total, price) => total + price);
	
	productTotalPrice.innerHTML = price.toLocaleString('ko-KR');
	totalPrice.innerHTML = (price + 3000).toLocaleString('ko-KR');
	
	const orderPrice = document.querySelector("#orderPrice");
	const total = document.querySelectorAll("#total");
	
	orderPrice.innerHTML = totalPrice.innerHTML;
	[...total].forEach((div) => div.innerHTML = totalPrice.innerHTML);
});
document.querySelectorAll("[name=payment]").forEach((payment) => {
	payment.addEventListener('change', (e) => {
		const cashInfo = document.querySelector("#cash-info");
		const cardInfo = document.querySelector("#card-info");
		const finalPayment = document.querySelector("[name=finalPayment]");
		
		if(e.target.id == 'cash') {
			cashInfo.style.display = 'block';
			cardInfo.style.display = 'none';
			finalPayment.value = 'CC';
			return;
		} else {
			cardInfo.style.display = 'block';
			cashInfo.style.display = 'none';
			finalPayment.value = 'CA';
			return;
		}
	});
});
function showAdress(className){
	/* 컨텐츠 동작 */
		/* 모두 숨기기 */
		$(".addressInfo_input_div").css('display', 'none');
		/* 컨텐츠 보이기 */
		$(".addressInfo_input_div_" + className).css('display', 'block');		
	
	/* 버튼 색상 변경 */
		/* 모든 색상 동일 */
			$(".address_btn").css('backgroundColor', '#555');
		/* 지정 색상 변경 */
			$(".address_btn_"+className).css('backgroundColor', '#3c3838');	
	/* selectAddress T/F */
		/* 모든 selectAddress F만들기 */
			$(".addressInfo_input_div").each(function(i, obj){
				$(obj).find(".selectAddress").val("F");
			});
		/* 선택한 selectAdress T만들기 */
			$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");		
		
}
/* 다음 주소 연동 */
function execution_daum_address(){
 		console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();	 
	            
	            
	        }
	    }).open();  	
	
}
document.querySelector("#orderBtn").addEventListener('click', (e) => {
	e.preventDefault(); // 제출방지
	const frm = document.memberPayFrm;
	
	const finalPayment = document.querySelector("[name=finalPayment]");
	const memo = document.querySelector("[name=memo]").value;
	const recipient = document.querySelector("[name=recipient]").value;
	const phone = document.querySelector("[name=phone]").value;
	const memberName = document.querySelector("[name=memberName]").value;
	const postcode = document.querySelector("[name=postcode]").value;
	const address = document.querySelector("[name=address]").value;
	const detailAddress = document.querySelector("[name=detailAddress]").value;
	const finalPrice = document.querySelector("[name=finalPrice]").value;
	const payment = document.querySelectorAll("[name=payment]");
	const total = document.querySelector("#total");
	const merchantRandom = Math.floor(Math.random() * 100000) + 1;
	const memberId = document.querySelector("[name=memberId]").value;
	
	const products = [...document.querySelectorAll(".productInfo")].map((tr) => {
	    const pcode = tr.querySelector("[name=productCode]").value;
	    const cartNo = tr.querySelector("[name=cartNo]").value;
	    const amount = tr.querySelector("[name=cartAmount]").value;
	    console.log(pcode, cartNo, amount);
	    return {
	    	cartNo, pcode, amount
	    };
	});
	console.log(products);
	
	console.log(memberName);
	console.log(memo);
	console.log(phone);
	console.log(postcode);
	console.log(memberName);
	console.log(address);
	console.log(finalPrice);
	console.log(merchantRandom);
	
	
	
	let productList = [];
	
	[...payment].forEach((pay) => {
		if(pay.checked == true) {
			finalPayment.value = pay.id;
			return;
		}
	});
	
	function getFormatDate(a){
	    var year = a.getFullYear();              //yyyy
	    var month = (1 + a.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = a.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}
	
		if(finalPayment.value == 'cash') {
			alert("주문이 완료되었습니다.");
			frm.submit();
		} else {
		   var IMP = window.IMP;      
		   IMP.init("imp00443347");
		   IMP.request_pay({
			   pg: 'html5_inicis.INIpayTest',
               pay_method: 'card',
               merchant_uid: merchantRandom,
               name: 'DRUGSTORE',
               amount: Number(total.innerHTML.replace(",","")),
               buyer_email: 'bod369369@naver.com',
               buyer_name: memberName,
               buyer_tel: phone,
               buyer_addr: address,
               buyer_postcode: postcode,
               m_redirect_url: 'http://localhost:9090/drugstore/'
		   }, function (rsp) {
			   console.log('rsp = ', rsp);
		      if (rsp.success) {
		         var msg = '결제가 완료되었습니다.';
		         msg += '결제 금액 : ' + rsp.paid_amount;
		         msg += '카드 승인번호 : ' + rsp.apply_num;
		         msg += '고유ID : ' + rsp.imp_uid;
		         msg += ' 상점 거래ID :' + rsp.apply_num;
		         
				const merchantUid = Number(rsp.merchant_uid); // 주문번호
				//const memberId = rsp.buyer_name; // 주문자 이름
				const impUid = rsp.imp_uid; //결제번호
				const receiptId = rsp.pg_tid; //pg사 거래고유번호
				const method = rsp.pay_method; //결제수단
				const name = rsp.name; //주문명
				const d = new Date(rsp.paid_at*1000); // unix 날짜 변환
				console.log(d);
			//	const formatted = `\${d.getFullYear()}-\${d.getMonth() + 1}-\${d.getDate()}`;
			//	console.log(formatted); //-1-  ???
				const paidAt = 
					getFormatDate(d); // 결제 완료일
				const totalPrice = rsp.paid_amount; //총금액
				const postCode = rsp.buyer_postcode; //우편번호
				const address = rsp.buyer_addr; //주소
				console.log(merchantUid);
				console.log(impUid);
				console.log(receiptId);
				console.log(name);
				console.log(totalPrice);
				console.log(postCode);
				
				const 
				//cartOrder = {
				//		merchantUid,memberId, impUid, receiptId, method, name, paidAt,totalPrice,postCode, address, detailAddress, recipient, cartNo, pcode	
				//};
				
				cartOrder = {
						merchantUid,memberId, impUid, receiptId, method, name, paidAt,totalPrice,postCode, address, detailAddress, recipient, 
						products
				};
				
				console.log(cartOrder);
				console.log(JSON.stringify(cartOrder));
				
				$.ajax({
					url : "${pageContext.request.contextPath}/cart/insertOrder.do",
					method : "POST",
					headers,
					data : JSON.stringify(cartOrder),
					contentType : 'application/json; charset=utf-8',
					success(response, textStatus, jqxhr){
						console.log(response, textStatus, jqxhr);
						location.href = "${pageContext.request.contextPath}/member/memberOrder.do";
						// 응답헤더에 Location확인
						console.log(cartOrder);
					},
					error : console.log
				});
		      } else {
		         var msg = '결제에 실패하였습니다.';
		      }
		      alert(msg);
		   });
		}
	
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>