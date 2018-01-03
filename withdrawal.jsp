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
</head>
<body>

	
	<%
		String id = (String)session.getAttribute("id");
	
		Connection conn = ConnectionContext.getConnection();
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("DELETE FROM users WHERE ID='"+id+"';"); 
		stmt.executeUpdate("DELETE FROM Informationdb WHERE ID='"+id+"';"); 
		stmt.executeUpdate("DELETE FROM Freedb WHERE ID='"+id+"';"); 
		stmt.executeUpdate("DELETE FROM Questiondb WHERE ID='"+id+"';"); 
		
	%>
	<script language="javascript">

			alert("회원탈퇴 되었습니다.");
			window.location = "login.jsp"
		
	</script>
</body>
</html>