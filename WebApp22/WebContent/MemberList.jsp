<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%= cp%>/css/main.css">
<style type="text/css">

	td {text-align: center;}

</style>

</head>

<body>
<div>
	<h1>JSTL 코어(Core) 문제</h1>
	<h2>회원 명단</h2>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
			<%-- 자료구조 받을 때는 무조건 items으로 받는다 --%>
			<c:forEach var="dto" items="${lists }">
				<c:if test="${!empty dto.name || !empty dto.tel || !empty dto.addr}">
				<tr>
					<td> ${dto.name }</td>
					<td> ${dto.tel } </td>
					<td> ${dto.addr } </td>
				</tr>
				</c:if>
			</c:forEach>
	
	</table>

</div>

</body>
</html>