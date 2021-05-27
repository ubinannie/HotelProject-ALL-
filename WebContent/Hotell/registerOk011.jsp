<%@page import="MiniHotel.AdminDAO"%>
<%@page import="MiniHotel.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="author" content="hotel">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width, initial-scale=1, user-scalable=no, maximum-scale=1, minimum-scale=1">


    <!-- css 적용 : reset.css는 먼저 초기화하여야하기때문에 먼저 호출 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/main.css">
    
<title>registerOk011.jsp</title>
</head>
<body>
<jsp:useBean id="minihotel" class="MiniHotel.AdminVO" scope="page"/>
<jsp:setProperty property="*" name="minihotel"/>

	<%
		String id = request.getParameter("ad_id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		// String birth = request.getParameter("birth");
		String mp1 = request.getParameter("mp1");
		String mp2 = request.getParameter("mp2");
		// String nickname = request.getParameter("nick");
		
		// out.println(id + "" + pw + "" + name + "" + birth + "" + mp1 + "" + mp2 + "" 
		// + email + "" + nickname + "");
		
		// 회원가입 기능 수행 
		// 사용자가 입력한 데이터를 -> 데이터 베이스 입력 (등록)
		
		AdminDAO dao = new AdminDAO();
		
		AdminVO vo = 
				new AdminVO(id, pw, name, email, "010-"+mp1+"-"+mp2);
				
		dao.addAdmin(vo);
		
		// response.sendRedirect("LoginMain.jsp"); 

	%>
	
	<script type="text/javascript">
	
		
	
		location.href="LoginMain02.jsp";
	
	</script>
	
	