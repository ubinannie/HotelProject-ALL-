<%@page import="MiniHotel.Member_Vo"%>
<%@page import="MiniHotel.Member_Dao"%>
<%@ page import="java.io.PrintWriter" %> 
<% request.setCharacterEncoding("UTF-8"); %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta name="viewport" content="width=device-width", initial-scale="1">
<meta charset="UTF-8">
<title>loginOk.jsp</title>
</head>
<body>
<jsp:useBean id="minihotel" class="MiniHotel.Member_Vo" scope="page"/>
<jsp:setProperty property="*" name="minihotel"/>

<%
	Member_Dao member_Dao = new Member_Dao(); 

	int result = member_Dao.login(minihotel.getId(), minihotel.getPw()); 
	
	// session : jsp 내부 객체이니까
	if(result==1){
		session.setAttribute("id", minihotel.getId());
		// String id1 = (String)session.getAttribute("id");
		response.sendRedirect("hotelListFormLogin.jsp"); 
	}
	
%> 

  <script>
  
 	var result = <%=result%>; 
	
	if(result == 1){ 
		
		// 성공하면 넘어가는 화면
		// script.println("location.href = 'registerOk.jsp'");
		// String id1 = (String)session.getAttribute("id");
		response.sendRedirect("hotelListFormLogin.jsp"); 
		
	}else if(result == 0){ 
		
		alert('비밀번호가 틀립니다.'); history.back(); 
	
	}else if(result == -1){ 
		
		alert('존재하지 않는 아이디입니다.'); history.back(); 
		// 회원가입 창으로 이동하는 로직 추가
	
	}else if(result == -2){ 
		
		alert('서비스 오류가 발생했습니다. 고객센터로 연락주시면 빠른 처리 도와드리겠습니다.'); history.back(); 
	}

  </script>


</body>
</html>