<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");
	
	// 데이터 수신(TestSession01.jsp 페이지로부터...)
	// → userName, userBirthDay

	String userName = request.getParameter("userName");
	String userBirthDay = request.getParameter("userBirthDay");
	
	session.setAttribute("userName", userName);
	session.setAttribute("userBirthDay", userBirthDay);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">


	function sendIt()
	{
		var f = document.forms[0];
		
		if(!f.userId.value)
		{
			alert("아이디 입력~!!");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("패스워드 입력~!!");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
		
	}

</script>

</head>
<body>

<div>
	<h1>아이디와 패스워드(TestSession02.jsp)</h1>
	<hr>
</div>

<div>
	<form action="TestSession03.jsp" method="post">
		<%-- JSP 주석처리로 해야한다 --%>
		<%-- 
		<input type="hidden" name="userName" value="<%=userName%>">
		<input type="hidden" name="userBirhDay" value="<%=userBirthDay%>">
		--%>
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="text" name="userPwd">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="sendIt()" 
					style="width: 300px;">다음 페이지로 전송</button>
					<button type="reset" class="btn" style="width: 300px;">취소</button>
				</td>
			</tr>
		</table>
		
	</form>
</div>


</body>
</html>