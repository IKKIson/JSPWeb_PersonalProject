<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "DAO.*" %>  
<%@ page import = "Model.*" %>  
<%@ page import = "Controller.*" %>  
<%@ page import = "java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<center>
<span style="font-weight: bold; font-size: 2em; line-height: 1.0em; color: 660000; font-family: arial; ">
����Ϸ�
</span>
<h1>�̿����ּż� �����մϴ�.</h1>
<hr><br>
</center>

<%
	int reserveCode = Integer.parseInt(request.getParameter("reserveCode"));
	ReservationDAO reservationDAO = new ReservationDAO();
	ReservationTable reservationTable = reservationDAO.SelectCheckReceipt(reserveCode);
	ReservationController reservationController = new ReservationController();
	
	out.println("���� �Ϸù�ȣ : " + reservationTable.getReservatecode() + "<br>");
	out.println("������ ���� : " + reservationTable.getEmailid() + "<br>");
	out.println("�� ���� : " + reservationController.ConvertRoomTypeToRoomName(reservationTable.getRoomtype()) + "<br>");
	out.println("�� ȣ�� : " + reservationTable.getRoomid() + "ȣ <br>");
	out.println("����ݾ� : " + reservationTable.getPrice() + "<br>");
	out.println("���� ��¥ : " + reservationTable.getReservatedate() + "<br>");
	out.println("üũ�� ��¥ : " + reservationTable.getCheckin() + "<br>");
	out.println("üũ�ƿ� ��¥ : " + reservationTable.getCheckout() + "<br>");
	out.println("<br>");
%>
<hr><br>

<button type = "button" onclick = "document.location.href='../View/Main.html';">Ȩ����</button>

</body>
</html>