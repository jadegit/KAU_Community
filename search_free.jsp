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
	<center>
	<jsp:include page="./menu.jsp" flush="false"/> <!-- menu를 삽입한다. 이는 추후 다른 메뉴에서도 모두 공통이다. -->
	<br/><br/>
	
	<%
		String searchword = request.getParameter("search");
		String searchcategory = request.getParameter("category");
	
		Connection conn = ConnectionContext.getConnection();
		Statement stmt = conn.createStatement();
		
		ResultSet rs;
		if(searchcategory.equals("id")) {
			rs = stmt.executeQuery("SELECT * FROM Freedb WHERE ID Like '%" + searchword + "%';"); // SELECT 쿼리문 수행
		}
		else {
			rs = stmt.executeQuery("SELECT * FROM Freedb WHERE Title Like '%" + searchword + "%';");
		}
		
		int writingnum = 0;
		while(rs.next()) { writingnum++; } // 전체 게시물의 개수를 불러온다.
	%>
	
	<table border name="top menu">
		<tr>		
			<td ALIGN="center" WIDTH="250" Height="40" BGcolor="orange"
				onMouseover="MouseOver(this, 'darkorange');" onMouseout="MouseOut(this, 'orange');" onClick="go_freeforum();">
				<A TARGET="Right" CLASS="text"> <FONT FACE="굴림">
				<SPAN STYLE="font-size: 14pt;">자유게시판</SPAN></FONT></A></td>
		</tr>
	</table>
	
	<table name="catalog">
		<tr>
			<td ALIGN="center" colspan="5">
				<FONT FACE="굴림"><SPAN STYLE="font-size: 14pt;">입력하신 검색어 "<b><%=searchword%></b>"에 대한 결과입니다.</SPAN></FONT>
			</td>
		</tr>
		
		<tr Height="35" BGcolor="#cccccc" ALIGN="center">
			<td WIDTH="70"><b>번호</b></td>
			<td WIDTH="500"><b>제목</b></td>
			<td WIDTH="170"><b>글쓴이</b></td>
			<td WIDTH="70"><b>조회수</b></td>
			<td WIDTH="180"><b>날짜</b></td>
		</tr>
		
		<%
		if(searchcategory.equals("id")) {
			rs = stmt.executeQuery("SELECT * FROM Freedb WHERE ID Like '%" + searchword + "%' ORDER BY Num DESC;"); // SELECT 쿼리문 수행
		}
		else {
			rs = stmt.executeQuery("SELECT * FROM Freedb WHERE Title Like '%" + searchword + "%' ORDER BY Num DESC;");
		}
		
		for (int i=writingnum; i>0; i=i-2) { // 한 페이지에 20개의 글
			if(i>0) {
				rs.next();
		%>
			<tr Height="30" BGcolor="White" ALIGN="center">
				<td WIDTH="70"><%=rs.getInt("Num")%></td>
				<td WIDTH="500" onClick="read_content(<%=rs.getInt("Num")%>);"><%=rs.getString("Title")%></td>
				<td WIDTH="170"><%=rs.getString("ID")%></td>
				<td WIDTH="70"><%=rs.getInt("View")%></td>
				<td WIDTH="180"><%=rs.getString("Prepdate")%></td>
			</tr>
			
		<%	} 
			if(i-1>0) {
				rs.next();
		%>
		
			<tr Height="30" BGcolor="lightYellow" ALIGN="center">
				<td WIDTH="70"><%=rs.getInt("Num")%></td>
				<td WIDTH="500" onClick="read_content(<%=rs.getInt("Num")%>);"><%=rs.getString("Title")%></td>
				<td WIDTH="170"><%=rs.getString("ID")%></td>
				<td WIDTH="70"><%=rs.getInt("View")%></td>
				<td WIDTH="180"><%=rs.getString("Prepdate")%></td>
			</tr>
		<%
			}
		}
		%>
		
		<tr>
			<td colspan="2"></td>
			<td colspan="3" ALIGN="right">
			</td>
		</tr>
	
	</table>
	
	<br/><br/>
	<jsp:include page="./bottom_menu.jsp" flush="false"/> <!-- 하단 menu를 삽입한다. 이는 추후 다른 메뉴에서도 모두 공통이다. -->
	</center>

</body>
</html>