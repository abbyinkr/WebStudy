<%@page import="com.test.ScoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.ScoreDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
	
	String scoreCount = "<span>전체 인원 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		scoreCount += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th>");
		str.append("<th>국어점수</th><th>영어점수</th><th>수학점수</th>");
		str.append("<th>총점</th><th>평균</th></tr>");
	
		
		// ScoreDAO 객체의 lists() 메소드 호출
		// -- 반복문을 통해 <table> 하위 엘리먼트 생성
		for (ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + score.getSid() + "</td>");
			str.append("<td class='record'>" + score.getName() + "</td>");
			str.append("<td class='record'>" + score.getKor() + "</td>");
			str.append("<td class='record'>" + score.getEng() + "</td>");
			str.append("<td class='record'>" + score.getMat() + "</td>");
			str.append("<td class='record'>" + score.getTot() + "</td>");
	   	  	double avg = Double.parseDouble(score.getAvg());
	      	str.append("<td class='record'>" + String.format("%.1f",avg) + "</td>");
			str.append("</tr>");
			
		}
		str.append("</table>");
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	} 



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SampleTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.errMsg {color: red; font-size: small; display:none; }
	.record {text-align: center;}

</style>

<script type="text/javascript">

	function formCheck()
	{

		var uName = document.getElementById("userName");
		var uKor = document.getElementById("scoreKor");
		var uEng = document.getElementById("scoreEng");
		var uMat = document.getElementById("scoreMat");
		
		var nameMsg = document.getElementById("nameMsg");
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if (uName.value =="")
		{
			nameMsg.style.display = "inline";
			uName.focus();
			return false;
		}
		
		// 값이 입력안되어잇거나, 숫자가 아니거나, 0보다 작거나, 100보다 크거나
		if (uKor.value == "" || isNaN(uKor.value) 
				|| Number(uKor.value)<0 || Number(uKor.value)>100 )
		{
			korMsg.style.display = "inline";
			uKor.focus();
			return false;
		}
		if (uEng.value == "" || isNaN(uEng.value) 
				|| Number(uEng.value)<0 || Number(uEng.value)>100 )
		{
			engMsg.style.display = "inline";
			uEng.focus();
			return false;
		}
		if (uMat.value == "" || isNaN(uMat.value) 
				|| Number(uMat.value)<0 || Number(uMat.value)>100 )
		{
			matMsg.style.display = "inline";
			uMat.focus();
			return false;
		}
		
		return true;
		
	}


</script>


</head>
<body>
<div>
	<h1>성적 처리 시스템</h1>
	<hr>
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th style="width: 80px;">이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="scoreKor" name="scoreKor">
					<span class="errMsg" id="korMsg">0 ~ 100 사이의 점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="scoreEng" name="scoreEng">
					<span class="errMsg" id="engMsg">0 ~ 100 사이의 점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="scoreMat" name="scoreMat">
					<span class="errMsg" id="matMsg">0 ~ 100 사이의 점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: left;">
					<input type="submit" value="성적 추가" class="btn"
					style="width: 300px; height: 50px; font-weight: bold;">
				</td>
			</tr>
		</table>
	</form>
</div>

<div>

	<p><%=scoreCount %></p>
	<p><%=str.toString() %></p>
	
</div>

</body>
</html>