<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	
	<h2>로그인 페이지</h2>
	<span style="color:red;">
		<%= request.getAttribute("ErrMsg")==null? 
				"" : request.getAttribute("ErrMsg") %>
	</span>

<%
	if(session.getAttribute("user_id") == null) {
%>
	<script>
		function validForm(form) {
			if(!form.input_id.value) {
				alert("아이디를 입력하세요");
				form.input_id.focus();
				return false;
			}
			if(!form.input_pw.value) {
				alert("비밀번호를 입력하세요");
				form.input_pw.focus();
				return false;
			}
		}
	</script>
	
	<form action="LoginPrc.jsp" method="post" name="imForm"
		onsubmit="return validForm(this);">
		아 이 디 : <input type="text" name="input_id"> <br />
		패스워드 : <input type="text" name="input_pw"> <br />
		<input type="submit" value="Log in">
	</form>
<%
	}
	else{
%>
	<%= session.getAttribute("user_name") %> 회원님, 로그인 하셨습니다. <br />
	<input type="button" value="로그아웃" onclick="location.href='Logout.jsp'">
<%
	}
%>
</body>
</html>