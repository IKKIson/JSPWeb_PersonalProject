<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "DAO.*" %>  
<%@ page import = "Model.*" %>  
<%@ page import = "Controller.*" %>  
<%@ page import = "java.util.*" %> 

<jsp:setProperty property="*" name="user"/>


<%
ReservationDAO reservationDAO = new ReservationDAO();
ArrayList<ReservationTable> reservationlist = reservationDAO.SelectCheckMyReservation(session.getAttribute("sessionId").toString());
ReservationController reservationController = new ReservationController();
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� ��ȸ</title>
</head>
<body bgcolor="FFFF99">


<button type = "button" onclick = "document.location.href='../View/MyReservation.html';">�ڷΰ���</button>
<button type = "button" onclick = "document.location.href='../View/Main.html';">Ȩ����</button>
<br><br>

<%
for(int i = 0; i<reservationlist.size(); i++){	
	out.println("<br><hr>");
	out.println("���� �Ϸù�ȣ : " + reservationlist.get(i).getReservatecode() + "<br>");
	out.println("������ ���� : " + reservationlist.get(i).getEmailid() + "<br>");
	out.println("�� ���� : " + reservationController.ConvertRoomTypeToRoomName(reservationlist.get(i).getRoomtype()) + "<br>");
	out.println("�� ȣ�� : " + reservationlist.get(i).getRoomid() + "ȣ <br>");
	out.println("����ݾ� : " + reservationlist.get(i).getPrice() + "<br>");
	out.println("���� ��¥ : " + reservationlist.get(i).getReservatedate() + "<br>");
	out.println("üũ�� ��¥ : " + reservationlist.get(i).getCheckin() + "<br>");
	out.println("üũ�ƿ� ��¥ : " + reservationlist.get(i).getCheckout() + "<br>");
	out.println("<hr><br>");
}
%>

<button type = "button" onclick = "document.location.href='../View/MyReservation.html';">�ڷΰ���</button>
<button type = "button" onclick = "document.location.href='../View/Main.html';">Ȩ����</button>

</body>
</html>