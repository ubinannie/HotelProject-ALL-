<%@page import="question.questionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="question.questionVO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<%
	String ad_id = null;
	if (session.getAttribute("ad_id") != null) {//관리자아이디 이름으로 세션이 존재하는 회원들은
		ad_id = (String) session.getAttribute("ad_id");//관리자아이디에 해당 세션값을 넣어준다

	}
	if (ad_id == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 하세요.')");
		script.println("location.href = 'LoginMain02.jsp'");
		script.println("</script>");
	}

	//글이 유효한지 판별
	int n_no = 0;
	if (request.getParameter("n_no") != null) {
		n_no = Integer.parseInt(request.getParameter("n_no"));
	}
	if (n_no == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'question.jsp'");
		script.println("</script>");
	}
	questionVO vo = new questionDAO().getQuestion(n_no);
	if (!ad_id.equals(vo.getAd_id())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'question.jsp'");
		script.println("</script>");
	} else {
		if (request.getParameter("title") == null || request.getParameter("content") == null
				|| request.getParameter("title").equals("")
				|| request.getParameter("content").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			questionDAO dao = new questionDAO();
			int result = dao.update(n_no, request.getParameter("title"),
					request.getParameter("content"));
					request.getParameter("content");
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글수정에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='question.jsp'");
				//script.println("history.back()");
				script.println("</script>");
			}
		}
	}
	%>