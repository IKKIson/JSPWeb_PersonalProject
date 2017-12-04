<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="User.Model.*" %>    

<jsp:useBean id="user" class="User.Model.UserTable" scope="request" />
<jsp:setProperty property="*" name="user"/>
<%
UserDAO ud = new UserDAO();
%>

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

ud.InsertUser(user.getEmailid(), user.getPassword(), user.getUsername(), user.getTell(),user.getBirthday(), user.getCreditcard());
out.println("Login Successed<br><br>");

%>

<button type = "button" onclick = "document.location.href='../View/Login.html';">로그인하기</button>
</body>
</html>