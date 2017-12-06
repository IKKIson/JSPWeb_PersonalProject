<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="User.Model.*" %>    

<jsp:useBean id="user" class="User.Model.UserTable" scope="request" />
<jsp:setProperty property="*" name="user"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
UserDAO ud = new UserDAO();
UserTable newUser = ud.isLogin(user.getEmailid(), user.getPassword());

// 로그인 성공 실패 여부
if(newUser.isbLogin()){
	//response.sendRedirect("../View/Main.html");
	out.println("<script>alert('로그인 성공')");
	out.println("document.location.href = '../View/Main.html';</script>");
	
}
else{
	user=null;
	//response.sendRedirect("../View/Login.html");

	out.println("<script>alert('로그인 실패')");
	out.println("document.location.href = '../View/Login.html';</script>");
}
%>


</body>
</html>