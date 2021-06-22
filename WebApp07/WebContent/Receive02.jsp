<%@page import="com.sun.image.codec.jpeg.TruncatedFileException"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor, eng, mat;
	kor=eng=mat=0;
	int tot=0;
	double avg=0;
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		tot = kor+eng+mat;
		avg = tot/3.0;
		
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
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">

	span {font-weight: bold; color: blue;}
</style>
</head>
<body>
<div>
	<h1>성적처리 결과</h1>
	<hr>
</div>

<div>
	<span><%=name %></span>님, 성적처리가 완료되었습니다. <br>
	회원님의 점수는 국어: <span><%=kor %></span>점,
	영어: <span><%=eng %></span>점,
	수학: <span><%=mat %></span>점입니다.<br>
	총점은 <span><%=tot %></span>점,
	평균은 <span><%=String.format("%.1f", avg)%></span>점 입니다.
</div>


</body>
</html>