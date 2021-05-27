<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@page import="java.util.ArrayList"%>
<%@page import="inquiry.inquiryVO"%>
<%@page import="inquiry.inquiryDAO"%>
<%@page import="notice.noticeDAO"%>
<%@page import="notice.noticeVO"%>
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
		String mb_id = null;
		if (session.getAttribute("mb_id") != null) {
			mb_id = (String) session.getAttribute("mb_id");
		}
		String ad_id = null;
		if (session.getAttribute("ad_id") != null) {
			ad_id = (String) session.getAttribute("ad_id");
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
    <link rel="stylesheet" href="../css/inquiry.css">
<title>hotel</title>
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
                        <a href="main.html">여기어때</a>
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
                        <li><a href="reservationList.jsp">예약내역</a></li>
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
        <div class="container">
            <div class="leftsidebar">
                <ul>
                    <li><a href="notice.jsp">공지사항</a></li>
                    <li><a href="question.jsp">자주묻는질문</a></li>
                    <li><a href="inquiry.jsp">1:1문의사항</a></li>
                </ul>
            </div>
            <div class="notice">
                <ul>
                    <li><a href="inquiry.jsp" class="notice-inquiry">나의문의내역</a></li>
                    <li><a href="inquirywrite.jsp">새 문의 작성</a></li>
                </ul>
                <hr>
            </div>

           <div class="contents">
                <table>
                    <thead>
                        <tr>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    inquiryDAO dao = new inquiryDAO();
                    
                    	ArrayList<inquiryVO> list = dao.getAllData(startNo, endNo);
                    	
                    	for(inquiryVO vo : list){
                    			
                    %>
                        <tr>
                            <td><a href="i_view.jsp?n_no=<%=vo.getN_no()%>">
						<%=vo.getTitle()%></a></td>
                            <td><%=vo.getMb_id() %></td>
                            <td><%=vo.getRegdate() %></td>
                        </tr>
                    <%
                    	}
                    %>
                    	<tr>
                    		<td colspan="4" class="pagelist">
                    			<%
                    			for(int i = currentPage-3; i<currentPage+3; i++ ){
            						if(i<=0){
            							continue;
            						}else if(i>totalPage){
            							break;
            						}else{
                    			%>
                    				<a href="inquiry.jsp?cp=<%=i%>"><span class="page"><%=i %></span></a>
                    			<%
            							}// if end
                    				}// for end
                    			%>
                    		</td>
                    	
                    	</tr>
                    </tbody>
                </table>

            </div>
        </div>
</body>
</html>