<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Writing in free forum</title>

<SCRIPT LANGUAGE="JavaScript">
	function submitbtn() {
		window.location = "freeforum.jsp";
		// 쓴 글을 수정하는 과정 추가 요망. 자기가 쓴 글일 때만 가능
	}
	function deletebtn(deleteNum) {
		alert("정말 게시글을 삭제하시겠습니까? 한 번 삭제하면 되돌릴 수 없습니다.");
		//DELETE FROM Student WHERE Name='김송이';
		<%
		//stmt.executeUpdate("DELETE FROM Freedb WHERE Num=" + deleteNum + "';");
		%>
		window.location = "freeforum.jsp";
		// 삭제하는 과정 추가 요망
		// 참고로 삭제 버튼은, 자기가 쓴 글에만 보이게 해야 한다. 자기가 쓴 글이 아닐 경우 버튼이 보이지도 않게 수정 바람
	}
</SCRIPT>

</head>
<body>
	<center>
	<jsp:include page="./menu.jsp" flush="false"/> <!-- menu를 삽입한다. 이는 추후 다른 메뉴에서도 모두 공통이다. -->
	<br/><br/>
	
	<% 
		int view;
		Connection conn = ConnectionContext.getConnection();
		Statement stmt = conn.createStatement();
		
		String WNum2 = request.getParameter("num");
		int WNum = Integer.parseInt(WNum2); // 현재 읽으려고 하는 글의 번호이다.
		
		ResultSet rs = stmt.executeQuery("SELECT * FROM Freedb"); // SELECT 쿼리문 수행
		
		rs = stmt.executeQuery("SELECT * FROM Freedb WHERE Num=" + WNum); // SELECT 쿼리문 수행
		rs.next();
		
		view = rs.getInt("View") + 1;
		stmt.executeUpdate("UPDATE Freedb SET View = "+view+" WHERE Num=" + WNum);
		rs = stmt.executeQuery("SELECT * FROM Freedb WHERE Num=" + WNum); // SELECT 쿼리문 수행
		rs.next();
		
	%>
	
	<table border name="top menu">
		<tr>		
			<td ALIGN="center" WIDTH="250" Height="40" BGcolor="orange"
				onMouseover="MouseOver(this, 'darkorange');" onMouseout="MouseOut(this, 'orange');" onClick="go_freeforum();">
				<A TARGET="Right" CLASS="text"> <FONT FACE="굴림">
				<SPAN STYLE="font-size: 14pt;">자유게시판</SPAN></FONT></A></td>
		</tr>
	</table>
	
	<form name="writing">
	
	<table name="writing2">
		<tr>		
			<td ALIGN="center" WIDTH="50" Height="40" BGcolor="lightGray">
				<FONT FACE="굴림"><SPAN STYLE="font-size: 12pt;">
				<b>제목</b></td> 
			<td ALIGN="left" WIDTH="920" Height="40" BGcolor="pink">
				<FONT FACE="굴림"><SPAN STYLE="font-size: 12pt;">
				<b>&nbsp;&nbsp;<%=rs.getString("Title")%></b></SPAN></FONT></A></td>
		</tr>

		<tr>
			<td ALIGN="center" WIDTH="50" Height="40" BGcolor="lightGray">
				<FONT FACE="굴림"><SPAN STYLE="font-size: 12pt;">
				<b>내용</b></td>
			<td WIDTH="920" BGcolor="White">
				<%=rs.getString("Content")%>
			</td>
		</tr>
		
		<tr>
			<td> <input type="button" value="돌아가기" onClick="window.location='freeforum.jsp';"> </td>
			<td ALIGN="right">
				<%String id = (String)session.getAttribute("id"); 
					if(false) {
				%>
				<input type="button" value="삭제" onClick="deletebtn(<%=WNum%>);">
				<%} %>
			</td>
		</tr>
	</table>
	
	</form>
	
	<br/><br/>
	<jsp:include page="./bottom_menu.jsp" flush="false"/> <!-- 하단 menu를 삽입한다. 이는 추후 다른 메뉴에서도 모두 공통이다. -->
	</center>

</body>
</html>