<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "DAO.*" %>  
<%@ page import = "Model.*" %>  
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat;"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ǿ���</title>
</head>
<body bgcolor="FFFF99">
<center>

<span style="font-weight: bold; font-size: 2em; line-height: 1.0em; color: 660000; font-family: arial; ">
���� ����
</span>
</center>

<%
ReservationTable reservationTable = null;

/*
	private int reservatecode;*
	private String emailid;*
	private int roomtype;*
	private int roomid;
	private int price;
	private String reservatedate;*
	private String checkin;
	private String checkout;
*/
//����
if(request.getParameter("rdoRoom") != null && request.getParameter("checkin") != null && request.getParameter("checkout") != null) {
		
	//1. input roomtype
	if(request.getParameter("rdoRoom").equals("���丮��")) {
		reservationTable.setRoomtype(1);
    } else if(request.getParameter("rdoRoom").equals("���� ���丮��")) {
    	reservationTable.setRoomtype(2);
    } else if(request.getParameter("rdoRoom").equals("Ʈ�� ���丮��")) {
    	reservationTable.setRoomtype(3);
    } else if(request.getParameter("rdoRoom").equals("�𷰽�")) {
    	reservationTable.setRoomtype(4);
    } else if(request.getParameter("rdoRoom").equals("�𷰽� Ǯ")) {
    	reservationTable.setRoomtype(5);
    } else if(request.getParameter("rdoRoom").equals("�̱���ť���")) {
    	reservationTable.setRoomtype(6);
    } else if(request.getParameter("rdoRoom").equals("����Ʈ")) {
    	reservationTable.setRoomtype(7);
    } else if(request.getParameter("rdoRoom").equals("�׷��� ����Ʈ")) {
    	reservationTable.setRoomtype(8);
    }
	//2. input Primary key- reservation code and reservationdate
	long time = System.currentTimeMillis(); 
	SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	String str = dayTime.format(new Date(time));
	int timecode = (int) time;
	reservationTable.setReservatecode(timecode);
	
	//3. input user emailid using session
	reservationTable.setEmailid(String.valueOf(session.getAttribute("sessionId")));
	
	//4. input room price using roomtypeDB's DAO
	
	//5. input room id using roomidDB's DAO and Random()
	
	//6. input checkin and checkout
	
	
	
	
	
} else {
	out.println("<script>alert('�������. ��Ȯ�� �Է����ּ���')");
	out.println("document.location.href = '../View/Reservation.html';</script>");
}
            
%>



</body>
</html>
