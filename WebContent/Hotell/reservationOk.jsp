<%@page import="java.util.ArrayList"%>
<%@page import="reservation.HotelInfoVO"%>
<%@page import="reservation.HotelInfoDAO"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="reservation.ReservationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 예시 값 넣어보기
	// 호텔과 회원 DAO, VO를 
	int h_no = 101;
	// int hr_no = 0;
	// int pri = 0;
	/* HotelInfoDAO hdao = new HotelInfoDAO();
	ArrayList<HotelInfoVO> list =  hdao.getData(143);
	for(HotelInfoVO rvo : list) {
		hr_no = rvo.getHr_no();
		pri = rvo.getHr_price();
	} */
	int hr_no = 1004;
	int pri = 350000;
	String mb_id = (String)session.getAttribute("id");	// 회원 테이블		// 세션으로 가져와야 함
	String name = request.getParameter("rs_name");
	String st_date = request.getParameter("rs_st_data");
	String en_date = request.getParameter("rs_en_data");
	String tel = request.getParameter("rs_tel");
	String text = request.getParameter("rs_text");
	
	String id =(String)session.getAttribute("mb_id");
	
	/* if(id == null || id.equals("")) { */			// 비로그인일 경우 실행
		ReservationDAO dao = new ReservationDAO();
		
		ReservationVO vo = new ReservationVO();
		vo.setRs_name(name);
		vo.setMb_id(mb_id);
		vo.setRs_st_date(st_date);
		vo.setRs_en_date(en_date);
		vo.setRs_pri(pri);
		vo.setRs_tel(tel);
		vo.setRs_text(text);
		vo.setH_no(h_no);
		vo.setHr_no(hr_no);
		
		dao.addDataLogin(vo);
		
		response.sendRedirect("reservationList.jsp");	
	/* }else {} */
		/* ReservationDAO dao = new ReservationDAO();
		
		ReservationVO vo = new ReservationVO();
		vo.setRs_name(name);
		vo.setRs_st_date(st_date);
		vo.setRs_en_date(en_date);
		vo.setRs_pri(pri);
		vo.setRs_tel(tel);
		vo.setRs_text(text);
		vo.setMb_id(mb_id);
		vo.setH_no(h_no);
		vo.setHr_no(hr_no);
		
		dao.addDataLogin(vo); */
	//  response.sendRedirect("reservation.jsp");		// 결제창으로 이동해야함
	/* } */
	
	
%>
