<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");
	
	String userName = (String)session.getAttribute("userName");
	String userBirthDay = (String)session.getAttribute("userBirthDay");
	
	// 변수에 값을 담았기 때문에 removeAtribute 가능하다.
	session.removeAttribute("userName");
	session.removeAttribute("userBirhDay");
	
	// hidden Element 로 값 얻어낼 시...
	//String userName = request.getParameter("userName");
	//String userBirthDay = request.getParameter("userBirhDay");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>TestSession03.jsp</h1>
	<hr>
</div>

<div>
		<table class="table">
			<tr>
				<th>이름</th>
				<td><%=userName %></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><%=userBirthDay %></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><%=userId %></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><%=userPwd %></td>
			</tr>
			
		</table>
</div>


</body>
</html>