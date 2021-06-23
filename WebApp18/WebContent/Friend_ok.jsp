<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// 한글 깨짐 방지
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.test.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!-- 반복문 필요(다중 선택으로 넘어온 결과값 처리) -->

<%
	String str = "";
	
	// 배열로 넘어온 데이터는 null 체크!
	if(ob.getLover() != null)
	{
		for(String boy : ob.getLover())
			str += "[" + boy + "] ";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>데이터 수신</h1>
	<hr>
</div>

<div>
	<h2>이름: <%=ob.getUserName() %></h2>
	<h2>나이: <%=ob.getUserAge() %></h2>
	<h2>성별: <%=ob.getGender() %></h2>
	<h2>이상형: <%=str %></h2>
</div>


</body>
</html>