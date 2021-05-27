<%@page import="reservation.ReservationVO"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//상태값 변화를 위한 test값
	// 로그인 하고 값을 가져와야함
	// 로그인을 한 후에 session에 ID에 맞는 이름, 연락처, id를 가져와야함
	// 취소할 h_no를 가져와야함
	
	String id = (String)session.getAttribute("id");
	String rsn = request.getParameter("rs_no");
	int rs_no = Integer.parseInt(rsn);
	
	ReservationDAO rdao = new ReservationDAO();
	ReservationVO rvo = rdao.getData(id);
	String name = rvo.getRs_name();
	String tel = rvo.getRs_tel();
	
	rdao.deleteReser(name, tel, id, rs_no);
	
	response.sendRedirect("reservationList.jsp");
%>