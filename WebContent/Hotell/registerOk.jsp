<%@page import="MiniHotel.Member_Vo"%>
<%@page import="MiniHotel.Member_Dao"%>
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
    
<title>registerOk.jsp</title>
</head>
<body>
<jsp:useBean id="minihotel" class="MiniHotel.Member_Vo" scope="page"/>
<jsp:setProperty property="*" name="minihotel"/>

	<%
String id = null;
if (session.getAttribute("id") != null) {
	id = (String) session.getAttribute("id");
}

	%>
	
	
	 <div class="body__container">

        <!--HEADER-->
        <header class="section">
            <div class="inner clearfix">

                <div class="menu-group float--left">
                    <div class="logo">
                        <a href="index_user.jsp">여기어때</a>
                    </div>
                </div>

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
                                <li><a href="#"><%=id%> 님</a></li>
                                <li><a href="myPage02.jsp">내정보관리</a></li>
                                <li><a href="#">예약내역</a></li>
                                <li><a href="logout.jsp">로그아웃</a></li>
                            </ul>
                        </li>
                    </ul>
                
                </div>
            </div>
        </header>
        
</body>
</html>








