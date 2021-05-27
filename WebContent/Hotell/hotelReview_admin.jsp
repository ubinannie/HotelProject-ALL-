<%@page import="review.ReplyReviewVO"%>
<%@page import="review.ReplyReviewDAO"%>
<%@page import="review.ReviewVO"%>
<%@page import="review.ReviewDAO"%>
<%-- <%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%> --%>
<%@page import="sun.security.krb5.internal.ReplayCache"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//out.println("관리자 페이지");
	//id값 받아오기
	String ad_id = null;
if (session.getAttribute("ad_id") != null) {
	ad_id = (String) session.getAttribute("ad_id");
}

	// 페이징 처리
	// 현재 페이지(currentPage) 얻어오기
	String cp = request.getParameter("cp");

	int currentPage = 0;

	if (cp != null) {
		currentPage = Integer.parseInt(cp);
	} else {
		currentPage = 1;
	}

	//리뷰  table
	ReviewDAO dao = new ReviewDAO();
	ReviewVO vo = new ReviewVO();

	//댓글 table
	ReplyReviewDAO rpdao = new ReplyReviewDAO();
	ReplyReviewVO rpvo = new ReplyReviewVO();

	//호텔 table
	/* ProductDAO pddao = new ProductDAO();
	ProductVO pdvo = new ProductVO(); */

	// 총 게시글 수
	int totalCount = dao.getTotalCount();

	//한 페이지당 레코드 수 : 5
	int recordByPage = 5;

	//총 페이지 수
	int totalPage = (totalCount % recordByPage == 0)
			? totalCount / recordByPage
			: totalCount / recordByPage + 1;

	//현재페이지 - 레코드 시작 번호
	int startNo = (currentPage - 1) * recordByPage + 1;

	//현재페이지 - 레코드 끝 번호
	int endNo = currentPage * recordByPage;

	/* out.println("<h2> 총 게시물 수: "+totalCount+"</h2>");
	out.println("<h2> 한 페이지당 게시물 수: "+recordByPage+"</h2>");
	out.println("<h2> 총 페이지 수: "+totalPage+"</h2>");
	out.println("<h2> 현재 페이지 번호: "+currentPage+"</h2>");
	out.println("<h2> 현재 페이지 시작번호: "+startNo+"</h2>");
	out.println("<h2> 현재 페이지 끝번호: "+endNo+"</h2>"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="hotel">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1, minimum-scale=1">
<!-- css 적용 : reset.css는 먼저 초기화하여야하기때문에 먼저 호출 -->
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/review.css">
<link rel="stylesheet" href="../css/writereview.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		});
		
		$(".delConfirm").on('click', function() {
			//console.log('click');

			var flag = confirm("정말 삭제하겠습니까?");

			if (flag) {
				//console.log('삭제 수행');
				//alert("테스트: "+$(this).attr("value"));
				var no = $(this).attr("value");
				location.href = "delete_review_adminOk.jsp?r_no=" + no;
			}
		});
		
		$(".delReply").on('click', function() {
			var reflag = confirm("정말 삭제하겠습니까?");

			if (reflag) {
				var reno = $(this).attr("value");
				location.href = "delete_replyOk.jsp?rp_no=" + reno;
			} 
		});

	});
</script>
<title>hotel</title>
</head>
<body>
	<div class="body_container">
		<!--HEADER-->
		<header class="section">
			<div class="inner clearfix">

				<div class="menu-group float--left">
					<div class="logo">
						<a href="index.jsp">놀러와</a>
					</div>
				</div>
				<%
					//로그인 안된경우
					if(ad_id == null) {
				%>
				<div class="sign-group float--right toggle">
					<div class="btn-group">
						<a class="btn sign-in" href="LoginMain02.jsp">로그인</a>
					</div>

					<form id="search-form" method="post" action="">
						<input id="search" class="input--text" type="text"
							placeholder="지역,숙소명"> <input type="submit">
					</form>

					<ul class="navi">
						<li><a href="hotelReview_user.jsp">예약내역</a></li>
						<li><a href="#">더보기</a>
							<ul>
								<li><a href="notice.jsp">공지사항</a></li>
								<li><a href="question.jsp">자주묻는질문</a></li>
								<li><a href="inquiry.jsp">1:1문의사항</a></li>
							</ul></li>
					</ul>
				</div>
				<%
					//로그인 된경우
					} else {
				%>
				<div class="sign-group float--right toggle">
                    
                    <form id="search-form" method="post" action="">
                        <input id="search" class="input--text" type="text" placeholder="지역,숙소명">
                        <input type="submit">
                    </form>
                   
                    <ul class="navi">
                        <li><a href="hotelReview_user.jsp">예약내역</a></li>
                        <li><a href="#">더보기</a>
                            <ul>
                                <li><a href="notice.jsp">공지사항</a></li>
                                <li><a href="question.jsp">자주묻는질문</a></li>
                                <li><a href="inquiry.jsp">1:1문의사항</a></li>
                            </ul>
                        </li>
                        <li><a id="login"><%=ad_id%>님 마이페이지</a>
                        	<ul>
                                <li><a href="#"><%=ad_id%>님</a></li>
                                <li><a href="myPage02.jsp">내정보관리</a></li>
                                <li><a href="#">예약내역</a></li>
                                <li><a href="logout02.jsp">로그아웃</a></li>
                            </ul>
                        </li>
                    </ul>
                
                </div>
                <%
					}
				%>
			</div>
			</div>
		</header>
	</div>
	<div>
		<%-- <img src="<%=pdvo.getImgFile()%>" alt="<%=pdvo.getPname()%>" /> --%>
	</div>

	<br />
	<br />
	<br />


	<div class="container">
		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1">객실안내/예약</li>
			<li class="tab-link" data-tab="tab-2">숙소정보</li>
			<li class="tab-link" data-tab="tab-3">리뷰</li>
		</ul>

		<div id="tab-1" class="tab-content current">
			<h1>webtoon section</h1>
			<ol>
				<li>새우를 품은 빵, 멘보샤 만드는 법</li>
				<li>지금까지 이런 피자는 없었다! 베이글 피자</li>
				<li>반짝반짝 빛나는 크리스털 마카롱 푸드 아트</li>
			</ol>
		</div>
		<div id="tab-2" class="tab-content">
			<h1>car section</h1>
			<ol>
				<li>국토부 리콜정보 연동. 차량번호로 내차리콜 바로 확인 !</li>
				<li>BMW, 전기차 ‘i4’ 티저 영상 공개..특징은?</li>
				<li>‘트랙 몬스터’ 닛산 GT-R, 오프로더 고질라로 재탄성</li>
			</ol>
		</div>
		<div id="tab-3" class="tab-content">
			<div class="write_review"></div>
			<ul>
				<li>
					<div class="guest">
						<%
							ArrayList<ReviewVO> list = dao.getAllData(startNo, endNo);

							for (ReviewVO rvo : list) {
						%>
						<div class="memberId"><%=rvo.getMb_id()%></div>
						<div class="guestcontents">
							<div class="title"><%=rvo.getR_title()%></div>
							<div class="txt"><%=rvo.getR_contents()%></div>
							<%
							//이미지 출력(null 일 때 오류)
								if (rvo.getFilepath() != null) {
						%>
							<div class="img">
								<img src="<%=rvo.getFilepath()%>" alt="" />
							</div>
							<%
							}
						%>
							<div class="date"><%=rvo.getR_regdate()%></div>
						</div>
						<div class="deletebtn">
						<button class="delConfirm" value="<%=rvo.getR_no()%>">삭제</button>
						</div>
						<div class="reply">
							<form action="reply_reviewOk.jsp">
								<!-- 답글 작성 -->
								<div class="replywirte">
									<input type="text" name="retxt" size="30" /> 
									<input type="hidden" name="r_no" value="<%=rvo.getR_no()%>" /> 
									<input type="submit" value="작성" />
								</div>
							</form>
							<!-- 답글 출력 -->
							<%
									ArrayList<ReplyReviewVO> rplist = rpdao.getAllReply();

										for (ReplyReviewVO revo : rplist) {
											if (rvo.getR_no() == revo.getRef()) {
								%>
							<div class="replyView">
							<div class="adminId"><%=revo.getAd_id()%></div>
								<textarea name="" id="replyView" cols="100" rows="5" disabled="disabled"><%=revo.getRp_contents()%></textarea>

							<button class="delReply" value="<%=revo.getRp_no()%>">삭제</button>
							</div>
							<%
											} //if end
										} //for end
							}
						%>
						</div>
					</div>
				</li>
			</ul>
			<div class="paging">
				<%
					for (int i = currentPage - 3; i < currentPage + 3; i++) {
						if (i <= 0) {
							continue;
						} else if (i > totalPage) {
							break;
						} else {
				%>
				<a href="hotelReview.jsp?cp=<%=i%>"><span id="page"><%=i%></span></a>
				<%
					} // if end
					} // for end
				%>
			</div>
		</div>
	</div>
</body>
</html>