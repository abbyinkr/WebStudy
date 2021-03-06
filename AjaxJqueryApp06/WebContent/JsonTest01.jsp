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
<title>JsonTest01.jsp</title>
<link rel="stylesheet" type="txt/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
	
	$(function()
	{
		$("#sendBtn").click(function()
		{
			var params = "name=" + $("#name").val()
				+ "&content=" + $("#content").val();
			
			$.ajax(
			{
				type : "POST"
				, url : "JsonTest01_ok.jsp"
				, data : params
				, dataType : "json"			// check~!!
				, success : function(jsonObj)
				{
					var out = "";
					
					var num = jsonObj.num;
					var name = jsonObj.name;
					var content = jsonObj.content;
					
					out += "<br>==================";
					out += "<br>번호 : " + num;
					out += "<br>이름 : " + name;
					out += "<br>내용 : " + content;
					out += "<br>==================<br>";
					
					$("#result").html(out);
					
					// 입력된 내용 클리어 및 name 입력칸 포커스
					$("#name").val();
					$("#content").val();
					$("#name").focus();
					
				}
				, beforeSend : showRequest
	            , error : function(e)
	            {
	               alert(e.responseText);   // 클라이언트 쪽에서 확인 가능
	            }
				
			});
		});
	});
	
	function showRequest()
	{
		if (!$("#name").val())
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			return false;
		}
		
		if (!$("#content").val())
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			return false;
		}
		return true;
	}

</script>

<body>

<div>
	<h1>jQuery의 ajax() 메소드 실습</h1>
	<p>json control</p>
	<hr />
</div>

<div>
	이름 : <input type="text" id="name" class="txt" /><br />
	내용 <br>
	<textarea id="content" cols="50" rows="3"></textarea>
	<br /><br />
	
	<input type="button" id="sendBtn" value="등록하기" class="btn" />

</div>

<div id="result">

</div>

</body>
</html>