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
<title>나의 예약 조회</title>
</head>
<body bgcolor="FFFF99">


<button type = "button" onclick = "document.location.href='../View/MyReservation.html';">뒤로가기</button>
<button type = "button" onclick = "document.location.href='../View/Main.html';">홈으로</button>
<br><br>

<%
for(int i = 0; i<reservationlist.size(); i++){	
	out.println("<br><hr>");
	out.println("예약 일련번호 : " + reservationlist.get(i).getReservatecode() + "<br>");
	out.println("예약자 계정 : " + reservationlist.get(i).getEmailid() + "<br>");
	out.println("방 종류 : " + reservationController.ConvertRoomTypeToRoomName(reservationlist.get(i).getRoomtype()) + "<br>");
	out.println("방 호수 : " + reservationlist.get(i).getRoomid() + "호 <br>");
	out.println("결재금액 : " + reservationlist.get(i).getPrice() + "<br>");
	out.println("결재 날짜 : " + reservationlist.get(i).getReservatedate() + "<br>");
	out.println("체크인 날짜 : " + reservationlist.get(i).getCheckin() + "<br>");
	out.println("체크아웃 날짜 : " + reservationlist.get(i).getCheckout() + "<br>");
	out.println("<hr><br>");
}
%>

<button type = "button" onclick = "document.location.href='../View/MyReservation.html';">뒤로가기</button>
<button type = "button" onclick = "document.location.href='../View/Main.html';">홈으로</button>

</body>
</html>