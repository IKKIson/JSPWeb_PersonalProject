<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "DAO.*" %>  
<%@ page import = "Model.*" %>  
<%@ page import = "Controller.*" %>  
<%@ page import = "java.util.*" %> 

<jsp:useBean id="reservation" class="Model.ReservationTable" scope="request" />
<jsp:setProperty property="reservatecode" name="reservation"/>

<%
ReservationDAO reservationDAO = new ReservationDAO();
ReservationController reservationController = new ReservationController();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
if(reservationDAO.DeleteReservation(session.getAttribute("sessionId").toString(), reservation.getReservatecode())) {
	out.println("<script>alert('예약 취소 성공')");
	out.println("document.location.href = '../View/Main.html';</script>");
} else {
	out.println("<script>alert('예약 취소 실패')");
	out.println("document.location.href = '../View/MyReservation.html';</script>");
	reservation = null;
}
%>


</body>
</html>