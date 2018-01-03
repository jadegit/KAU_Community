<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Writing in free forum</title>

<SCRIPT LANGUAGE="JavaScript">
	function mysave() {
		if(document.getElementById("title").value.length < 1){
			alert("제목을 입력하세요");
		}
		else if(document.getElementById("content").value.length < 1){
			alert("내용을 입력하세요");
		}
		else{
			document.writing.submit();
		}
	}
</SCRIPT>

</head>
<body>
	<center>
	<jsp:include page="./menu.jsp" flush="false"/> <!-- menu를 삽입한다. 이는 추후 다른 메뉴에서도 모두 공통이다. -->
	<br/><br/>
	
	<form name="writing" action = "writingfreedb.jsp">
	
	<table name="writing2">
		<tr>		
			<td ALIGN="left" WIDTH="700" Height="40" BGcolor="lightGray" colspan="2">
				<FONT FACE="굴림"><SPAN STYLE="font-size: 12pt;">
				<b>제목</b> <input type="text" size=60 name="title" id = "title"></SPAN></FONT></A></td>
		</tr>

		<tr>
			<td WIDTH="700" colspan="2">
				<textarea cols="60" rows="15" name="content" id="content"> </textarea>
			</td>
		</tr>
		
		<tr>
			<td> <input type="button" value="돌아가기" onClick="window.location='freeforum.jsp';"> </td>
			<td ALIGN="right"> <input type="button" value="작성" onClick="mysave();"> </td>
		</tr>
	</table>
	
	</form>
	
	<br/><br/>
	<jsp:include page="./bottom_menu.jsp" flush="false"/> <!-- 하단 menu를 삽입한다. 이는 추후 다른 메뉴에서도 모두 공통이다. -->
	</center>
</body>
</html>