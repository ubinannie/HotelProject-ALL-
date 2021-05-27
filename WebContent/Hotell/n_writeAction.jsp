<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="notice.noticeDAO"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
%>
<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용 -->
<jsp:useBean id="notice" class="notice.noticeVO" scope="page" />
<jsp:setProperty name="notice" property="title" />
<jsp:setProperty name="notice" property="content" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
	System.out.println(notice);
%>
	<%
		String ad_id = null;
	if(session.getAttribute("ad_id") != null){//유저 아이디 이름으로 세션이 존재하는 회원들은
		ad_id = (String)session.getAttribute("ad_id");//유저아이디에 해당 세션값을 넣어준다.
	}
	if(ad_id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'LoginMain02.jsp'");
		script.println("</script>");
	}else{
		if(notice.getTitle() == null || notice.getContent() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			noticeDAO noticeDAO = new noticeDAO();
			int result = noticeDAO.write(ad_id, notice.getTitle(), notice.getContent());
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다')");
                script.println("history.back()");
                script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='notice.jsp'");
				script.println("</script>");
			}
		}
	}
	%>