<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="inquiry.inquiryVO"%>
<%@page import="inquiry.inquiryDAO"%>
<%@page import="inquiry.commentDAO"%>
<%@page import="inquiry.commentVO"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
  <%
  String id = null;
  if (session.getAttribute("id") != null) {
  	id = (String) session.getAttribute("id");
  }
        if (id == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요.')");
            script.println("location.href = 'LoginMain.jsp'");
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
            script.println("location.href='inquiry_user.jsp'");
            script.println("</script>");
        }
        inquiryVO vo = new inquiryDAO().getInuiry(n_no);
        if(!id.equals(vo.getMb_id())) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다')");
            script.println("location.href='inquiry_user.jsp'");
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
                script.println("location.href='inquiry_user.jsp'");
                script.println("</script>");
            }
        }
   
    %>

    