<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body style="font-size: 10px;">

<div>
	<table style="width: 600px;" border="1">
		<tr>
			<td colspan="2">
				<!-- Top -->
				<jsp:include page="Top.jsp" flush="false"></jsp:include>
			</td>
		</tr>
		<tr style="height: 300px;">
			<td style="width: 140px;">
				<!-- Left -->
				<jsp:include page="Left.jsp" flush="false"></jsp:include>
			</td>
		<td>
			메인 화면
		</td>
		</tr>
		<tr>
			<td colspan="2">
				<!-- Bottom -->
				<jsp:include page="Bottom.jsp" flush="false"></jsp:include>
			</td>
		</tr>
	</table>
</div>

</body>
</html>