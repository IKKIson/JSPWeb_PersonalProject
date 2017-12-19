<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "DAO.*" %>  
<%@ page import = "Model.*" %>     

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="Model.UserTable" scope="request" />
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
if(user.getEmailid() !=null && user.getPassword() !=null && user.getUsername() !=null && user.getTell() !=0 && user.getBirthday() != 0 && user.getCreditcard() !=null) { // SignUp element is all full 
	UserDAO ud = new UserDAO();
	ud.InsertUser(user.getEmailid(), user.getPassword(), user.getUsername(), user.getTell(),user.getBirthday(), user.getCreditcard());
	
	out.println("Sign Up page Successed<br><br>");
	out.println("<script>alert('회원가입 완료')</script>");
	
	out.println("아이디 : " + user.getEmailid() + "<br>");
	out.println("비밀번호 : " + user.getPassword() + "<br>");
	out.println("성명 : " + user.getUsername() + "<br>");
	out.println("전화번호 : " + user.getTell() + "<br>");
	out.println("생년월일 : " + user.getBirthday() + "<br>");
	out.println("결제 : " + user.getCreditcard() + "<br>");
	
} else { // SignUp element has empty more than one
	out.println("<script>alert('회원가입 실패 정보를 정확인 기재해주세요')");
	out.println("document.location.href = '../View/SignUp.html';</script>");
}

%>
<br>
<hr>
<button type = "button" onclick = "document.location.href='../View/Login.html';">로그인하기</button>

</body>
</html>