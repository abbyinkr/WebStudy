<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	// 테이블 그릴 변수
	String str = "";


	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 조회 쿼리문 준비
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID";
	
	// 작업 객체 생성
	Statement stmt = conn.createStatement();
	
	// 쿼리문 수행
	ResultSet rs = stmt.executeQuery(sql);
	
	str += "<table><tr id='title'><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th></tr>";
	
	// ResultSet 처리
	while(rs.next())
	{
		str += "<tr>";
		
		str += "<td>" + rs.getInt("SID") + "</td>";
		str += "<td>" + rs.getString("NAME") + "</td>";
		str += "<td>" +  rs.getInt("KOR") + "</td>";
		str += "<td>" +  rs.getInt("ENG") + "</td>";
		str += "<td>" + rs.getInt("MAT") + "</td>";		
		str += "<td>" + rs.getInt("TOT") + "</td>";		
		str += "<td>" + String.format("%.1f", rs.getDouble("AVG")) + "</td>";	
		
		str += "</tr>";
		
	}
	rs.close();
	stmt.close();
	DBConn.close();
	
	str += "</table>";



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	
	input {width: 200px; }
	button {width: 300px; height: 40px; font-weight: bold; background-color: powderblue; color: white; border-radius: 10px; border-color: white;}
	.errMsg {font-size: small; color: blue; display: none; }
	#title {text-align: center;}
	th {background-color: powderblue; color: white; }
	
</style>

<script type="text/javascript">

	function formCheck()
	{
		
		var name = document.getElementById("userName");
		var nMsg = document.getElementById("nameMsg");
		
		nMsg.style.display = "none";
		
		if (name.value=="")
		{
			nMsg.style.display = "inline";
			return false;
		}
		
	}

</script>

</head>
<body>
<div>
	<h1>DB 연결 실습 01</h1>
	<hr>
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" name="userName" id="userName">
					<span class="errMsg" id="nameMsg">이름을 입력하세요</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" name="userKor" id="userKor">
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" name="userEng" id="userEng">
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" name="userMat" id="userMat">
				</td>
			</tr>
		</table>
		<button type="submit" id="btnAdd" class="btn">성적 추가</button>
	</form>
	<br><br>
</div>

<div>
	<%=str %>
</div>


</body>
</html>