<%@page import="question.questionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="question.questionVO"%>
<%@ page import="java.io.PrintWriter"%>
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
    <link rel="stylesheet" href="../css/write.css">
<title>hotel</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	  	$('#content').summernote({
	  		width : 920,
	  		height : 200,
	  		placeholder : "글을 작성하여 주세요",
	  		
	  	});
	  	$("#send").on('click',function(){
	  		document.frm.action = "q_updateAction.jsp";
	  		document.frm.submit();
	  	})
	});
	
</script>
</head>
<body>
	<%
		String ad_id = null;
		if (session.getAttribute("ad_id") != null) {
			ad_id = (String) session.getAttribute("ad_id");
		}
		//로그인 안한경우
		if (ad_id == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하세요.')");
			script.println("location.href = 'LoginMain02.jsp'");
			script.println("</script>");
		}
		int n_no = 0;
		if (request.getParameter("n_no") != null) {
			n_no = Integer.parseInt(request.getParameter("n_no"));

		}
		if (n_no == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
		}
		questionVO vo = new questionDAO().getQuestion(n_no);
		if (!ad_id.equals(vo.getAd_id())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
		}
	%>
      <div class="body__container">
		
        <!--HEADER-->
        <header class="section">
            <div class="inner clearfix">

                <div class="menu-group float--left">
                    <div class="logo">
                        <a href="index.jsp">여기어때</a>
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
           <div class="view">더보기</div>
        
        </header>

        <!-- content -->
          <!-- content -->
          <div class="container">
            <div class="leftsidebar">
                <ul>
                    <li><a href="notice.jsp">공지사항</a></li>
                    <li><a href="question.jsp">자주묻는질문</a></li>
                    <li><a href="inquiry.jsp">1:1문의사항</a></li>
                </ul>
            </div>
         
        <div class="content">
            <div class="row">
                <form method="post" action="q_updateAction.jsp?n_no=<%=n_no %>">
                    <table class="tablewrite">
                        <thead>
                            <tr>
                                <th colspan="2">자주묻는 질문 수정</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="text" class="form-control" placeholder="글 제목" name="title"
                                        maxlength="100" id="title" value="<%=vo.getTitle()%>"></td>
                            </tr>
                         
                            <tr>
                                
                                <td><textarea type="text" class="form-control" placeholder="내용" name="content"
                                        maxlength="2048" cols="105" rows="25" id="content" ><%=vo.getContent() %>
                        </textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="submit" value="수정" class="notice-btn" id="send">
                </form>
            </div>
        </div>
    </div>
</body>
</html>