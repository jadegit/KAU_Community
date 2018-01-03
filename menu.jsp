<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<HTML>
<HEAD>
<STYLE TYPE="text/css">
<!--
A.text {
	color: black;
	text-decoration: none;
	font: x-small georgia, serif;
	font-weight: bold;
}
//
-->
</STYLE>

<SCRIPT LANGUAGE="JavaScript">
	function MouseOver(cell, newcolor) {
		cell.bgColor = newcolor;
	}

	function MouseOut(cell, newcolor) {
		cell.bgColor = newcolor;
	}
	
	function go_home() {
		window.location = "home.jsp";
	}
	
	function go_notice(){
		window.location = "notice.jsp";
	}
	
	function go_freeforum() {
		window.location = "freeforum.jsp";
	}
	
	function go_information() {
		window.location = "information.jsp";
	}
	
	function go_question() {
		window.location = "question.jsp";
	}
</SCRIPT>

<IMG SRC="banner.JPG" ID="banner" width="1020" BORDER="3" onClick="go_home();"> <!-- 상단 배너 삽입 -->

</HEAD>

<BODY BGCOLOR="#e6ffe6">

	<table border name="top menu">
		<tr>
			<td ALIGN="center" WIDTH="250" Height="50" BGcolor="pink"
				onMouseover="MouseOver(this, 'red');" onMouseout="MouseOut(this, 'pink');" onClick="go_notice();">
				<A TARGET="Right" CLASS="text"> <FONT FACE="굴림">
				<SPAN STYLE="font-size: 14pt;">공지사항</SPAN></FONT></A></TD>

			<td ALIGN="center" WIDTH="250" Height="50" BGcolor="pink"
				onMouseover="MouseOver(this, 'red');" onMouseout="MouseOut(this, 'pink');" onClick="go_freeforum();">
				<A TARGET="Right" CLASS="text"> <FONT FACE="굴림">
				<SPAN STYLE="font-size: 14pt;">자유게시판</SPAN></FONT></A></td>

			<td ALIGN="center" WIDTH="250" Height="50" BGcolor="pink"
				onMouseover="MouseOver(this, 'red');" onMouseout="MouseOut(this, 'pink');" onClick="go_information();">
				<A TARGET="Right" CLASS="text"> <FONT FACE="굴림">
				<SPAN STYLE="font-size: 14pt;">정보공유</SPAN></FONT></A></td>

			<td ALIGN="center" WIDTH="250" Height="50" BGcolor="pink"
				onMouseover="MouseOver(this, 'red');" onMouseout="MouseOut(this, 'pink');" onClick="go_question();">
				<A TARGET="Right" CLASS="text"> <FONT FACE="굴림">
				<SPAN STYLE="font-size: 14pt;">문의/건의</SPAN></FONT></A></td>
		</tr>
	</table>
	
	<br/>
	
	<table name="search_login_domain">
		<tr><td Width="600" align="middle" >
		
		<td Width="400" align="middle">								<!-- 로그인 영역 -->
		<jsp:include page="./login_domain.jsp" flush="false"/> </td></tr>
	</table>
	
</BODY>
</HTML>