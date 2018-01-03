<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main home</title>
	
</head>

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
	</br>
	
	<form name="newarticle">

	<Table WIDTH="1020" Height="500" border bgcolor = "#d2ffd2">
		<tr Height="50%"><td WIDTH="30"> <a onClick="go_notice();">
			<SPAN STYLE="font-size: 14pt;"><strong>공지사항</strong></SPAN><br/></a> 
			<jsp:include page="./home1.jsp" flush="false"/>
		</td>
		<td WIDTH="35%" rowspan="2"> <a onClick="go_freeforum();">
			<SPAN STYLE="font-size: 14pt;"><strong>자유게시판</strong></SPAN><br/></a> 
			<jsp:include page="./home3.jsp" flush="false"/>
		</td>
		<td WIDTH="35%" rowspan="2"> <a onClick="go_information();">
			<SPAN STYLE="font-size: 14pt;"><strong>정보공유</strong></SPAN><br/></a> 
			<jsp:include page="./home4.jsp" flush="false"/>
		</td></tr>
		<tr Height="50%"><td> <a onClick="go_notice();">
			<SPAN STYLE="font-size: 14pt;"><strong>업데이트</strong></SPAN><br/></a> 
			<jsp:include page="./home2.jsp" flush="false"/>
		</td></tr>
	</Table>

	</form>
	
	
	<br/><br/>
	<jsp:include page="./bottom_menu.jsp" flush="false"/> <!-- 하단 menu를 삽입한다. 이는 추후 다른 메뉴에서도 모두 공통이다. -->
	</center>

</html>