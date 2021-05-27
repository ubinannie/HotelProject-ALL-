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
<link rel="stylesheet" href="../css/reservationList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#cencel').click(Cencel);
	 	function Cencel() {
	 		var ckbox = $("input[name='check']:checked");
	 		ckbox.each(function(i) {
	 			/* var tr = ckbox.parent().parent().eq(i);
	 			var td = tr.children();
	 			var rs_num = td.eq(1).text();
	 			console.log(rs_num); */
		 		document.hotel_Info_frm.action = 'reservationCencel.jsp';
				document.hotel_Info_frm.method = 'get';			// post 방식으로 바꿀것
				document.hotel_Info_frm.submit();
	 		});
	 	}
	 	$('#delete').click(Delete);
	 	function Delete(i) {
	 		var ckbox = $("input[name='check']:checked");
	 		ckbox.each(function() {
		 		document.hotel_Info_frm.action = 'reserInfodelete.jsp';
				document.hotel_Info_frm.method = 'get';			// post 방식으로 바꿀것
				document.hotel_Info_frm.submit();
	 		});
	 	}
	});
	<%
		String id = null;
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		}

	%>
</script>
<title>예약내역</title>
<style type="text/css">

</style>
</head>
<body>
	<div class="body__container">
        <header class="section">
            <div class="inner clearfix">
                <div class="menu-group float--left">
                    <div class="logo">
                        <a href="MainLogin.jsp">놀러와</a>
                    </div>
                </div>
                <div class="sign-group float--right toggle">
                    <form id="search-form" method="post" action="">
                        <input id="search" class="input--text" type="text" placeholder="지역,숙소명">
                        <input type="submit">
                    </form>
                    <ul class="navi">
                   		<!-- 로그인이 된 상태에서만 들어가야함 아니면 로그인 화면으로 이동 -->
                        <li><a href="reservationList.jsp">예약내역</a></li>	
                        <li><a href="#">더보기</a>
                            <ul>
                                <li><a href="notice_user.jsp">공지사항</a></li>
                                <li><a href="question_user.jsp">자주묻는질문</a></li>
                                <li><a href="inquiry_user.jsp">1:1문의사항</a></li>
                            </ul>
                        </li>
                        <li><a id="login"><%=id%>님 마이페이지</a>
                        	<ul>
                                <li><a href="#"><%=id%> 님</a></li>
                                <li><a href="myPage.jsp">내정보관리</a></li>
                                <li><a href="reservationList.jsp">예약내역</a></li>
                                <li><a href="logout.jsp">로그아웃</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="view">예약내역</div>
        </header>
		<div id="contents_nav">
			<div class="sub_nav">
				<ul>
					<li><a href="reservationList.jsp">예약 내역</a></li>
					<li><a href="myPage.jsp"> 내 정보 관리</a></li>
				</ul>
			</div>
			<div class="reser_list">예약내역</div>
			<br />
			<hr />
			<br />
			<div class="contents">
				<form action="#" name="hotel_Info_frm" class="hotel_Info_frm">
					<div class="contents_info">
						<%
							// 세션에 값이 있을때 실행 아닐시 로그인창으로 이동해야함.
							if(id == null || id.equals("")) {
								response.sendRedirect("LoginMain.jsp");
							}else {
								ReservationDAO dao = new ReservationDAO();
								ArrayList<ReservationVO>rs_list = dao.getMemData(id);
								String name = "";
								String tel = "";
								for(ReservationVO vo2 : rs_list) {
									name = vo2.getRs_name();
									tel = vo2.getRs_tel();
									
								ArrayList<ReservationVO>rs2_list = dao.getDataLogin(name, tel, id);
								if(rs2_list.size() == 0 ){
								%>
									<div class="list_none">예약내역이 없습니다.
										<p><a href="hotelListFormLogin.jsp"><input type="button" value="예약하러가기~" id="res_btn"/></a></p>
									</div>
								<%									
								}else {
									for(ReservationVO vo : rs2_list) {
										String st = vo.getRs_st();
										String status = "";
										
										if(st.equals("0")) {
											status = "결제 대기";
										}else if(st.equals("1")) {
											status = "결제 완료";
										}else if(st.equals("2")){
											status = "예약 취소";
										}else {
											status = "결제 대기";
										}
								%>
									<div id="Info">
										<input type="hidden" name="rs_no" value="<%=vo.getRs_num() %>" />
										<input type="checkbox" name="check" id="check" />
										<!-- 호텔테이블에서 이미지 가여화야함 -->
										<img src="../img/hotelMain.jpeg" alt="호텔" /><br /><br />
										<span id="st"><%= status %> <br /></span>
										<br />
										<!-- 취소 기능을 위해 rs_num값 필요 -->
										<span id="h_name">호텔이름<br /></span>
										<br />
										<span id="date"><%=vo.getRs_st_date() %> ~ <%=vo.getRs_en_date() %> <br /></span>
									</div>
							<%
										}
									}	
								}
							}
						%>
					</div>
					<div id="cencel_btn">
						<input type="button" value="예약취소" id="cencel" />
						<!-- 삭제하기는 관리자가 로그인 했을때 나와야함 -->
						<input type="button" value="삭제하기" id="delete" />
						<!-- onclick="Cencel()" -->
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>