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
    <link rel="stylesheet" href="../css/mainForm.css">

    <title>hotel</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {

            // 로그인 누르면 로그인 페이지로 넘어가는 로직
            $("#login").on('click', function () {

                location.href = "LoginMain.jsp";

            });

            // 관리자용 누르면 관리자 로그인 페이지로 넘어가는 로직
            $("#login1").on('click', function () {

                location.href = "LoginMain02.jsp";

            });


        });
    </script>

</head>

<body>
    <!-- BEM(CSS 작명규칙) :
__ : ~의 일부분
-- : ~의 상태
- : 일반적인 작명 
-->
    <%
    String ad_id = null;
	if (session.getAttribute("ad_id") != null) {
		ad_id = (String) session.getAttribute("ad_id");
	}

	%>
    <div class="body__container">

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
                        <a class="btn sign-in" id="login">로그인</a>
                        <a class="btn sign-in1" id="login1">관리자용</a>
                    </div>

                    <form id="search-form" method="post" action="">
                        <input id="search" class="input--text" type="text" placeholder="지역,숙소명">
                        <input type="submit">
                    </form>

                    <ul class="navi">
                        <li><a href="hotelReview_admin.jsp">예약내역</a></li>
                        <li><a href="#">더보기</a>
                            <ul>
                                <li><a href="notice.jsp">공지사항</a></li>
                                <li><a href="question.jsp">자주묻는질문</a></li>
                                <li><a href="inquiry.jsp">1:1문의사항</a></li>
                            </ul>
                        </li>
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
                        <li><a href="hotelReview_admin.jsp">예약내역</a></li>
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
        </header>
        <p class="content_inner"><a href="hotelListForm.jsp">
		<img src="../img/hotelbg.jpg" alt="메인" /></a></p>
		<div class="summary">
        	<h2 class="summary__title">Welcome, tourist</h2>
        	<p class="summary__description"><a href="hotelListForm.jsp">List view~</a></p>
		</div>
        </div>
</body>

</html>