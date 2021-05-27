<%@page import="review.ReplyReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//out.print("삭제 <br/>");
	String no=request.getParameter("rp_no");
	//out.println(no);
	
	if(no!=null){
		int rp_no=Integer.parseInt(no);
		ReplyReviewDAO dao=new ReplyReviewDAO();
		
		dao.deleteData(rp_no);
		
		response.sendRedirect("hotelReview_admin.jsp");
	}else{
		response.sendRedirect("hotelReview_admin.jsp");
	}
%>