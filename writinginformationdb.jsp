<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int recordnum=0;
		String id = (String)session.getAttribute("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		java.util.Date now = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
		String nowstr = sdf.format(now);
		
		Connection conn = ConnectionContext.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM Informationdb WHERE Num ORDER BY Num DESC;"); // 게시글을 역순으로 불러옴
		
		rs.next();
		recordnum = rs.getInt("Num"); // 지금까지 쓰인 글 중 가장 최신 글의 번호를 불러온다.
		recordnum++; // 거기에 1을 더하면 새 글의 번호
		
		stmt.executeUpdate("INSERT INTO Informationdb (Num, Title, ID, View, Prepdate, Content) VALUES (" + recordnum + ", '" + title + "', '" + id + "', 0, '" + nowstr + "', '" + content+"');");
		response.sendRedirect("information.jsp");
		
	%>
</body>
</html>