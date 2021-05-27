<%@page import="MiniHotel.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idcheckForm02.jsp</title>
<style type="text/css">
#idck{
  font-size: 22px;
  font-family: 'Roboto', sans-serif;
  font-weight: 800;
}
#id{
  height: 24px;
  width: 80px;
  font-size: 12px;
  font-family: 'Roboto', sans-serif;
  font-weight: 400;
}
</style>
</head>
<body>

	<h3 id="idck"> 아이디 중복체크 </h3>
	<form method="get" action="IDCheck02.jsp" onsubmit="return IDCheck(this)">
		아이디 : <input type="text" name="personName" maxlength="10" autofocus required>
		<input type="submit" value="중복확인" id="id">
	</form>

	<script>

	function IDCheck(id){
		const userID = id.personName.value;
	    let check=true;
	
	    for(let i=0; i<userID.length; i++)
	    {
	        let temp = userID.charCodeAt(i);
	        if( (65<=temp && temp<=90 || 97<=temp && temp<=122 || 48<=temp && temp<=57)&&userID.length>=4 && userID.length<=10 )  {
	            console.log(temp);
	        }
	        else{
	            check=false;
	            break;
	        }
	    }
	    if(check==false){
	        alert('사용하실 수 없는 아이디입니다.');
	    }else(check==ture){
	    	alert('사용하실 수 있는 아이디입니다.');
	    	opener.document.frm.idDuplication.value =userID;
	    }
	
	    return check;
	}
	</script>


</body>
</html>