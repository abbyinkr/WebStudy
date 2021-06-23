<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="guest" class="com.test.GuestDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="guest"></jsp:setProperty>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>간단한 기본 방명록 작성 실습(DB연동 없음)</h1>
	<hr>
</div>

<div>
	<h2>작성된 내용 확인</h2>
	<h3>이름 : <%=guest.getUserName() %></h3>
	<h3>제목 : <%=guest.getTitle() %></h3>
	<h3>내용 : <%=guest.getContent().replaceAll("\n", "<br>") %></h3>
	<!-- textarea 개행 주의~!!! -->
</div>


</body>
</html>