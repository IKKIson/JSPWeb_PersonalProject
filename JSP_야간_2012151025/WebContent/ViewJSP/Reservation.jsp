<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "DAO.*" %>  
<%@ page import = "Model.*" %>  
<%@ page import="Controller.ReservationController"%>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat"%>  

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>객실예약</title>
</head>
<body bgcolor="FFFF99">

<%
 if(request.getParameter("rdoRoom") != null && request.getParameter("checkin") != null && request.getParameter("checkout") != null) {
	 ReservationTable reservationTable = new ReservationTable();
	//2
	long time = System.currentTimeMillis(); 
	SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	String str = dayTime.format(new Date(time));
	int timecode = (int) time;
	//4
	RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
	//5
	ReservationController controller = new ReservationController();
	//6
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
	//fin
	ReservationDAO reservationDAO = new ReservationDAO();
	int reserveCode = 0;
	
	//1. input roomtype
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
	
	//2. input Primary key- reservation code and reservationdate
	reservationTable.setReservatecode(timecode);
	reservationTable.setReservatedate(str);
	
	//3. input user emailid using session
	reservationTable.setEmailid(String.valueOf(session.getAttribute("sessionId")));
	
	//4. input room price using roomtypeDB's DAO
	reservationTable.setPrice(roomTypeDAO.SelectRoomPrice(reservationTable.getRoomtype()));

	
 	//5. input room id using roomlistDB's DAO with Random Method in Controller
	reservationTable.setRoomid(controller.ChooseRoomId(reservationTable.getRoomtype()));
	
	//6. input checkin and checkout
	//String checkinDate = dateFormat.format(new Date(Integer.parseInt(request.getParameter("checkin"))));
	//String checkOutDate = dateFormat.format(new Date(Integer.parseInt(request.getParameter("checkout"))));
	String checkinDate = request.getParameter("checkin");
	String checkOutDate = request.getParameter("checkout");
	reservationTable.setCheckin(checkinDate);
	reservationTable.setCheckout(checkOutDate);

	
	 //Final - insert these in DB 
	reservationDAO.InsertReservation(
			reservationTable.getReservatecode(), 
			reservationTable.getEmailid(), 
			reservationTable.getRoomtype(), 
			reservationTable.getRoomid(), 
			reservationTable.getPrice(), 
			reservationTable.getReservatedate(), 
			reservationTable.getCheckin(), 
			reservationTable.getCheckout());
	
	//out.println("<script>alert('예약정보 저장환료. 결제창으로 이동합니다.')</script>");
	reserveCode = reservationTable.getReservatecode();
 	session.setAttribute("Reservation", reserveCode);
	response.sendRedirect("ReservationPayment.jsp");

} else {
	out.println("<script>alert('예약실패. 정확히 입력해주세요')");
	out.println("document.location.href = '../View/Reservation.html';</script>");
}
            
%>



</body>
</html>
