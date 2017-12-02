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

<h1>객실 안내</h1><hr><br><br>

<%
RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
ArrayList<RoomTypeTable> roomTypelist = roomTypeDAO.selectAllRoomType();
out.println("객실종류 수 : " + roomTypelist.size());
out.println("객실종류 수 : " + roomTypeDAO.selectAllRoomType().size());

for(int i = 0; i<roomTypelist.size(); i++){
	out.print(roomTypelist.get(i).getRoomtype() + ". ");
	out.println(roomTypelist.get(i).getRoomname());
	out.println("* 수용인원 : " + roomTypelist.get(i).getCapacity());
	out.println("* 1박 가격 : " + roomTypelist.get(i).getPrice());
	out.println("* 객실 수 : " + roomTypelist.get(i).getAmount());
	out.println("**" + roomTypelist.get(i).getExplanation());
}
%>


</body>
</html>