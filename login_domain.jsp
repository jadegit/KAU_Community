<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Domain</title>

<Script Language="JavaScript">
function go_mypage() {
	window.location = "mypage.jsp"
}
function logout() {
	window.location = "logout.jsp"
}
</Script>

</head>
<body>

<%

   String id = (String)session.getAttribute("id");
 
//if (id.equals(storedID) && pw.equals(storedPW)) {    // 아이디와 패스워드 모두 일치
//   session.setAttribute("SUCCESS_LOGIN", id);
// 여기까지 로그인한 아이디를 불러오는 기능.

%>


	<include IMG="profile" HREF="mypage" Width="20" Height="30"> <%= id %> 님 반갑습니다!
	<br/>
	<input type="button" value="마이페이지" onClick="go_mypage();">
	<input type="button" value="로그아웃" onClick="logout();">

</body>
</html>