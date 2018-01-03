<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	.modi_pane{
		position:fixed;
		top:0px;
		left:0px;
		width:100%;
		height:100%;
		z-index:2000;
		background-color:rgba(0,0,0,0.3);
		display:none;
	}
	
	.modi_box{
    width: 700px;
    background-color: #ffffff;
    height: 300px;
    position: absolute;
    top: calc(50% - 150px);
    left: calc(50% - 350px);
}
.modi_h1 {
    position: absolute;
    left: 45px;
}
#input_str{
position: absolute;
left: 80px;
top: 113px;
width: 509px;
height: 41px;
font-size: 20px;
}

.btn_0{
    position: absolute;
    left: 171px;
    top: 200px;
    width: 137px;
    text-align: center;
    height: 51px;
    background-color: skyblue;
    font-size: 21px;
    line-height: 2.2;
    color: #ffffff;
}
.btn_1{
position: absolute;
left: 375px;
top: 200px;
width: 137px;
text-align: center;
height: 51px;
background-color: skyblue;
font-size: 21px;
line-height: 2.2;
color: #ffffff;
}

	
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script language="javascript">

	function withdrawal(){
		if(confirm("정말 탈퇴하시겠습니까?\n 회원님에 관한 모든 정보는 삭제됩니다.") == true){
			window.location = "withdrawal.jsp"
		}
	}
	</script>
</head>

<body>
	<%
		if((String)session.getAttribute("id") == null){
			%>
			<script language = "javascript">
				window.location = "login.jsp"
			</script>
			<%
		}
	%>
	<script>
		var change_mod="1";
		
		function go_modi(obj){
			document.getElementById("input_str").value = "";
			
			if(obj == "id"){
				document.getElementById("input_str").placeholder = "아이디를 입력해주세요";
				change_mod = "1";
			}else if(obj == "pw"){
				document.getElementById("input_str").placeholder = "패스워드를 입력해주세요";
				change_mod = "2";
			}else if(obj == "nm"){
				document.getElementById("input_str").placeholder = "이름을 입력해주세요";
				change_mod = "3";
			}else if(obj == "ag"){
				document.getElementById("input_str").placeholder = "나이를 입력해주세요";
				change_mod = "4";
			}
			
			document.querySelector(".modi_pane").style.display="inline";
		}
		
		function change_userdata(){
			
			var xhr = new XMLHttpRequest();
			var i = 0;
			var str = document.getElementById("input_str").value;
			
			url ="change.jsp?mode="+change_mod+"&str="+str;
			
			xhr.open("POST", url , false);
			xhr.onreadystatechange = function(){
				if(xhr.readyState === 4 && xhr.status === 200){
					document.querySelector(".modi_pane").style.display="none";
					alert("수정되었습니다.");
					
					if(change_mod == 1 ){
						document.getElementById("myid").innerHTML = str;
					}else if(change_mod == 2 ){
						var pwstr="";
						
						for(i=0;i<str.length;i++){
							
							if(i==0 || i==1){
								pwstr += str.charAt(i);
							}
							else{
								pwstr += "*";
							}
						}
						document.getElementById("mypw").innerHTML = pwstr;
					}else if(change_mod == 3 ){
						document.getElementById("mynm").innerHTML = str;
					}else if(change_mod == 4 ){
						document.getElementById("myag").innerHTML = str;
					}
					
				}
			}
			
			xhr.send();
		}
	</script>

	<div class = "modi_pane">
		<div class = "modi_box">
			<h1 class = "modi_h1">수정사항을 입력하세요</h1>
			<input type = "text" id = "input_str" placeholder="아이디"/>
			<div class ="btn_0" onclick = "change_userdata()">수정</div>
			<div class = "btn_1" onclick ="this.parentElement.parentElement.style.display = 'none';">닫기</div>
		</div>
	</div>



	
<center>
	<jsp:include page="./menu.jsp" flush="false"/> <!-- menu를 삽입한다. 이는 추후 다른 메뉴에서도 모두 공통이다. -->
	</br>
	
	<%
		String id = (String)session.getAttribute("id");
		String pw="";
		String pwstr = "";
		String name="";
		int age=0;
		int i;
		
		Connection conn = ConnectionContext.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE ID='"+id+"';"); 
		
		if(rs.next()){
			pw = rs.getString("pw");
			name = rs.getString("name");
			age = rs.getInt("age");
		}
			
		for(i=0;i<pw.length();i++){
			if(i==0 || i==1){
				pwstr += pw.charAt(i);
			}
			else{
				pwstr += "*";
			}
		}
		
		
	%>
	
	<table>
		<tr>
			<td ALIGN="center" WIDTH="300" Height="60" >
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 15pt;"></SPAN></FONT></A></TD>
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="orange">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 15pt;">내정보</SPAN></FONT></A></TD>
				<td ALIGN="center" WIDTH="300" Height="60" >
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 15pt;"></SPAN></FONT></A></TD>
		</tr>
		<tr>		
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="white">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 18pt;">아이디</SPAN></FONT></A></TD>
			
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="white">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 14pt;" id = "myid" ><%=id %></SPAN></FONT></A></TD>
				
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="white"
				onMouseover="MouseOver(this, 'grey');" onMouseout="MouseOut(this, 'white');" onClick="go_modi('id');">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 14pt;">수정</SPAN></FONT></A></TD>
				
		</tr>
		<tr>		
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="white">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 18pt;">비밀번호</SPAN></FONT></A></TD>
			
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="white">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 14pt;" id = "mypw" ><%=pwstr %></SPAN></FONT></A></TD>
				
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="white"
				onMouseover="MouseOver(this, 'grey');" onMouseout="MouseOut(this, 'white');" onClick="go_modi('pw');">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 14pt;">수정</SPAN></FONT></A></TD>
				
		</tr>
		<tr>		
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="white">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 18pt;">이름</SPAN></FONT></A></TD>
			
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="white">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 14pt;" id = "mynm" ><%=name %></SPAN></FONT></A></TD>
				
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="white"
				onMouseover="MouseOver(this, 'grey');" onMouseout="MouseOut(this, 'white');" onClick="go_modi('nm');">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 14pt;">수정</SPAN></FONT></A></TD>
				
		</tr>
		<tr>		
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="white">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 18pt;">나이</SPAN></FONT></A></TD>
			
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="white">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 14pt;" id = "myag" ><%=age %></SPAN></FONT></A></TD>
				
			<td ALIGN="center" WIDTH="300" Height="60" BGcolor="white"
				onMouseover="MouseOver(this, 'grey');" onMouseout="MouseOut(this, 'white');" onClick="go_modi('ag');">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 14pt;">수정</SPAN></FONT></A></TD>
				
		</tr>
		<tr>
			<td ALIGN="center" WIDTH="300" Height="40" >
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 15pt;"></SPAN></FONT></A></TD>
			<td ALIGN="center" WIDTH="300" Height="40" BGcolor="white"
				onMouseover="MouseOver(this, 'grey');" onMouseout="MouseOut(this, 'white');" onClick="withdrawal();">
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 12pt;">회원탈퇴</SPAN></FONT></A></TD>
				<td ALIGN="center" WIDTH="300" Height="40" >
				<A TARGET="Right" CLASS="text"> <FONT FACE="고딕">
				<SPAN STYLE="font-size: 15pt;"></SPAN></FONT></A></TD>
		</tr>
	</table>
	
	
	</center>
</body>
</html>