<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="User.Model.*" %>    

<jsp:useBean id="user" class="User.Model.UserTable" scope="request" />
<jsp:setProperty property="*" name="user"/> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입완료</title>
</head>
<body bgcolor="FFFF99">
<center>

<span style="font-weight: bold; font-size: 2em; line-height: 1.0em; color: 660000; font-family: arial; ">
신규가입 완료
</span>
<h1>회원가입 감사합니다.</h1>
<hr><br>
</center>

<%
UserDAO ud = new UserDAO();
//ud.InsertUser(user.getEmailid(), user.getPassword(), user.getUsername(), user.getTell(),user.getBirthday(), user.getCreditcard());
out.println("Sign Up page Successed<br><br>");


if(true) { // SignUp element is all full 
	out.println("<script>alert('회원가입 완료')</script>");
	out.println("<h2>TODO:회원가입 성공 후 DB에 잘 들어갔네 확인해주는 페이지</h2><br><br>");

} else { // SignUp element has empty more than one
	out.println("<script>alert('회원가입 실패')");
	out.println("document.location.href = '../View/SignUp.html';</script>");
}

%>


<hr>
<button type = "button" onclick = "document.location.href='../View/Login.html';">로그인하기</button>

</body>
</html>