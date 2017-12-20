<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "DAO.*" %>  
<%@ page import = "Model.*" %>  
<%@ page import = "Controller.*" %>  
<%@ page import = "java.util.*" %> 

<jsp:useBean id="reservation" class="Model.ReservationTable" scope="request" />
<jsp:setProperty property="reservatecode" name="reservation"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
ReservationDAO reservationDAO = new ReservationDAO();
%>

<%
if(request.getParameter("rdoRoom") != null && session.getAttribute("sessionId") != null && reservation.getReservatecode() > 0) {
	ReservationTable reservationTable = new ReservationTable();
	
	if(request.getParameter("rdoRoom").equals("1")) {
		reservationTable.setRoomtype(1);
	} else if(request.getParameter("rdoRoom").equals("2")) {
		reservationTable.setRoomtype(2);
	} else if(request.getParameter("rdoRoom").equals("3")) {
		reservationTable.setRoomtype(3);
	} else if(request.getParameter("rdoRoom").equals("4")) {
		reservationTable.setRoomtype(4);
	} else if(request.getParameter("rdoRoom").equals("5")) {
		reservationTable.setRoomtype(5);
	} else if(request.getParameter("rdoRoom").equals("6")) {
		reservationTable.setRoomtype(6);
	} else if(request.getParameter("rdoRoom").equals("7")) {
		reservationTable.setRoomtype(7);
	} else if(request.getParameter("rdoRoom").equals("8")) {
		reservationTable.setRoomtype(8);
	}
	
	reservationDAO.UpdateMyReservation(reservation.getReservatecode(), reservationTable.getRoomtype());
	out.println("<script>alert('예약 변경 성공')");
	out.println("document.location.href = '../View/Main.html';</script>");

}  else {
	out.println("<script>alert('예약 변경 실패')");
	out.println("document.location.href = '../View/MyReservation.html';</script>");
	reservation = null;
}
%>

</body>
</html>