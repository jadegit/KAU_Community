<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice</title>
</head>
<body>
	<center>
	<jsp:include page="./menu.jsp" flush="false"/> <!-- menu를 삽입한다. 이는 추후 다른 메뉴에서도 모두 공통이다. -->
	<br/><br/>
	
	<form name="newarticle">

	<Table WIDTH="1020">
		<tr VALIGN="top">
			<td WIDTH="25%">
				<table border name="1">
						<tr>
							<td ALIGN="center" WIDTH="200" Height="40" BGcolor="yellowgreen"
								onMouseover="MouseOver(this, 'green');" onMouseout="MouseOut(this, 'yellowgreen');"
								onClick="go_question();"> <A TARGET="Right" CLASS="text">
								<FONT FACE="굴림"> <SPAN STYLE="font-size: 14pt;">자주 묻는 질문</SPAN></FONT></A></td>
						</tr>
				</table>
				<br/>
				<table border name="2">
						<tr>
							<td ALIGN="center" WIDTH="200" Height="40" BGcolor="yellowgreen"
								onMouseover="MouseOver(this, 'green');" onMouseout="MouseOut(this, 'yellowgreen');"
								onClick="window.location='suggest.jsp';"> <A TARGET="Right" CLASS="text">
								<FONT FACE="굴림"> <SPAN STYLE="font-size: 14pt;">건의사항</SPAN></FONT></A></td>
						</tr>
				</table>
				<br/><br/>
			</td>
			
			<td WIDTH="75%" BGcolor="lightYellow">
				<SPAN STYLE="font-size: 14pt;">
				<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. 사이트 디자인이 너무 구려요!<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A. 어쩔 수 없습니다. 공돌이라 디자인 고자라...<br/><br/>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. 게시판 종류가 너무 적지 않아요?<br/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A. 물론 원한다면 더 만들수도 있습니다.<br/><br/>
				<br/><br/>
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