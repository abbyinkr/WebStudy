<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	// input 에 입력된 정수 값 가져오기 (num)
	String sNum1 = request.getParameter("num1");
	String sNum2 = request.getParameter("num2");
	
	// 셀렉스 박스의 value 값 가져오기
	String op = request.getParameter("calResult");
	
	String result ="";
	
	try
	{
		int num1 = Integer.parseInt(sNum1);
		int num2 = Integer.parseInt(sNum2);
		
		if(op.equals("1"))
			result = String.format("%d + %d = %d", num1, num2, (num1+num2));
		else if(op.equals("2"))		
			result = String.format("%d - %d = %d", num1, num2, (num1-num2));
		else if(op.equals("3"))		
			result = String.format("%d * %d = %d", num1, num2, (num1*num2));
		else if(op.equals("4"))		
		 	result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));
		
		
	}
	catch(Exception e)	
	{
		System.out.println(e.toString());
	}
	
	// 객체형식으로 Receive11 에 넘겨준다.
	request.setAttribute("result", result);
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward11.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>

	<!-- ※ 포워드 -->
	<jsp:forward page="Receive11.jsp"></jsp:forward>




</body>
</html>