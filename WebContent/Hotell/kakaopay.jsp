<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String name = (String)request.getAttribute("name");
    String tel = (String)request.getAttribute("rs_tel");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakaopay.jsp</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<!-- 아임포트 라이브러리 추가 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<script>
	IMP.init('imp53756301'); 	//'iamport' 대신 부여받은 "가맹점 식별코드"를 사용합니다
        IMP.request_pay({			//결제를 요청합니다
            pg : 'kakaopay',		//하나의 아임포트 계정으로 여러 PG를 사용할 때 입력하는 구분자입니다
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '놀러와 호텔 예약',
            amount : '80000',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=tel%>',
          
            //call back 함수
        }, function(rsp) {
            	if ( rsp.success ) {
                    var msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
               	} else {
					var msg = '결제에 실패하였습니다.';
               		msg += '에러내용 : ' + rsp.error_msg;
               	}
                alert(msg);
        });
</script>
 
</body>
</html>
