<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="inquiry.commentDAO"%>
<%@page import="inquiry.commentVO"%>
<%
	String no = request.getParameter("n_no");
	 /* String ad_id = request.getParameter("ad_id"); */ 
	 /* 관리자 아이디 값 삽입이 안되어 admin 아이디로 삽입되게 만듬 */
	 String ad_id = "admin"; 
	String content = request.getParameter("content");
	
	if(no !=null){
		int n_no = Integer.parseInt(no);
		
		commentDAO rdao = new commentDAO();
		commentVO rvo = new commentVO();
		
		rvo.setAd_id(ad_id);
		rvo.setContent(content);
		rvo.setRef(n_no);
		
		rdao.write(rvo);
		
		response.sendRedirect("i_view.jsp?n_no=" +n_no);
	}else{
		response.sendRedirect("inquiry.jsp");
	}
	
		



%>