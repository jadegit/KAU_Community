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
				<SPAN STYLE="font-size: 14pt;">
				1. 욕설 사용 시 제재 받을 수 있음<br/>
				2. 도배 금지<br/>
				3. 부적절한 게시물 작성 시 게시물 삭제 조치, 경고
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