<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="inquiry.inquiryVO"%>
<%@page import="inquiry.inquiryDAO"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
  <%
        String mb_id = null;
        if (session.getAttribute("mb_id") != null) {//관리자아이디이름으로 세션이 존재하는 회원들은 
        	mb_id = (String) session.getAttribute("mb_id");//관리자아이디에 해당 세션값을 넣어준다.
        }
        if (mb_id == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요.')");
            script.println("location.href = 'LoginMain02.jsp'");
            script.println("</script>");
        } 
        int n_no = 0;
        if(request.getParameter("n_no") != null){
            n_no = Integer.parseInt(request.getParameter("n_no"));
        }
        if(n_no == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글 입니다')");
            script.println("location.href='inquiry.jsp'");
            script.println("</script>");
        }
        inquiryVO vo = new inquiryDAO().getInuiry(n_no);
        if(!mb_id.equals(vo.getMb_id())) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다')");
            script.println("location.href='inquiry.jsp'");
            script.println("</script>");            
        }
        else{
        	inquiryDAO dao = new inquiryDAO();
            int result = dao.delete(n_no);
            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글 삭제에 실패했습니다')");
                script.println("history.back()");
                script.println("</script>");
            } else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href='inquiry.jsp'");
                script.println("</script>");
            }
        }
    %>