<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "User.Model.*" %>  
<jsp:useBean id="emailid" class="User.Model.UserTable" scope="request" />
<jsp:setProperty property="*" name="emailid"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ ã��</title>
</head>
<body>
<%
UserDAO ud = new UserDAO();
//TODO : �Է°� ����� �ȹ޾ƿ���, �Է°� �˻� �� DB�˻� �����ؾߵ�
if(!emailid.getEmailid().equals("")) {
	out.println("ȸ������ ��й�ȣ �Դϴ�.<br><br>");
	out.println(ud.SelectFindPassword(emailid.getEmailid()));
} else { // SignUp element has empty more than one
	out.println("<script>alert('�̸����� ��Ȯ�� �Է����ּ���')");
	out.println("document.location.href = '../View/FindPassword.html';</script>");
}
%>

</body>
</html>