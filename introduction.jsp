<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice</title>
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
	
	<form name="newarticle">

	<Table WIDTH="1020">
		<tr VALIGN="top">
			<td WIDTH="30%">
				<table border name="1">
						<tr>
							<td ALIGN="center" WIDTH="200" Height="40" BGcolor="yellowgreen"
								onMouseover="MouseOver(this, 'green');" onMouseout="MouseOut(this, 'yellowgreen');"
								onClick="go_notice();"> <A TARGET="Right" CLASS="text">
								<FONT FACE="굴림"> <SPAN STYLE="font-size: 14pt;">공지사항</SPAN></FONT></A></td>
						</tr>
				</table>
				<br/>
				<table border name="2">
						<tr>
							<td ALIGN="center" WIDTH="200" Height="40" BGcolor="yellowgreen"
								onMouseover="MouseOver(this, 'green');" onMouseout="MouseOut(this, 'yellowgreen');"
								onClick="window.location='update.jsp';"> <A TARGET="Right" CLASS="text">
								<FONT FACE="굴림"> <SPAN STYLE="font-size: 14pt;">업데이트</SPAN></FONT></A></td>
						</tr>
				</table>
				<br/>
				<table border name="3">
						<tr>
							<td ALIGN="center" WIDTH="200" Height="40" BGcolor="yellowgreen"
								onMouseover="MouseOver(this, 'green');" onMouseout="MouseOut(this, 'yellowgreen');"
								onClick="window.location='introduction.jsp';"> <A TARGET="Right" CLASS="text">
								<FONT FACE="굴림"> <SPAN STYLE="font-size: 14pt;">사이트 소개</SPAN></FONT></A></td>
						</tr>
				</table>
				<br/><br/>
			</td>
			
			<td WIDTH="70%">
				<SPAN STYLE="font-size: 13pt;">
				안녕하세요. 저희 KAU Community는 한국항공대학교 학생들을 위한 온라인 커뮤니티입니다.<br/>
				저희 커뮤니티는 ITSW 설계 수업 term project로 만들어진 사이트입니다.<br/>
				커뮤니티의 모든 이용은 회원제이며, 누구나 자유롭게 가입하실 수 있습니다.<br/>
				언제나 회원분들을 위한 커뮤니티 되겠습니다. 감사합니다.<br/><br/>
				2015124103 소하연<br/>
				2015124175 이청준
				</SPAN>
			</td>
		</tr>
	</Table>

	</form>
	
	<br/><br/>
	<jsp:include page="./bottom_menu.jsp" flush="false"/> <!-- 하단 menu를 삽입한다. 이는 추후 다른 메뉴에서도 모두 공통이다. -->
	</center>
</body>
</html>