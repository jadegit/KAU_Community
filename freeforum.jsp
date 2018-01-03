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
	function go_page(pagenum) {
		window.location = "freeforum.jsp?page=" + pagenum;
	}
	function read_content(writingnum) {
		window.location = "readfree.jsp?num=" + writingnum;
	}
</script>

</head>
<body>
	
	<%
		if((String)session.getAttribute("id") == null){
	%>
	<script language="javascript">
		window.location = "login.jsp"
	</script>
	<% 
		}
	%>
	
	<center>
	<jsp:include page="./menu.jsp" flush="false"/> <!-- menu를 삽입한다. 이는 추후 다른 메뉴에서도 모두 공통이다. -->
	<br/><br/>
	
	<%
		Connection conn = ConnectionContext.getConnection();
		Statement stmt = conn.createStatement();
	
		int currentpage;
		String currentpage2 = request.getParameter("page");
	
		if(currentpage2==null) currentpage = 1;
		else currentpage = Integer.parseInt(currentpage2);
		// currentpage는 현재 페이지의 번호를 저장하는 변수이다. 한 페이지 당 글 수는 20개이며, 따라서 n페이지에는 최신 (19n-1)~20n 번째 글이 나온다.
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM Freedb"); // SELECT 쿼리문 수행
		int writingnum = 0;
		while(rs.next()) { writingnum++; } // 전체 게시물의 개수를 불러온다.
		int latest_wrt = writingnum - (currentpage-1)*20; // 현재 페이지에 표시될 글 중 가장 위에 있는 글의 번호이다.
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
		<tr Height="35" BGcolor="#cccccc" ALIGN="center">
			<td WIDTH="70"><b>번호</b></td>
			<td WIDTH="500"><b>제목</b></td>
			<td WIDTH="170"><b>글쓴이</b></td>
			<td WIDTH="70"><b>조회수</b></td>
			<td WIDTH="180"><b>날짜</b></td>
		</tr>
		
		<%
		for (int i=latest_wrt; latest_wrt-20<i; i=i-2) { // 한 페이지에 20개의 글
			if(i>0) {
				rs = stmt.executeQuery("SELECT * FROM Freedb WHERE Num=" + i); // SELECT 쿼리문 수행
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
				rs = stmt.executeQuery("SELECT * FROM Freedb WHERE Num=" + (i-1));
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
			<td colspan="2" ALIGN="center">
				<form action="search_free.jsp" method="get" name="searchform">
					<select name="category">
						<option value="title">제목</option>
						<option value="id">작성자</option>
					</select>
					<input type="text" name="search" size="35"> <!-- 검색기. -->
					<input type="submit" value="검색">
				</form>
			</td>
			<td colspan="2"></td>
			<td ALIGN="right"><input type=button value="글쓰기" onClick="window.location='writingfree.jsp';"></td>
		</tr>
		
		<tr>
			<td colspan="2"></td>
			<td colspan="3" ALIGN="right">
				<%	if(((currentpage-1)/10)*10>0) {%>
						<a onClick="go_page(<%=((currentpage-1)/10)*10%>);"> ◀ </a>
				<% 
					}
					for (int i=(currentpage-1)/10*10+1; i<=(currentpage-1)/10*10+10; i++) {
						if(i==currentpage) {
							out.println("<font color='darkorange'><b>" + i + "</b></font> ");
						}
						else {
							if(i<=Math.ceil((double)writingnum/20)) {
				%>
								<a onClick="go_page(<%=i%>);"><u><%=i%></u></a>
				<%
							}
						}
					}
					if(writingnum-(((currentpage-1)/10*10+10)-1)*20-19 > 1) {
						// (10페이지의 latest_wrt) = writingnum - (((currentpage-1)/10*10+10)-1)*20
				%>
				<a onClick="go_page(<%=((currentpage-1)/10)*10+11%>);"> ▶ </a>
				<%	} %>
			</td>
		</tr>
	
	</table>
	
<rignt>
<% 
rs = stmt.executeQuery("SELECT * FROM Freedb ORDER BY View DESC;"); // 게시글을 역순으로 불러옴
%>
	<table>
		<tr>
			<td colspan="3"><strong>자유게시판 베스트 글!!!</strong></td>
		</tr>
		
		<%
		for(int i=1; i<11; i++) {
			if(writingnum>=i) {
				rs.next();
		%>
			<tr>
				<td WIDTH="300" onClick="read_content(<%=rs.getInt("Num")%>);"><%=rs.getString("Title")%></td>
				<td WIDTH="100"><%=rs.getString("ID")%></td>
				<td WIDTH="70"><%=rs.getInt("View")%></td>
			</tr>
		<%
			}
		}
		%>
	</table>
</rignt>
	
	
	<br/><br/>
	<jsp:include page="./bottom_menu.jsp" flush="false"/> <!-- 하단 menu를 삽입한다. 이는 추후 다른 메뉴에서도 모두 공통이다. -->
	</center>
</body>

</html>