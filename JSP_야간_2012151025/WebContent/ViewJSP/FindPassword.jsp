<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "User.Model.*" %>  
<jsp:useBean id="emailid" class="User.Model.UserTable" scope="request" />
<jsp:setProperty property="*" name="emailid"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 찾기</title>
</head>
<body>
<%
UserDAO ud = new UserDAO();
//TODO : 입력값 제대로 안받아와짐, 입력값 검사 및 DB검사 구현해야되
if(!emailid.getEmailid().equals("")) {
	out.println("회원님의 비밀번호 입니다.<br><br>");
	out.println(ud.SelectFindPassword(emailid.getEmailid()));
} else { // SignUp element has empty more than one
	out.println("<script>alert('이메일을 정확히 입력해주세요')");
	out.println("document.location.href = '../View/FindPassword.html';</script>");
}
%>

</body>
</html>