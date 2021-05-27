<%@page import="inquiry.inquiryVO"%>
<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@page import="java.util.ArrayList"%>
<%@page import="inquiry.inquiryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	//페이지 처리
		String cp = request.getParameter("cp");
	
	int currentPage = 0;
	
	if(cp != null){
		currentPage = Integer.parseInt(cp);
	}else{
		currentPage = 1;
	}
	
	inquiryDAO bdao = new inquiryDAO();
	
	// 총 게시글 수 
	int totalCount = bdao.getTotalCount();
	
	// 한 페이지당 레코드 수 : 10
	int recordByPage = 10;
	
	// 총 페이지 수//삼항연산식
	int totalPage = 
		(totalCount%recordByPage==0)?totalCount/recordByPage:totalCount/recordByPage+1;
	

	// 현재페이지 - 레코드 시작 번호
	int startNo = (currentPage-1)*recordByPage+1;
	
	// 현제페이지 = 레코드 끝 번호
	int endNo = currentPage*recordByPage;

%>
<%
//로긴 한사람이면 ad_id라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
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
    <link rel="stylesheet" href="../css/inquirywrite.css">
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
	  		width : 750,
	  		height : 200,
	  		placeholder : "글을 작성하여 주세요",
	  		
	  	});
	  	$("#send").on('click',function(){
	  		document.frm.action = "n_writeAction.jsp";
	  		document.frm.submit();
	  	})
	});
	
</script>
</head>
<body>
    <!-- BEM(CSS 작명규칙) :
__ : ~의 일부분
-- : ~의 상태
- : 일반적인 작명 
-->
    <div class="body__container">
		
        <!--HEADER-->
        <header class="section">
            <div class="inner clearfix">

                <div class="menu-group float--left">
                    <div class="logo">
                        <a href="index_user.jsp">놀러와</a>
                    </div>
                </div>
				<%
					//로그인 안된경우
					if(id == null) {
				%>
                <div class="sign-group float--right toggle">
                    <div class="btn-group">
                        <a class="btn sign-in" href="LoginMain.jsp">로그인</a>
                    </div>
				
		
                 
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
           <div class="view">더보기</div>
        
        </header>
	
        <!-- content -->
        <div class="container">
            <div class="leftsidebar">
                <ul>
                    <li><a href="notice_user.jsp">공지사항</a></li>
                    <li><a href="question_user.jsp">자주묻는질문</a></li>
                    <li><a href="inquiry_user.jsp">1:1문의사항</a></li>
                </ul>
            </div>
            <div class="notice">
                <ul>
                    <li><a href="inquiry_user.jsp">나의문의내역</a></li>
                    <li><a href="inquirywrite_user.jsp" class="notice-inquiry">새 문의 작성</a></li>
                </ul>
                <hr>
            </div>
            <p>이용 중 불편하신 점을 문의주시면 최대한 빠른 시일내에 답변 드리겠습니다.</p>
            <form action="inquiryAction_user.jsp" method="post">
                <div class="contents">
                    <div class="form-group" >
                        <label>카테고리유형</label>
                        <select name="category" id="category" class="form-control">
                            <option value="카테고리유형을 선택하세요">카테고리유형을 선택하세요</option>
                            <option value="모텔">모텔</option>
                            <option value="호텔">호텔</option>
                            <option value="리조트">리조트</option>
                            <option value="펜션">펜션</option>
                            <option value="게스트하우스">게스트하우스</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>문의유형</label>
                        <select name="title" id="title" class="form-control">
                            <option value="문의유형을 선택하세요">문의유형을 선택하세요</option>
                            <option value="예약결제">예약/결제</option>
                            <option value="취소/환불">취소/환불</option>
                            <option value="이용문의">이용문의</option>
                            <option value="회원정보">회원정보</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>문의내용</label>
                        <textarea name="content" id="content" cols="92" rows="20" placeholder="문의하실내용을 입력하세요"></textarea>
                    </div>

                    <input type="submit" value="작성완료" class="inquiry-btn" id="send">


                </div>
            </form>
        </div>
</body>
</html>