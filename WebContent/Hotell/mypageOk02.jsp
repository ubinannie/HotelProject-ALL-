<%@page import="MiniHotel.AdminVO"%>
<%@page import="MiniHotel.AdminDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypageOk02.jsp</title>
</head>
<body>

	<%
		String id = null;
		if(session.getAttribute("id")!=null){
			id = (String) session.getAttribute("id");
		}; 
	
		String pw = request.getParameter("pw");
		String tel = "";
		
		String mp1 = request.getParameter("mp1");
		String mp2 = request.getParameter("mp2");
		
		tel = "010-"+mp1+"-"+mp2;
		
		String name= request.getParameter("name");
		
		// 정보 수정 함수
		AdminDAO adimDao = new AdminDAO();		
		AdminVO vo = new AdminVO();
		
		vo.setAd_id(id);
		vo.setAd_password(pw);
		vo.setAd_name(name);
		vo.setAd_tel(tel);
		
		int result = adimDao.updateData(vo);
	
		System.out.println("result : "+ result);
		System.out.println("updateData : " + vo.toString());
		
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('수정완료 했습니다. 내 정보 관리 페이지로 돌아갑니다.')");
			script.println("history.back()");
			script.println("</script>"); 
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('정보수정에 실패하였습니다. 정보를 확인해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		} 
	%>
	
</body>
</html>




