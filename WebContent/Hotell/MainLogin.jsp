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
<link rel="stylesheet" href="../css/mainForm.css">
<title>hotel</title>
</head>
<body>
	<%
		String id = null;
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");

	%>
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
                        <input id="search" class="input--text" type="text" placeholder="Search">
                        <input type="submit">
                    </form>
                    <ul class="navi">
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
        </header>
		<p class="content_inner"><a href="hotelListForm.jsp">
		<img src="../img/hotelbg.jpg" alt="메인" /></a></p>
		<div class="summary">
        	<h2 class="summary__title">Welcome, tourist</h2>
        	<p class="summary__description"><a href="hotelListForm.jsp">List view~</a></p>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>