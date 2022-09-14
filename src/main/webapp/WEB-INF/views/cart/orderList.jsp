<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="장바구니" name="title"/>
</jsp:include>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<main>
	<section>
		<article>
			<form action="<%= request.getContextPath()%>/member/pay" method="POST" name="memberPayFrm">
				<div class="title-wrap">
					<h2>ORDER</h2>
				</div>			
				<div class="order-product-header">주문내역 및 배송지 정보</div>
				<div class="order-product-view">
					<table class="order-product">
						<thead>
							<tr>
								<th>이미지</th>
								<th>상품정보</th>
								<th>가격</th>
								<th>수량</th>
								<th>배송비</th>
								<th>합계</th>
							</tr>
						</thead>
						<tbody>
						
								<tr>
									<td id="productImg">
										<div id="product-img-wrap">
								
										</div>
									</td>
									<td id="productInfo">
										<div class="productName" class="strong">${cartlist.product.pname}</div>
										<input type="hidden" name="productCode" value="${cartlist.product.pcode}" />
										<input type="hidden" name="cartNo" value="${cartlist.cartNo}"/>
									</td>
									<td><span><span><fmt:formatNumber value="${cartlist.product.price}" type="number"/></span>원</span></td>
									<td>
										<span>${cartlist.amount}</span>
										<input type="hidden" name="cartAmount" value="${cartlist.amount}" />
									</td>
									<td><span>[기본]</span></td>
									<td><span><span id="productPrice"><fmt:formatNumber value="${cartList.product.price*cartList.amount}" type="number"/></span>원</span></td>
								</tr>
						
						</tbody>
						<tfoot>
							<tr>
								<td>[기본배송]</td>
								<td colspan="6" id="orderProductPrice">상품구매금액 <span id="productTotalPrice"></span>원 + 배송비 2,500 = 합계 : <span id="totalPrice" class="strong"></span>원</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div class="delivery-info-header">배송정보</div>
				<div class="delivery-info-wrap">
				<table class="delivery-product">
						<tbody>
							<tr>
								<th>주문자</th>
								<td><input type="text" class="input" value="${cartlist.member.name}" /></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td>
									<input type="text" name="phone" id="phone" maxlength="11" class="input" value="${cartlist.member.phone}"/>
								</td>
							</tr>
						</tbody>
					</table>
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button class="address_btn address_btn_1" onclick="showAdress('1')" style="background-color: #3c3838;">기존 정보</button>
						<button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											${cartlist.member.name}
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											${cartlist.member.postCode} ${cartlist.member.address}<br>${cartlist.member.detailAddress}
											<input class="selectAddress" value="T" type="hidden">
											<input class="addressee_input" value="${cartlist.member.memberName}" type="hidden">
											<input class="address1_input" type="hidden" value="${cartlist.member.postCode}">
											<input class="address2_input" type="hidden" value="${cartlist.member.address}">
											<input class="address3_input" type="hidden" value="${cartlist.member.detailAddress}">																					
										</td>
									</tr>
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
										<td>
											<input class="addressee_input">
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											<input class="selectAddress" value="F" type="hidden">
											<input class="address1_input" readonly="readonly"> <a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br>
											<input class="address2_input" readonly="readonly"><br>
											<input class="address3_input" readonly="readonly">
										</td>
									</tr>
								</tbody>
							</table>
						</div>
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
									<td><span class="display">= <span id="total" class="strong"></span>원</span></td>
								</tr>
							</tbody>
						</table>						
						<div class="payment-info-header">결제수단</div>
						<div class="total-wrap">
							<div>
								<div class="paymentSelect">
									<div class="cash-wrap">
										<input type="radio" name="payment" id="cash" checked />
										<label for="cast">무통장입금</label>
									</div>
									<div class="card-wrap">
										<input type="radio" name="payment" id="card" />
										<label for="card">카드결제</label>
									</div>
								</div>
								<div class="payment-info-wrap">
									<table id="cash-info" class="info">
										<tbody>
											<tr>
												<th>입금자명</th>
											</tr>
											<tr>
												<th>입금은행</th>
											</tr>
										</tbody>
									</table>
									<div id="card-info" class="info">
										<p>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
									</div>
								</div>
							</div>
							<div class="final-wrap">
								<span class="final-wrap-header">최종결제금액</span>
								<div class="flex"><div id="total" class="strong"></div> 원</div>
								<input type="hidden" name="finalPayment" />
								<input type="hidden" name="finalMemberPoint" />
								<input type="hidden" name="finalMemberId" value="${cartlist.member.name}" />
								<input type="hidden" name="finalPrice" />
								<input type="hidden" name="finalUsePoint" />
								<input type="hidden" name="finalAddPoint" />
								<button id="orderBtn" type="button">결제</button>
							</div>
						</div>
					</div>					
				</div>
			</form>
		</article>
	</section>
</main>
<script>
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
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>