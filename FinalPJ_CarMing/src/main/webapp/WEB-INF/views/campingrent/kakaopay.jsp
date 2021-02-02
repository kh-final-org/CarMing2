<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarMing</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
			$(function(){
							alert($("#totalPrice").val());
							IMP.init('imp83374605');
							IMP.request_pay({
							    pg : 'kakaopay',
							    pay_method : 'card',
							    merchant_uid : 'CarMing' + new Date().getTime(),
							    name : '주문명:',
							    amount : 12,
							    buyer_email : '2323',
							    buyer_name : '23123',
							    buyer_tel : '123123',
							    buyer_addr : '123123',
							    buyer_postcode : '123123'
							}, function(rsp) {
							    if ( rsp.success ) {
							    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
							    	jQuery.ajax({
							    		url: "payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
							    		type: 'POST',
							    		dataType: 'json',
							    		data: {
								    		imp_uid : rsp.imp_uid
								    		//기타 필요한 데이터가 있으면 추가 전달
							    		}
							    	}).done(function(data) {
							    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
							    		if ( everythings_fine ) {
							    			var msg = '결제가 완료되었습니다.';
							    			msg += '\n고유ID : ' + rsp.imp_uid;
							    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							    			msg += '\결제 금액 : ' + rsp.paid_amount;
							    			msg += '카드 승인번호 : ' + rsp.apply_num;

							    			alert(msg);
							    		} else {
							    			//[3] 아직 제대로 결제가 되지 않았습니다.
							    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
							    		}
							    	});
							    	
							    } else {
							        var msg = '결제에 실패하였습니다.';
							        msg += '에러내용 : ' + rsp.error_msg;
							        
							        alert(msg);
							        location.href = "payinfo.do";
							    }
							    
								$.ajax({
									url: "payresultform.do",
									type: "POST",
									data: {"amount": 14000},
									success: function(result){
										if(result==1){
											location.href="payresult.do";
										}
									},
									error: function(){
										location.href="payinfo.do";
									}
								});		
							});
			});
</script>
</head>
<body>
		<input type="hidden" class="totalPrice" value="${payDto.totalPrice }">
		<input type="hidden" class="addr" value="${payDto.addr }">
	
		<input type="hidden" class="email" value="${login.memid }">
		<input type="hidden" class="name" value="${login.memname }">
		<input type="hidden" class="phone" value="${login.memphone }">
		<input type="hidden" class="postcode" value="${login.memzip }">
		<input type="hidden" class="email" value="${login.memid }">
		<input type="hidden" class="name" value="${login.memname }">
		<input type="hidden" class="phone" value="${login.memphone }">
</body>
</html>