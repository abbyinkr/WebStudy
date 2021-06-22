<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%!
	// 페이지가 새로 로딩되어도 값을 기억하게 하기 위해서 전역변수로 선언..
	int year=0;
	int month=0;

%>

<%
	
	// 현재 연도 계산
	int thisYear = Calendar.getInstance().get(Calendar.YEAR);

	// 이전 페이지(자기자신)으로부터 데이터 받아오기
	// 연도
	String yearStr = request.getParameter("userYear");
	// 월
	String monthStr = request.getParameter("userMonth");
	
	
	int nalsu=0;
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	int w=0;
	String[] weekNames = {"일", "월", "화", "수", "목", "금", "토"};
	String blank="";
	String day="";
	 
	try
	{
		year = thisYear+Integer.parseInt(yearStr);
		// 여기서 형변환이 안되는데.. 이유를 모르겠어 ㅠㅠ
		month = Integer.parseInt(monthStr);
		
		if (year%4==0 && year%100!=0 || year%400==0)			//-- 입력한 연도가 윤년이라면...
		{
			// 2월의 마지막 날짜를 29일로 설정
			months[1] = 29;
		}
		else										//-- 입력한 연도가 평년이라면...
		{
			months[1] = 28;
		}
		
		// 1년 ~ 입력받은 연도 직전연도 까지의 날수 계산
		nalsu = year*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
		
		// 해당년도 1월 1일 부터 직전 월까지의 날수 계산
		for(int i=0; i<month-1; i++)
			nalsu += months[i];
		
		// 해당월 시작 요일
		nalsu += 1;
		w= nalsu%7; // w : 0 -> 일요일 ~ 6 -> 토요일
		

		for (int i=1; i<=w ; i++)
			blank+="&nbsp;&nbsp;&nbsp;";
	
		for (int i=1; i<=months[month-1]; i++)
		{
			day += String.format("&nbsp;&nbsp;%d", i);
			w++;			//-- 날짜가 증가하는 만큼

			if (w%7==0)		// 일요일마다
			{
				day += "<br>"; //개행
			}
		}
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SandAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function formChange(obj)
	{
		obj.submit();
	}

</script>

</head>
<body>
	<!-- 
		○ 데이터 송수신 실습 07
		   - 달력을 출력하는 JSP페이지를 구성한다.
		   - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
		   - 단, submit 버튼 없이 이벤트 처리를 한다.
		   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다. (단독 페이지)
		   - 연도 구성은 현재 년도 기준 이전 10년, 이후 10년으로 구성한다.
		   - 월은 1월 부터 12월 까지로 구성한다.
		   
		   [ 2021 ▼] 년   [ 5 ▼] 월
		   
		   --------------------------
		   --------------------------
		   
		   - 연도 select box 나 월 select box 내용 변화 시
		     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
		    
		   - 현재 연도 / 월 확인하는 과정에서 Calendar 클래스를 활용한다.
		     
		   - 사용자 최초 요청 주소는
		     http:///localhost:8090/WebApp07/SendAndReceive07.jsp
		     로 한다.
		     
		○ SendAndReceive07.jsp
    -->
<div>
	<h1>데이터 송수신 실습 07_02</h1>
	<hr>
</div>

<div>
	<form >
			<select name="userYear" id="userYear" onchange="formChange(this.form)">
				<option value="0">== 연도 선택 ==</option>
				<option value="-10" ><%=thisYear-10 %></option>
				<option value="-9" ><%=thisYear-9 %></option>
				<option value="-8" ><%=thisYear-8 %></option>
				<option value="-7" ><%=thisYear-7 %></option>
				<option value="-6" ><%=thisYear-6 %></option>
				<option value="-5" ><%=thisYear-5 %></option>
				<option value="-4" ><%=thisYear-4 %></option>
				<option value="-3" ><%=thisYear-3 %></option>
				<option value="-2" ><%=thisYear-2 %></option>
				<option value="-1" ><%=thisYear-1 %></option>
				<option value="0" ><%=thisYear%></option>
				<option value="1" ><%=thisYear+1 %></option>
				<option value="2" ><%=thisYear+2 %></option>
				<option value="3" ><%=thisYear+3 %></option>
				<option value="4" ><%=thisYear+4 %></option>
				<option value="5" ><%=thisYear+5 %></option>
				<option value="6" ><%=thisYear+6 %></option>
				<option value="7" ><%=thisYear+7 %></option>
				<option value="8" ><%=thisYear+8 %></option>
				<option value="9" ><%=thisYear+9 %></option>
				<option value="10" ><%=thisYear+10 %></option>
			</select> 년 
			
			<select name="userMonth" id="userMonth" onchange="formChange(this.form)">
				<option value="0">== 월 선택 ==</option>
				<option value="1" >1</option>
				<option value="2" >2</option>
				<option value="3" >3</option>
				<option value="4" >4</option>
				<option value="5" >5</option>
				<option value="6" >6</option>
				<option value="7" >7</option>
				<option value="8" >8</option>
				<option value="9" >9</option>
				<option value="10" >10</option>
				<option value="11" >11</option>
				<option value="12" >12</option>
				
			</select>월
	
	</form>
	
	
	
</div>


<div>
<br><br>
	<%=String.format("[%4d년 %3s월]<br>", year, month)%>
	<br><br>
	
	<%="  일  월  화  수  목  금  토"%><br>
	<%="============================"%><br>
	<%=blank %><%=day %><br>
	<%="============================"%><br>


		

</div>

</body>
</html>