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
<link rel="stylesheet" href="../css/reservationListAdmin.css">
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
</script>
<title>예약내역</title>
<style type="text/css">
table {
	border-collapse: collapse;
	border-spacing: 0;
	border: 1px solid gray;
	width: 90%;
	display: contents;
}
.contents .hotel_Info_frm #cencel_btn {
	margin-top: 1%;
	float: right;
}
.contents .hotel_Info_frm #cencel_btn input[type=button] {
	background-color: #FF0000;
	color: white;
	padding: 7px 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="body__container">
        <header class="section">
            <div class="inner clearfix">
                <div class="menu-group float--left">
                    <div class="logo">
                        <a href="main.html">여기어때</a>
                    </div>
                </div>
                <div class="sign-group float--right toggle">
                    <div class="btn-group">
                        <a class="btn sign-in" href="#">로그인</a>
                    </div>
                    <form id="search-form" method="post" action="">
                        <input id="search" class="input--text" type="text" placeholder="지역,숙소명">
                        <input type="submit">
                    </form>
                    <ul class="navi">
                   		<!-- 로그인이 된 상태에서만 들어가야함 아니면 로그인 화면으로 이동 -->
                        <li><a href="reservationAdmin.jsp">예약정보</a></li>	
                        <li><a href="#">더보기</a>
                            <ul>
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">자주묻는질문</a></li>
                                <li><a href="#">1:1문의사항</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="view">예약정보</div>
        </header>
		<div id="contents_nav">
			<div class="sub_nav">
				<ul>
					<li><a href="#">포인트</a></li>
					<li><a href="reservationAdmin.jsp" style="color: #ff0000;">예약 정보</a></li>
					<li><a href="myPage02.jsp"> 내 정보 </a></li>
				</ul>
			</div>
			<div class="reser_list">예약정보</div>
			<br />
			<hr />
			<br />
			<div class="contents">
				<form action="#" name="hotel_Info_frm" class="hotel_Info_frm">
					<div class="contents_info">
						<%
							// 세션에 값이 있을때 실행 아닐시 로그인창으로 이동해야함.
							String id =(String)session.getAttribute("ad_id");
							// id를 가지고 관리자 테이블에서 관라지 등급을 받아와서 실행
							//if(id == null || id.equals("")) {
							//	response.sendRedirect("login.jsp");
							//}else {
								ReservationDAO dao = new ReservationDAO();
								ArrayList<ReservationVO>rs_list = dao.getMemData("hong");
								String name = "";
								String tel = "";
								for(ReservationVO vo2 : rs_list) {
									name = vo2.getRs_name();
									tel = vo2.getMb_tel();
								ArrayList<ReservationVO>rs2_list = dao.getDataLogin(name, tel, "hong");
								
								// 예시로 값을 넣어서 알아봄. 멤버테이블에서 가져와서 조회할 수 있어야함.
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
								<table>
									<tr>
										<th>Check</th>
										<th>예약번호</th>
										<th>예약자명</th>
										<th>체크인 / 체크아웃</th>
										<th>진행상황</th>
										<th>가격</th>
										<th>연락처</th>
										<th>등록일자</th>
										<th>특이사항</th>
									</tr>
									<tr>
										<td><input type="checkbox" name="check" id="check" /></td>
										<td><%=vo.getRs_num() %></td>
										<td>이름</td>
										<td><span id="date"><%=vo.getRs_st_date() %> ~ <%=vo.getRs_en_date() %> <br /></span></td>
										<td><span id="st"><%= status %> <br /></span></td>
										<td>가격</td>
										<td>연락처</td>
										<td>등록일자</td>
										<td>text</td>
									</tr>
								</table>
							<%
									}
								}	
							//}
						%>
						<div id="cencel_btn">
							<!-- 삭제하기는 관리자가 로그인 했을때 나와야함 -->
							<input type="button" value="삭제하기" id="delete" />
							<!-- onclick="Cencel()" -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>