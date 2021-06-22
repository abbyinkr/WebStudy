<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8");
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	String op = request.getParameter("operator");
	int su1, su2;
	su1=su2=0;
	//Double result=0.0;
	String result="";
	
	try
	{
		su1 = Integer.parseInt(s1);
		su2 = Integer.parseInt(s2);
		
		if(op.equals("+"))
			result = String.valueOf(su1+su2);
		else if(op.equals("-"))
			result = String.valueOf(su1-su2);
		else if(op.equals("*"))
			result = String.valueOf(su1*su2);
		else if(op.equals("/"))
			//result = String.valueOf(su1/(double)su2);
			result = String.format("%.1f", (su1/(double)su2));
		
		
		/*
 		if(op.equals("+"))
			result = (double)su1+su2;
		else if(op.equals("-"))
			result = (double)su1-su2;
		else if(op.equals("*"))
			result = (double)su1*su2;
		else if(op.equals("/"))
			result = (double)su1/su2; 
		*/
 		
 		
 		
		
	}
	catch(Exception e)
	{
		System.out.println();		
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>연산 결과</h1>
	<hr>
</div>

<div>
	입력하신 <%=su1 %>와 <%=su2 %>의 연산 결과는 <%=result %> 입니다.
	

</div>


</body>
</html>