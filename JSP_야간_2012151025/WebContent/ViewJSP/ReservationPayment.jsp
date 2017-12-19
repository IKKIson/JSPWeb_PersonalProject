<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import = "DAO.*" %>  
<%@ page import = "Model.*" %>  
<%@ page import = "Controller.*" %>  
<%@ page import = "java.util.*" %>

<%
int reserveCode = Integer.valueOf(request.getAttribute("Reservation").toString());

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<center>
<span style="font-weight: bold; font-size: 2em; line-height: 1.0em; color: 660000; font-family: arial; ">
예약완료
</span>
<h1>이용해주셔서 감사합니다.</h1>
<hr><br>
</center>

<%
	ReservationDAO reservationDAO = new ReservationDAO();
	ReservationTable reservationTable = reservationDAO.SelectCheckReceipt(reserveCode);
	ReservationController reservationController = new ReservationController();
	
	out.println("예약 일련번호 : " + reservationTable.getReservatecode() + "<br>");
	out.println("예약자 계정 : " + reservationTable.getEmailid() + "<br>");
	out.println("방 종류 : " + reservationController.ConvertRoomTypeToRoomName(reservationTable.getRoomtype()) + "<br>");
	out.println("방 호수 : " + reservationTable.getRoomid() + "호 <br>");
	out.println("결재금액 : " + reservationTable.getPrice() + "<br>");
	out.println("결재 날짜 : " + reservationTable.getReservatedate() + "<br>");
	out.println("체크인 날짜 : " + reservationTable.getCheckin() + "<br>");
	out.println("체크아웃 날짜 : " + reservationTable.getCheckout() + "<br>");
	out.println("<br>");
%>
<hr><br>

<button type = "button" onclick = "document.location.href='../View/Main.html';">홈으로</button>

</body>
</html>