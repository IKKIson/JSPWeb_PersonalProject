<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<body bgcolor="FFFF99">
<center>

<span style="font-weight: bold; font-size: 2em; line-height: 1.0em; color: 660000; font-family: arial; ">
객실 예약
</span>
</center>

객실 종류 : <input type = "text" name = "email" width = "50"><br><br>
<input type="radio" name="chk_info" value="수페리어">수페리어
<br>
<input type="radio" name="chk_info" value="더블 수페리어">더블 수페리어
<br>
<input type="radio" name="chk_info" value="트윈 수페리어">트윈 수페리어
<br>
<input type="radio" name="chk_info" value="디럭스">디럭스
<br>
<input type="radio" name="chk_info" value="디럭스 풀">디럭스 풀
<br>
<input type="radio" name="chk_info" value="이그제큐디브">이그제큐디브
<br>
<input type="radio" name="chk_info" value="스위트">스위트
<br>
<input type="radio" name="chk_info" value="그랜드 스위트">그랜드 스위트
<br>

객실 호수(층): <input type = "password" name = "password" width = "50"><br><br>

<jsp:forward page="Calendar.jsp">
<jsp:param value="조희" name="date"/>
체크인 <br>
체크아웃 <br>
<br><br>
	
<hr>
<input type = "reset" value = "취소" onclick = "document.location.href='../View/Main.html';"/>

</body>
</html>