<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Free forum</title>

<script language="JavaScript">
	function read_content(writingnum) {
		window.location = "readfree.jsp?num=" + writingnum;
	}
</script>

</head>
<body>

	<%
		Connection conn = ConnectionContext.getConnection();
		Statement stmt = conn.createStatement();
	
		ResultSet rs = stmt.executeQuery("SELECT * FROM Freedb"); // SELECT 쿼리문 수행
		int writingnum = 0;
		while(rs.next()) { writingnum++; } // 전체 게시물의 개수를 불러온다.
	%>
	
	<table name="catalog">
		<tr Height="35" BGcolor="#cccccc" ALIGN="center">
			<td WIDTH="300"><b>제목</b></td>
			<td WIDTH="120"><b>날짜</b></td>
		</tr>
		
		<%
		for (int i=writingnum; i>writingnum-10; i=i-2) { // 한 페이지에 10개의 글
			if(i>0) {
				rs = stmt.executeQuery("SELECT * FROM Freedb WHERE Num=" + i); // SELECT 쿼리문 수행
				rs.next();
		%>
			<tr Height="30" BGcolor="White" ALIGN="center">
				<td WIDTH="300" onClick="read_content(<%=i%>);"><%=rs.getString("Title")%></td>
				<td WIDTH="120"><%=rs.getString("Prepdate")%></td>
			</tr>
			
		<%	} 
			if(i-1>0) {
				rs = stmt.executeQuery("SELECT * FROM Freedb WHERE Num=" + (i-1));
				rs.next();
		%>
		
			<tr Height="30" BGcolor="lightYellow" ALIGN="center">
				<td WIDTH="300" onClick="read_content(<%=i-1%>);"><%=rs.getString("Title")%></td>
				<td WIDTH="120"><%=rs.getString("Prepdate")%></td>
			</tr>
		<%
			}
		}
		%>
		
	</table>
	
</body>
</html>