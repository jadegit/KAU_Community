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
		
		String change_str = request.getParameter("str");
		String change_mode = request.getParameter("mode");
		
		out.println(change_str);
		out.println(change_mode);
		
		if(change_mode.equals("1")){
			stmt.executeUpdate("UPDATE users SET id = '" +change_str+"' WHERE ID='"+id+"';");
			//session.invalidate();
			session.setAttribute("id", change_str);
		}else if(change_mode.equals("2")){
			stmt.executeUpdate("UPDATE users SET pw = '" +change_str+"' WHERE ID='"+id+"';");
		}else if(change_mode.equals("3")){
			stmt.executeUpdate("UPDATE users SET name = '" +change_str+"' WHERE ID='"+id+"';");
		}else if(change_mode.equals("4")){
			stmt.executeUpdate("UPDATE users SET age = " +change_str+" WHERE ID='"+id+"';");
		}
	%>
</body>
</html>