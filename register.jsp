<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KAU COMMUNITY - REGISTERF</title>
	<script language = "javascript">
	
	function registercheck(){
		if(document.registerform.id.value.length < 1){
			alert("아이디를 입력하세요");
		}
		else if(document.registerform.pw.value.length < 1){
			alert("비밀번호를 입력하세요");
		}
		else if(document.registerform.name.value.length < 1){
			alert("이름을 입력하세요");
		}
		else if(document.registerform.age.value.length < 1){
			alert("나이를 입력하세요");
		}
		else{
			document.registerform.submit();
		}
	}
	
	</script>
	<style>
		h1   {
				color: #ffffff;
				font-size: 50px;
			  }
	    form  {
				color: #ffffff;
			  }
	   
	
	</style>
</head>
<body bgcolor="#46B8FF">
	<center>
		<h1>계정 만들기</h1>
		<hr color="#ffffff"></br>
		<form name="registerform" action = "registerProcess.jsp">
			ID &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id"  placeholder="아이디" /></br></br>
			PW &nbsp;&nbsp;&nbsp;<input type="password" name="pw"  placeholder="비밀번호" /></br></br>
			NAME <input type="text" name="name"  placeholder="이름" /></br></br>
			AGE &nbsp;&nbsp;&nbsp;<input type="text" name="age"  placeholder="나이" /></br></br>
			<input type="button" name="register" value="만들기" onClick = "registercheck()"/></br></br>
		</form>
	</center>
</body>
</html>