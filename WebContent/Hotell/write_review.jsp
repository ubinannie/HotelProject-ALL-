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
<!-- css 적용 : reset.css는 먼저 초기화하여야하기때문에 먼저 호출 -->
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/writereview.css">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		$("#sendMsg").on('click',function(){
			document.frm.action='write_reviewOk.jsp';
			document.frm.submit();
		});
	});
</script>
</head>
<body>
<%
String id = null;
if (session.getAttribute("id") != null) {
	id = (String) session.getAttribute("id");
}

	%>
	<div class="body_container">
		<!--HEADER-->
		<header class="section">
			<div class="inner clearfix">

				<div class="menu-group float--left">
					<div class="logo">
						<a href="index_user.jsp">여기어때</a>
					</div>
				</div>
		 <%
					//로그인 안된경우
					if(id == null) {
				%>
				<div class="sign-group float--right toggle">
					<div class="btn-group">
						<a class="btn-sign-in" href="LoginMain.jsp">로그인</a>
					</div>

					<form id="search-form" method="post" action="">
						<input id="search" class="input--text" type="text"
							placeholder="지역,숙소명"> <input type="submit">
					</form>

					<ul class="navi">
						<li><a href="hotelReview_user.jsp">예약내역</a></li>
						<li><a href="#">더보기</a>
							<ul>
								<li><a href="notice_user.jsp">공지사항</a></li>
								<li><a href="question_user.jsp">자주묻는질문</a></li>
								<li><a href="inquiry_user.jsp">1:1문의사항</a></li>
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
                                <li><a href="notice_user.jsp">공지사항</a></li>
                                <li><a href="question_user.jsp">자주묻는질문</a></li>
                                <li><a href="inquiry_user.jsp">1:1문의사항</a></li>
                            </ul>
                        </li>
                        <li><a id="login"><%=id%>님 마이페이지</a>
                        	<ul>
                                <li><a href="#"><%=id%>님</a></li>
                                <li><a href="myPage.jsp">내정보관리</a></li>
                                <li><a href="#">예약내역</a></li>
                                <li><a href="logout.jsp">로그아웃</a></li>
                            </ul>
                        </li>
                    </ul>
                
                </div>
                <%
					}
				%>
			</div>
		</header>
	</div>

	<br />
	<br />
	<br />

	<form action="write_reviewOk.jsp" name="frm" method="post"
		enctype="multipart/form-data">
		<div id="container">
			<div id="top">
				<h3>리뷰 작성</h3>
			</div>
			<!-- <div class="writer">
				<p>
					<input type="text" name="writer" id="writer" placeholder="작성자" />
				</p>
			</div> -->
			<div class="title">
				<p>
					<input type="text" name="title" id="title" placeholder="제목 작성" />
				</p>
			</div>
			<div class="contents">
				<p>
					<textarea name="contents" id="contents" rows="10" cols="100"></textarea>
				</p>
			</div>
			<div class="input-file">
				<input type="file" name="fileName" class="file-label" />
			</div>
			<div id="writebtn">
				<a href="hotelReview_user.jsp"><input type="button" value="목록보기" class="btn"/></a> <input
					type="button" value="작성하기" id="sendMsg" class="btn"/>
			</div>
		</div>
	</form>
</body>
</html>