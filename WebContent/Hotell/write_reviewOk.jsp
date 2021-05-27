<%@page import="review.ReviewVO"%>
<%@page import="review.ReviewDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* String writer=request.getParameter("wr");
	String title=request.getParameter("ti");
	String contents=request.getParameter("ct");
	String fileName=request.getParameter("fileName");

 	out.println("writer: "+writer+"<br/>");
	out.println("title: "+title+"<br/>");
	out.println("contents: "+contents+"<br/>"); 
	out.println("filename: "+fileName+"<br/>"); */
	//id값 받아오기
	String id = "";

	id = (String) session.getAttribute("id");

	String saveDir = request.getRealPath("upload");

	//out.println(saveDir+"<br/>");

	int maxFileSize = 1024 * 1024 * 10; // 10MB

	MultipartRequest mr = new MultipartRequest(request, saveDir, maxFileSize, "UTF-8",
	new DefaultFileRenamePolicy());

	String title = mr.getParameter("title");
	//String writer = mr.getParameter("writer");
	String contents = mr.getParameter("contents");

	/*	out.println(title+"<br/>");
		out.println(writer+"<br/>");
		out.println(contents+"<br/>");
		out.println(fileName+"<br/>"); */

	// DBMS에 연결한 후 write.jsp에서 전달해온 값을 저장
	ReviewDAO dao = new ReviewDAO();
	ReviewVO vo = new ReviewVO();
	vo.setMb_id(id);
	vo.setR_title(title);
	vo.setR_contents(contents);

	//사진
	String fileName = mr.getOriginalFileName("fileName");
	//out.println(fileName+"<br/>");
	if (fileName != null) {
		vo.setFilepath("../upload/" + fileName);
	}

	dao.addData(vo);

	// DB에 저장이 잘 되었으면 게시판 메인으로 페이지 이동
	response.sendRedirect("hotelReview_user.jsp");
%>