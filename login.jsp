<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KAU COMMUNITY</title>
<%
	
	int idshow = 0;
	String id="";
	Cookie[] cookies = request.getCookies();  // 모든 쿠키 얻어오기 
	if (cookies != null && cookies.length > 0) {
   		for (int i = 0 ; i < cookies.length ; i++) {
      		if (cookies[i].getName().equals("id")) {
				idshow = 1;
         		id = cookies[i].getValue();
      		}      
   		}
	}
%>
	<script language = "javascript">
		function logincheck(){
			if(document.loginform.id.value.length < 1){
				alert("아이디를 입력하세요");
			}
			else if(document.loginform.pw.value.length < 1){
				alert("비밀번호를 입력하세요");
			}
			else{
				document.loginform.submit();
			}
		}
	</script>
	<style>
		h1   {
				color: #ffffff;
				font-size: 50px;
			  }
	    form  {
				color: #ffffff;
			  }
	   
	
	</style>
</head>
<body bgcolor="#46B8FF">
	<center>
		<h1>KAU COMMUNITY</h1>
		<hr color="#ffffff"></br>
		<form name="loginform" action="loginProcess.jsp" method = "post">
		<%
			if(idshow == 1){
		%>
			ID <input type="text" name="id"  value = <%= id %> placeholder="아이디" /></br></br>
			PW <input type="password" name="pw"  placeholder="비밀번호" /></br>
			<input type="checkbox" name="idstore" value="store" checked/>아이디 저장</br>
		<%}
			else{
		%>
			ID <input type="text" name="id"  placeholder="아이디" /></br></br>
			PW <input type="password" name="pw"  placeholder="비밀번호" /></br>
			<input type="checkbox" name="idstore" value="store"/>아이디 저장</br>
		<%} %>
			
			<input type="button" name="login" value="로그인" onClick = "logincheck()"/></br></br>
			<hr color="#ffffff"></br>
		</form>
		<form action = "register.jsp">
			<input type="submit" name="register" value="계정 만들기" />
		</form>
	</center>
</body>
</html>