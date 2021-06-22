<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿 영역(자바코드)
	// 이전 페이지(Gugudan.jsp)로부터 데이터 수신
	// request 객체의 getParameter() 메소드 활용 → 이름(name) 식별자
	String danStr = request.getParameter("dan");
	
	// 누적곱 sum = 1 로 초기화
	int sum = 1; 
	String result = "";
	
	response.setContentType("text/html; charset=UTF-8");
	try
	{
		int dan = Integer.parseInt(danStr);
		for(int i=1; i<=9; i++)
		{
			sum = dan * i;
			result += String.format("%3d * %3d = %5d", dan, i, sum) + "<br>";
			
		}
		
	}catch(Exception e)
	{
		// 서버 콘솔에 예외 처리 출력
		System.out.println(e.toString());
		
		// 예외발생시 에러 로그에 기록남기기
		getServletContext().log("오류 : " + e.toString());
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<div>
		<h1>JSP를 이용한 데이터 송수신 실습</h1>
		<hr>
		<p>Gugudan.jsp → Gugudan_ok.jsp ●</p>
	</div>

	<div>
		<h2>결과<br> <%=result %></h2>

	</div>
	<%-- html 주석문은 서블릿컨테이너 눈에 보이지만 JSP 주석문은 서블릿 컨테이너 눈에 안보인다. 
	     JSP 컨테이너는 존재하지않는다.
	     시중 책에서 말하는 JSP 컨테이너는 서블릿컨테이너를 말한다.
	     서블릿 컨테이너 == JSP 컨테이너 이다. 따라서 JSP 주석문은 서블릿 컨테이너한테 보이지 않는다. --%>
	<!-- html 주석문 --> 
	<%-- JSP 주석문 --%>

	
	


</body>
</html>