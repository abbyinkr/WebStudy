<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 이전 페이지(SendAndReceive06.jsp - 자기자신)로부터 데이터 수신
	String temp = request.getParameter("userinput");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SandAndReceive06.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 06</h1>
	<hr>
</div>

<div>
	<!-- 
		※ form 의 action 속성을 『action=""』 과 같이 구성하면
		   페이지 요청 및 데이터 전송에 대한 수신처는 자기 자신
		※ form 의 action 속성을 생략하여 『<form method="post">』
		   와 같이 구성하더라도 페이지 요청 및 데이터 전송에 대한
		   수신처는 자기 자신
    -->
	<form method="post">
		입력
		<input type="text" id="userInput" name="userinput">
		<br>
		
		<button type="submit" class="btn">테스트</button>
		<button type="reset" class="btn">취소</button>
	
	</form>
</div>

<div>
	<h2>수신된 데이터 : <%=temp %></h2>
</div>


</body>
</html>