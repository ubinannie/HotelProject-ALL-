<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//out.print("삭제 <br/>");
	String no=request.getParameter("r_no");
	//out.println(no);
	
	if(no!=null){
		int r_no=Integer.parseInt(no);
		ReviewDAO dao=new ReviewDAO();
		
		dao.deleteData(r_no);
		
		response.sendRedirect("hotelReview_user.jsp");
	}else{
		response.sendRedirect("hotelReview_user.jsp");
	}
%>