<%@page import="java.io.PrintWriter"%>
<%@page import="MiniHotel.Member_Vo"%>
<%@page import="MiniHotel.Member_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypageOk.jsp</title>
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
		Member_Dao memDao = new Member_Dao();		
		Member_Vo vo = new Member_Vo();
		
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setTel(tel);
		
		int result = memDao.updateData(vo);
	
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




