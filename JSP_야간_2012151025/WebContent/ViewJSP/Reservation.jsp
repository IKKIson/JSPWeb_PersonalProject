<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<body bgcolor="FFFF99">
<center>

<span style="font-weight: bold; font-size: 2em; line-height: 1.0em; color: 660000; font-family: arial; ">
���� ����
</span>
</center>

���� ���� : <input type = "text" name = "email" width = "50"><br><br>
<input type="radio" name="chk_info" value="���丮��">���丮��
<br>
<input type="radio" name="chk_info" value="���� ���丮��">���� ���丮��
<br>
<input type="radio" name="chk_info" value="Ʈ�� ���丮��">Ʈ�� ���丮��
<br>
<input type="radio" name="chk_info" value="�𷰽�">�𷰽�
<br>
<input type="radio" name="chk_info" value="�𷰽� Ǯ">�𷰽� Ǯ
<br>
<input type="radio" name="chk_info" value="�̱���ť���">�̱���ť���
<br>
<input type="radio" name="chk_info" value="����Ʈ">����Ʈ
<br>
<input type="radio" name="chk_info" value="�׷��� ����Ʈ">�׷��� ����Ʈ
<br>

���� ȣ��(��): <input type = "password" name = "password" width = "50"><br><br>

<jsp:forward page="Calendar.jsp">
<jsp:param value="����" name="date"/>
üũ�� <br>
üũ�ƿ� <br>
<br><br>
	
<hr>
<input type = "reset" value = "���" onclick = "document.location.href='../View/Main.html';"/>

</body>
</html>