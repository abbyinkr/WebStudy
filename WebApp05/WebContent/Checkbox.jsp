<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkbox.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>Checkbox.jsp ● → Checkbox_ok.jsp</p>
</div>

<div>
	<form action="Checkbox_ok.jsp" method="post">
		이름 <input type="text" name="name" class="txt"><br>
		메모 <br>
		<textarea rows="5" cols="30" name="memo"></textarea>
		<br><br>
		
		이상형<br>
		<label><input type="checkbox" value="송강" name="checkGroup">송강</label>
		<label><input type="checkbox" value="문빈" name="checkGroup">문빈</label>
		<label><input type="checkbox" value="이도현" name="checkGroup">이도현</label>
		<br>
		<label><input type="checkbox" value="이제훈" name="checkGroup">이제훈</label>
		<label><input type="checkbox" value="모모" name="checkGroup">모모</label>
		<label><input type="checkbox" value="박보검" name="checkGroup">박보검</label>
		<br><br>
		
		<input type="submit" value="전송" class="btn" style="width: 200px;">
		
	
	</form>
</div>


</body>
</html>