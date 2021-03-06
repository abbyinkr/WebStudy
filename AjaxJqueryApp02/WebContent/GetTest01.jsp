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
<title>GetTest01.jsp</title>
<link rel="stylesheet" type="txt/css" href="css/main.css">
<style type="text/css">
	.txtNum
	{
		width:100px;
		text-align: right;
	}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendButton").click(function()
		{
			var su1 = $("#su1").val();
			var su2 = $("#su2").val();
			var oper = $("#oper").val();
			
			// ○ 『$.get(url, data, callBack)』 
			//     - 매개변수로 전달받은 URL을 사용하여
			//       서버에 대한 GET 요청을 전송한다.
			

			// $.get("요청 URL", {이름:값}, function(넘겨받은 값){$(선택자).html(값));});	
			$.get("GetTest01_ok.jsp"
			, {su1:su1, su2:su2, oper:oper} 
			, function(args) //--서버에서 가져온 데이터를 콜백함수의 매개변수로 넘겨준다.
			{
				$("#result").html(args);
			});
			// url → 경로 포함 요청 페이지
			// data → {이름:값, 이름:값, 이름:값, ... }
			// callBack → 기능 → 함수
			
			
		});
		
	});


</script>

</head>
<body>

<div>
	<h1>jQuery의 get() 메소드 실습</h1>
	<hr>
</div>

<div>
	<input type="text" id="su1" class="txt txtNum">
	<select name="" id="oper">
		<option value="add">덧셈</option>
		<option value="sub">뺄셈</option>
		<option value="mul">곱셈</option>
		<option value="div">나눗셈</option>
	</select>
	
	<input type="text" id="su2" class="txt txtNum" />
	<input type="button" value=" = " id="sendButton" class="btn">
</div>
<br>

<div id="result">

</div>

</body>
</html>