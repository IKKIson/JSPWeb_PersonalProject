<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "DAO.*" %>  
<%@ page import = "Model.*" %>  
<%@ page import = "java.util.*" %>  
<%
RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
ArrayList<RoomTypeTable> roomTypelist = roomTypeDAO.selectAllRoomType();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>호텔객식안내</title>
</head>
<body bgcolor="FFFF99">
<span style="font-weight: bold; font-size: 2em; line-height: 1.0em; color: 660000; font-family: arial; ">
객실안내
</span>
<hr><br>
<button type = "button" onclick = "document.location.href='../View/Introduce.html';">뒤로가기</button>
<button type = "button" onclick = "document.location.href='../View/Main.html';">홈으로</button>
<hr><br>
<%
for(int i = 0; i<roomTypelist.size(); i++){
	out.print("<hr>" + roomTypelist.get(i).getRoomtype() + ". ");
	out.println(roomTypelist.get(i).getName() + "<br><br>");
	out.println("* 수용인원 : " + roomTypelist.get(i).getCapacity()+ "<br>");
	out.println("* 1박 가격 : " + roomTypelist.get(i).getPrice()+ "<br>");
	out.println("* 객실 수 : " + roomTypelist.get(i).getAmount()+ "<br>");
	out.println("**" + roomTypelist.get(i).getExplanation()+ "<br><hr><br>");
}
%>

<button type = "button" onclick = "document.location.href='../View/Introduce.html';">뒤로가기</button>
<button type = "button" onclick = "document.location.href='../View/Main.html';">홈으로</button>

</body>
</html>