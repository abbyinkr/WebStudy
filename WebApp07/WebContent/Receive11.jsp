<%@ page contentType="text/html; charset=UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	// request.getAttribute() : Object 타입 반환 → String 으로 다운캐스팅
	String result = (String)request.getAttribute("result");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive11.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>

<div>
	<!-- 클라이언트에게 보여지는 주소창에서는 .../Forward11.jsp 이지만.. 실제 내용은 Receive11(하림이) -->
	<h2>최종 수신 페이지(Receive11.jsp)</h2>
	<h2>정수 1 : <%=num1 %></h2>
	<h2>정수 2 : <%=num2 %></h2>
	<h2>연산 결과 : <%=result %></h2>

</div>


</body>
</html>