<%@page import="reservation.ReservationVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="hotel">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
        content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1, minimum-scale=1">
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/reservation.css">
<title>예약하기</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		$('#start_date').datepicker({
			changeMonth: true, 
            changeYear: true,
            showMonthAfterYear: true,
            dateFormat: "yy-mm-dd",
            nextText: '다음 달',
            prevText: '이전 달', 
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            minDate: 0,                       
            onClose: function(selectedDate) {    
                $("#endDate").datepicker( "option", "minDate", selectedDate );
            }
		});
		
		$("#end_date").datepicker({
            changeMonth: true, 
            changeYear: true,
            dateFormat: "yy-mm-dd",
            showMonthAfterYear: true,
            nextText: '다음 달',
            prevText: '이전 달', 
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            minDate: 0,                       
            onClose: function( selectedDate ) {    
                $("#startDate").datepicker( "option", "maxDate", selectedDate );
            }
		});
		
		$('#reser').on('click', rs_Click);
		
	});
	
	function rs_Click(){
		document.required_frm.action = 'reservationOk.jsp';	// 결제창으로 이동
		document.required_frm.method = 'get';			// post 방식으로 바꿀것
		document.required_frm.submit();
	}
	<%
		String id = null;
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}
	%>
</script>
<style type="text/css">
.hotel_Info_frm .hotel_Info .required_group .Info p {
	height: 70px;
}
.hotel_Info_frm .hotel_Info .required_group .Info  p strong{
	display: block;
	margin-bottom: 10px;
	color: #BDBDBD;
}
.hotel_Info_frm .hotel_Info .required_group .Info p #re_info{
	margin-top: 5px;
}
.hotel_Info_frm .hotel_Info .required_group .res_pri p{
	height: 70px;
}
.hotel_Info_frm .hotel_Info .required_group .res_pri  p strong{
	display: block;
	margin-bottom: 10px;
	color: #BDBDBD;
}
</style>
</head>
<body>
	<div class="body__container">
        <header class="section">
            <div class="inner clearfix">
                <div class="menu-group float--left">
                    <div class="logo">
                        <a href="MainLogin.jsp">여기어때</a>
                    </div>
                </div>
                <div class="sign-group float--right toggle">
                    <form id="search-form" method="post" action="">
                        <input id="search" class="input--text" type="text" placeholder="지역,숙소명">
                        <input type="submit">
                    </form>
                    <ul class="navi">
                        <li><a href="reservationList.jsp">예약내역</a></li>
                        <li><a href="#">더보기</a>
                            <ul>
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">자주묻는질문</a></li>
                                <li><a href="#">1:1문의사항</a></li>
                            </ul>
                        </li>
                        <li><a id="login"><%=id%>님 마이페이지</a>
                        	<ul>
                                <li><a href="#"><%=id%> 님</a></li>
                                <li><a href="#">내정보관리</a></li>
                                <li><a href="reservationList.jsp">예약내역</a></li>
                                <li><a href="logout.jsp">로그아웃</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="view">예약자 정보</div>
        </header>
        <%
        	/* 비로그인시 로그인 페이지로 */
			id =(String)session.getAttribute("id");
			if(id == null || id.equals("")) {
				response.sendRedirect("LoginMain.jsp");
			}else {
		%>
		<div id="required_wrap">
			<div class="reser_list">예약자 정보	</div>
			<form action="#" class="required_frm" name="required_frm" > <!-- method 바꾸기 -->
				<div class="required_group">
					<label for="name">예약자명</label><br />
					<input type="text" name="rs_name" id="rs_name" required="required" placeholder="체크인시 필요합니다."/>
				</div>
					<div class="required_group">
					<label>체크인</label> <br />
					<input type="text" name="rs_st_data" id="start_date" required="required"/>
				</div>
				<div class="required_group">
					<label>체크아웃</label> <br />
					<input type="text" name="rs_en_data" id="end_date" required="required"/>
				</div>
					<div class="required_group">
					<label>연락처</label> <br />
					<input type="text" name="rs_tel" id="rs_tel" placeholder="체크인시 필요합니다." required="required"/>
				</div>
					<div class="required_group">
					<label>특이사항</label> <br /><br />
					<textarea rows="10" cols="40" name="rs_text" placeholder="간략히 부탁드립니다." required="required"></textarea>
				</div>
			</form>
			<form action="#" class="hotel_Info_frm" name="hotel_Info_frm">
				<div class="hotel_Info">
					<div class="required_group">
						<%
							/* 호텔 정보를 가져오는 스트립틀릿 */
							/* 호텔 리스트 폼에서 h_no 가져와야함 */
							ReservationDAO dao = new ReservationDAO();
							ArrayList<ReservationVO> list = dao.getJoinData(177);
							for(ReservationVO vo : list) {
								
						%>
						<section class="Info">
							<!-- 호텔 테이블로 부터 정보를 받아와야함 -->
							<p>
								<strong>숙소이름</strong>
								<span class="re_info"><%=vo.getH_name() %></span>
							</p>
							<p>
								<strong>방 유형</strong>
								<span class="re_info"><%=vo.getType() %></span>
								<br />
							</p>
						</section>
						<section class="res_pri">
							<p>
								<strong>결제금액</strong>
								<span class="price"> <%=vo.getHr_price() %>원 </span>							
							</p>
						</section>
						<%
							}
						%>
					</div>
					<input type="button" value="결제하기" id="reser" onclick="rs_Click()"/>
				</div>
			</form>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>