<%@page import="review.ReplyReviewVO"%>
<%@page import="review.ReplyReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no=request.getParameter("r_no");
	String contents=request.getParameter("retxt");
	//id값 받아오기
	String ad_id = null;
if (session.getAttribute("ad_id") != null) {
	ad_id = (String) session.getAttribute("ad_id");
}
	
	//out.println(no);
	//out.println(contents);
	
	if(no!=null){
		int r_no=Integer.parseInt(no);
		
		//out.println("r_no: "+r_no);
		//out.println("contents: "+contents); 
		
		ReplyReviewDAO rdao=new ReplyReviewDAO();
		ReplyReviewVO rvo=new ReplyReviewVO();
		rvo.setRp_contents(contents);
		rvo.setRef(r_no);
		rvo.setAd_id(ad_id);
		
		rdao.insertReply(rvo);
		
		response.sendRedirect("hotelReview_admin.jsp");
	}else{
		response.sendRedirect("hotelReview_admin.jsp");
	}
%>