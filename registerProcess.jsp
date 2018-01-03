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
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	Connection conn = ConnectionContext.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT count(*) AS recordCount FROM users WHERE ID='"+id+"';");  
	rs.next();
	int recordCount = rs.getInt("recordCount");
	
	 if (recordCount == 1) { // 입력한 ID 이미 존재 
%>
<script>
	alert("이미 존재하는 아이디 입니다.");
	history.go(-1);
</script>
<% 
	   }
	   else{  // 새로운 ID일 꼉우 
		   stmt.executeUpdate("INSERT INTO users (ID, pw, name, age) VALUES ('"+id+"', '"+pw+"', '"+name+"', "+age+");"); 
		   %>
		   <script>
		   	alert("계정이 생성되었습니다.");
		   	window.location = "login.jsp";
		   </script>
		   <% 
	   } //톄이블예 INSERT. 
	
%>
</head>
<body>

</body>
</html>