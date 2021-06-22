<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 스크립트 릿 영역 (자바코드)
	
	/*
	
	// 이전페이지 데이터 수신
	String tdStr = request.getParameter("su1"); // td 수
	String trStr = request.getParameter("su2"); // tr 수
	int td, tr;
	td=tr=0;
	String table="";
	
	try
	{
		td = Integer.parseInt(tdStr);
		tr = Integer.parseInt(trStr);
		
		tdStr=trStr="";
		for(int j=0; j<tr; j++)
		{
			trStr+="<tr>";     
			tdStr="";
			for(int i=0; i<td; i++)
				tdStr += "<td>"+ (i+1) +"</td>";  
			trStr += tdStr + "</tr>";				
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	*/
	

	// 선생님 풀이
	String s1 = request.getParameter("su1");
	String s2 = request.getParameter("su2");
	
	// 바로 형변환하지말고 문자타입으로 받고 형변환하기.
	
	int n1=0;
	int n2=0;
	// 테이블에서 1씩 증가시켜 나갈 변수 선언 및 초기화
	int n=0;
	try
	{
		//수신된 데이터 형 변환
		n1 = Integer.parseInt(s1);
		n2 = Integer.parseInt(s2);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>Table.jsp  → Table_ok.jsp ●</p>
</div>

<div>
	<h2>테이블 생성</h2>
	<table border="1">
	
	<%
	for(int i=0; i<n2; i++)
	{
	%>
		<tr>
		<% 
		for(int j=0; j<n1; j++)
		{
		%>
			<td style="width:50px;"><%=++n %></td>
		<%
		}
		%>
		
		</tr>
	
	<%
	}
	%>
	
	</table>
	
	<h3>스크립트 릿으로 HTML 테이블 그리기 연습</h3>
	<table border="1">
	<%
	for(int i=0; i<n2; i++)
	{%>
		<tr>
		<%
		for(int j=0; j<n1; j++)
		{ 
		%>
			<td style="width: 50px;"><%=++n %></td>
		<%
		}
		%>
		</tr>
	<%
	} 
	%>
	
	</table>
	
	
	<%-- 
	<table  style='border: 1px solid; width:300px'>
	<%=trStr %>
	</table>
     --%>
	
	
</div>


</body>
</html>