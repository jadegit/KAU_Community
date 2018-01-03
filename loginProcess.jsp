<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	String IDStore = request.getParameter("idstore");
	if (IDStore != null && IDStore.equals("store")) {
   		Cookie cookie = new Cookie("id", id);
   		response.addCookie(cookie);
	}
	else if(IDStore == null){             //아이디 기억하기가 체크 해제되어있을경우 
	  	Cookie cookie = new Cookie("id", id);
	  	cookie.setMaxAge(0);     //쿠키 삭제
	  	response.addCookie(cookie);
	}
	
	Connection conn = ConnectionContext.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE ID='"+id+"';");  
	if(rs.next()){
		if (rs.getString("id").equals(id)) {
			 if (rs.getString("pw").equals(pw)) {
				 session.setAttribute("id",id);
				 response.sendRedirect("home.jsp");
			 }
			 else{
				 %>
				 <script>
				 alert("아이디나 비밀번호를 잘못 입력하셨습니다.");
				 history.go(-1);
				 </script>
				 <% 
			 }
		 }
		 
		 else{
			 %>
			 <script>
			 alert("아이디나 비밀번호를 잘못 입력하셨습니다.");
			 history.go(-1);
			 </script>
			 <% 
		 }
	}
	else{
		%>
		 <script>
		 alert("없는 아이디 입니다.");
		 history.go(-1);
		 </script>
		 <% 
	}
	
	 
%>
</head>
<body>
	<script language = "javascript">
	</script>
	
	
</body>
</html>