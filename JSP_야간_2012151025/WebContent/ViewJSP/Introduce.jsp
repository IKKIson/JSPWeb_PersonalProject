<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "Room.Model.*" %>  
<%@ page import = "java.util.*" %>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>���� �ȳ�</h1><hr><br><br>

<%
RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
ArrayList<RoomTypeTable> roomTypelist = roomTypeDAO.selectAllRoomType();
out.println("�������� �� : " + roomTypelist.size());
out.println("�������� �� : " + roomTypeDAO.selectAllRoomType().size());

for(int i = 0; i<roomTypelist.size(); i++){
	out.print(roomTypelist.get(i).getRoomtype() + ". ");
	out.println(roomTypelist.get(i).getRoomname());
	out.println("* �����ο� : " + roomTypelist.get(i).getCapacity());
	out.println("* 1�� ���� : " + roomTypelist.get(i).getPrice());
	out.println("* ���� �� : " + roomTypelist.get(i).getAmount());
	out.println("**" + roomTypelist.get(i).getExplanation());
}
%>


</body>
</html>