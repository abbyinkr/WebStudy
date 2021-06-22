<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//선생님 풀이
	
	// 자기 자신 페이지로부터 데이터 수신 후 처리하는 부분
	String sYear = request.getParameter("year");		//-- 페이지 최초 요청시  null
	String sMonth = request.getParameter("month");		//-- 페이지 최초 요청시  null
	
	// Calendar 객체 생성 
	//-- new Calendar 가 아닌 Calendar.getInstance() 로 달력 객체 생성 check!
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);		 // 2021
	int nowMonth = cal.get(Calendar.MONTH)+1;	 // 5
	int nowDay = cal.get(Calendar.DAY_OF_MONTH); // 11
	
	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	// 선택연도 변수를 현재 연도, 현재 월로 초기화
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 페이지 최초 요청이 아닐 경우
	// → 수신한 데이터로 표시할 달력의 년, 월 구성
	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	// 확인한 날짜로 년도 select option 구성 ----------------------------------------
	/* 
	
	// 기존에 선택한 연도 selected 된 상태로 설정
	
	<option value="2011">2011</option>
	<option value="2012">2012</option>
	<option value="2013">2013</option>
					:
	<option value="2021" selected="selected">2021</option> check~!! 
					:
	<option value="2030">2030</option>
	<option value="2031">2031</option> 
	*/
	
	String yOptions = "";
	//  year = 현재연도-10 ~ 현재연도+10 까지 option 구성
	for (int year=(selectYear-10); year<=(selectYear+10); year++ )
	{
		// 상황1. 페이지 최초 요청일 때 → sYear 는 null 이면서 현재 연도와 옵션값이 같을 때
		// 상황2. 페이지 최초 요청이 아닐 때
		// 상황3. 나머지
		if(sYear==null && year==nowYear)
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		//else if(sYear!=null && selectYear==year)	
		else if(sYear!=null && Integer.parseInt(sYear)==year)	
		{	
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		else
		{
			yOptions += "<option value='" + year + "'>" + year + "</option>";
		}
	}
	
	
	// ---------------------------------------- 확인한 날짜로 년도 select option 구성 
	
	
	
	// 확인한 날짜로 월 select option 구성 ------------------------------------------
	
	String mOptions = "";
	for (int month=1; month<=12; month++)
	{
		// 상황1. 페이지 최초 요청일 때 → sMonth 는 null 이면서 현재 연도와 옵션값이 같을 때
		// 상황2. 페이지 최초 요청이 아닐 때
		// 상황3. 나머지
		if(sMonth==null && month==nowMonth)
		{
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		}
		else if(sMonth!=null && Integer.parseInt(sMonth)==month)	
		{	
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		}
		else
		{
			mOptions += "<option value='" + month + "'>" + month + "</option>";
		}
	}
	
	// ------------------------------------------ 확인한 날짜로 월 select option 구성
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산 ---------------------
	// (만년달력)
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	// 윤년일 때..
	if(selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
		months[1] = 29;
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] weekName = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 현재년도 → 입력받은 연도의 직전 연도까지의 날 수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재 월 → 입력받은 월의 이전 월까지의 날 수 추가
	for(int i=0; i<selectMonth-1; i++)
		nalsu += months[i];
	// 입력받은 월 1일 
	nalsu++;	// +1
	
	int week = nalsu%7;						//-- 요일 변수
	int lastDay = months[selectMonth-1];	//--마지막 날짜 변수
	
	
	// --------------------- 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산 
	
	
	// 달력 그리기 -----------------------------------------------------------------
	
	// 요일 그리기
	String calStr = "";
	calStr += "<table border='1'>";
	calStr += "<tr>";
	
	for(int i=0; i<weekName.length; i++)
	{
		if(i==0) // 일요일
			calStr +="<th style='color:red;'>" + weekName[i] + "</th>";
		else if(i==6) // 토요일
			calStr +="<th style='color:blue;'>" + weekName[i] + "</th>";
		else
			calStr +="<th>" + weekName[i] + "</th>";
			
	}
	
	calStr += "</tr>";
	
	calStr += "<tr>";
	// 빈 칸 공백 td 발생
	for(int i=1; i<=week; i++)
		calStr += "<td></td>";
	
	// 날짜 td 발생
	for(int i=1; i<=lastDay; i++)
	{
		//calStr += "<td>" + i + "</td>";
		
		week++;
		
		// week++ 했기 때문에 나머지가 0 이 토요일
		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
			calStr += "<td class='nowSat'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
			calStr += "<td class='now'>" + i + "</td>";
		else if(week%7==0)
			calStr += "<td class='sat'>" + i + "</td>";
		else if(week%7==1)
			calStr += "<td class='sun'>" + i + "</td>";
		else
			calStr += "<td>" + i + "</td>";
		
		if(week%7==0)
			calStr += "</tr><tr>";

	}
	
	// 빈칸 공백 td 발생
	for (int i=0; i<=week; i++, week++)
	{
		if(week%7==0)
			break;
		
		calStr += "<td></td>";
	}
	
	if(week%7!=0)
		calStr += "</tr>";
	
	calStr += "</table>";
	
	
	
	// ----------------------------------------------------------------- 달력 그리기
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SandAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">

	td {text-align: right;}
	td.sat {color : blue;}
	td.sun {color : red;}
	td.now {background-color: aqua; font-weight: bold;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
</style>

<script type="text/javascript">

	function formCalendar(obj)
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
	<h1>데이터 송수신 실습 07</h1>
	<h3>선생님 풀이</h3>
	<hr>
</div>

<div>
	<!-- form 의 action 속성 값 생략 → 데이터의 수신처는 자기 자신(요청하는 페이지도 자기 자신) -->
	<form action="" method="post">
			<select name="year" id="year" onchange="formCalendar(this.form)">
				<!-- 
				<option value="2021">2021</option>
				<option value="2022">2022</option> 
				-->
				<%=yOptions %>
				
			</select> 년 
			
			<select name="month" id="month" onchange="formCalendar(this.form)">
				<!-- 
				<option value="1" >1</option>
				<option value="2" >2</option>
				 -->
				 <%=mOptions %>
			</select>월
	</form>
</div>

<div>
	<!-- 달력을 그리게 될 지점 -->
	 
	<%=calStr %>
	
	

</div>




</body>
</html>