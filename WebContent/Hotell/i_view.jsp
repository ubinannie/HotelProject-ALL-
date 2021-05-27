<%@page import="java.util.ArrayList"%>
<%@page import="inquiry.commentDAO"%>
<%@page import="inquiry.commentVO"%>
<%@page import="inquiry.inquiryDAO"%>
<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="inquiry.inquiryVO"%>
<%@page import="notice.noticeDAO"%>
<%@page import="notice.noticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//로긴 한사람이면 mb_id라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String mb_id = null;
		if (session.getAttribute("mb_id") != null) {
			mb_id = (String) session.getAttribute("mb_id");
		}
		String ad_id = null;
		if (session.getAttribute("ad_id") != null) {
			ad_id = (String) session.getAttribute("ad_id");
		}
		int n_no = 0;
		if (request.getParameter("n_no") != null) {
			n_no = Integer.parseInt(request.getParameter("n_no"));
		}
		if (n_no == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'inquiry.jsp'");
			script.println("</script>");
		}
		//문의사항
		inquiryVO vo =  new inquiryDAO().getInuiry(n_no);
		
		String no = request.getParameter("n_no");
		//댓글
		commentVO cvo = new commentVO();
		commentDAO cdao = new commentDAO();
		
		n_no = Integer.parseInt(no);
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
    <link rel="stylesheet" href="../css/i_view.css">
<title>hotel</title>
<style>
.container .contents table tbody{
      box-sizing: border-box;
      height: 100%;
    
    
    
}
	#rw{
 display: block;
 font-size: 20px;
text-align: left;
 height: 20px;

 
}
.contents .reply tr{
  display: block;
  margin-left: 38%;
  
}


#rp{
   margin-top: 10px;
   
}
#rs{
  margin-top: 10px;
  margin: 0 auto;
}
	
.container .contents .option{
	margin-top: 5%;
  margin-left: 19%;
}
</style>
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
     		    <!-- 글보기 -->
            <div class="contents">
                <table>
                    <thead>
                        <tr>
                            <th colspan="3">글 보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="col1">제목</td>
                            <td class="col2"><%=vo.getTitle() %></td>
                        </tr>
                        <tr>
                            <td class="col1">작성자</td>
                            <td class="col2"><%=vo.getMb_id() %></td>
                        </tr>
                        <tr>
                            <td class="col1">작성일</td>
                            <td class="col2"><%=vo.getRegdate() %></td>
                        </tr>
                        <tr>
                            <td class="col1">내용</td>
                            <td class="col2"><%=vo.getContent() %></td>
                        </tr>
                    </tbody>
                </table>
             <div class="option">
			<a href="inquiry.jsp" class="notice-btn">목록</a>
			<%
				//사용자 본인일시 수정 삭제 가능
				if (mb_id != null && mb_id.equals(vo.getMb_id())) {
			%>
			<a href="i_delete.jsp?n_no=<%=n_no %>" class="notice-btn">삭제</a>
			<%
				}
			%>
			</div>
			
		 	  <form action="replyAction.jsp">
                <table class="reply">
                    <tr id="">
                        <th id="rw">답변</th>
                        <td>
                            <textarea name="content" id="rp" cols="80" rows="10" name="content"></textarea>
                            <%-- <input type="hidden" name="ad_id" value="<%=cvo.getAd_id() %>" />  --%>
                            <input type="hidden" name="n_no" value="<%=vo.getN_no() %>" />
                            <input type="submit" value="작성" class="notice-btn" />
                        </td>
                    </tr> 
            
				<%
				/* 댓글조회 */
	           ArrayList<commentVO> list = cdao.getAllReply();

					
					for(commentVO crvo : list){
						if(n_no==crvo.getRef()){
		
				%>
				 	<tr>
                        <td>
                            <textarea id="rs" rows="5" cols="80" name=""  id="" disabled="disabled"><%=crvo.getContent() %></textarea>
                        </td>
                    </tr>
			
				<%
						} // if end
					}// for end
				%>
					
			</table>
		
		</form>
		</div>
        </div>
</body>
</html>