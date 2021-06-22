<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 선생님 풀이
	// 이전페이지(Send04.html)로부터 데이터 수신
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String userGender = request.getParameter("userGender");
	String userLoc = request.getParameter("userLoc");

	// check~!! (배열)
	String[] userSubject = request.getParameterValues("checkGroup");
	
	String subject= "";
	
	// 배열로 수신할 때는 null 체크!
	if(userSubject != null)
	{
		for(int i=0; i<userSubject.length; i++)
		{
			subject += " [" + userSubject[i].toString() + "] ";
		}
	}
	
	// ※ 추후에는 수신된 데이터를 쿼리문을 통해 DB 에 입력하는
	//    과정 등이 포함될 것임을 염두하며 작업을 진행할 수 있도록 하자.
	
	
	/* 	
	// 한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	String userGender = request.getParameter("userGender");
	
	String userLoc = request.getParameter("userLoc");
	String[] subjects = request.getParameterValues("checkGroup");
	String subject="";
	
	try
	{
		for(int i=0; i<subjects.length; i++)
			subject += subjects[i] + " ";
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	} 
	*/
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>

<div>
	<h2>가입 승익 내역</h2>
	<p>아이디 : <%=userId %> </p> 
	<p>패스워드 : <%=userPwd %></p>
	<p>이름 : <%=userName %> </p>
	<p>전화번호 : <%=userTel %> </p>
	<p>성별 : <%=userGender %> </p>
	<p>지역 : <%=userLoc %> </p>
	<p>수강과목 : <%=subject %> </p>


</div>


</body>
</html>