<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="User.Model.*" %>    

<jsp:useBean id="user" class="User.Model.UserTable" scope="request" />
<jsp:setProperty property="*" name="user"/> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�����ԿϷ�</title>
</head>
<body bgcolor="FFFF99">
<center>

<span style="font-weight: bold; font-size: 2em; line-height: 1.0em; color: 660000; font-family: arial; ">
�ű԰��� �Ϸ�
</span>
<h1>ȸ������ �����մϴ�.</h1>
<hr><br>
</center>

<%
UserDAO ud = new UserDAO();
//ud.InsertUser(user.getEmailid(), user.getPassword(), user.getUsername(), user.getTell(),user.getBirthday(), user.getCreditcard());
out.println("Sign Up page Successed<br><br>");


if(true) { // SignUp element is all full 
	out.println("<script>alert('ȸ������ �Ϸ�')</script>");
	out.println("<h2>TODO:ȸ������ ���� �� DB�� �� ���� Ȯ�����ִ� ������</h2><br><br>");

} else { // SignUp element has empty more than one
	out.println("<script>alert('ȸ������ ����')");
	out.println("document.location.href = '../View/SignUp.html';</script>");
}

%>


<hr>
<button type = "button" onclick = "document.location.href='../View/Login.html';">�α����ϱ�</button>

</body>
</html>