<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 스크립트 릿 영역
	// 이전페이지에서 데이터 수신
	// 한글 깨짐 방지 
	request.setCharacterEncoding("UTF-8");

	// 이름 -- 단일값 수신
	String name = request.getParameter("name");
	
	// 성별 -- 라디오버튼 : 다중선택이 허용되지 않음, 단일값 수신
	String mf = request.getParameter("radioGroup");
	
	/*
	if(mf==null)
		mf = "성별확인불가";
	else if(mf.equals("M"))
		mf= "남자";
	else 
		mf= "여자"; 
	*/
	
	// 아래와 같이 작성하는 것이 더욱 바람직함..
	if(mf!=null)
	{
		if(mf.equals("M"))
			mf= "남자";
		else if(mf.equals("F"))
			mf= "여자";
		else
			mf = "성별확인불가";
	}
	else
		mf = "성별확인불가";
	
	
	
	// 전공 -- 선택상자, 단일값 수신(mutiple 속성 미부여)
	String major = request.getParameter("major");
	
	// 취미 -- 선택상자, 다중값 수신(mutiple 속성 부여) - 배열 형태로 수신
	String[] hobbys = request.getParameterValues("hobby");
	
	//response.setContentType("text/html; charset=UTF-8");
	String hobbyStr= "";
	if(hobbys!=null)
	{
		for(String hobby : hobbys)
			hobbyStr += " ["+ hobby + "] ";
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>RadioSelect.jsp  → RadioSelect_ok.jsp ●</p>
</div>

<div>
	<h2>radio, select 데이터 수신</h2>
	<div>
		<h3>수신한 데이터</h3>
		<p>이름 : <%=name %></p>
		<p>성별 : <%=mf %></p>
		<p>전공 : <%=major %></p>
		<p>취미 : <%=hobbyStr %></p>
		
	</div>
	
</div>

</body>
</html>