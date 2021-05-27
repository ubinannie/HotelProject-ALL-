<%@page import="MiniHotel.Member_Vo"%>
<%@page import="MiniHotel.Member_Dao"%>
<%@page import="reservation.ReservationVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 상태값 변화를 위한 test값
	// 취소할 h_no를 가져와야함
	String id = (String)session.getAttribute("id");
	String rsn = request.getParameter("rs_no");
	int rs_no = Integer.parseInt(rsn);
	// out.println(rsn);
	
	ReservationDAO rdao = new ReservationDAO();
	ReservationVO rvo =  rdao.getData(id);
	String name = rvo.getRs_name();
	String tel = rvo.getRs_tel();
	
	rdao.reserCancel(name, tel, id, rs_no);
	response.sendRedirect("reservationList.jsp");
%>