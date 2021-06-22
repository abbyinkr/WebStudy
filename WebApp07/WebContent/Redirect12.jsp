<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// Redirect12.jsp
	 
	// 데이터 수신
	String num1Str = request.getParameter("num1");	
	String num2Str = request.getParameter("num2");	
	String op = request.getParameter("calResult");

	String str = "";
	int num1 = 0;
	int num2 = 0;
	
	try
	{
		// 연산 처리
		
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if(op.equals("1"))
			str  += String.format("%d", (num1+num2));
		else if(op.equals("2"))		
			str += String.format("%d", (num1-num2));
		else if(op.equals("3"))		
			str += String.format("%d",(num1*num2));
		else if(op.equals("4"))		
			str += String.format("%.1f", (num1/(double)num2));
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	// Redirect 의 request 객체는 이 페이지에서 끝남...여기까지~!!!
	//request.setAttribute("result", str); (Ⅹ)
	
	// check~!!!
	// sendRedirect() 메소드 사용 : 결과 데이터 재전송 ★
	// ※ response 객체의 주요 메소드 중 하나인
	//    『sendedirect(String location)』
	//     : 지정된 URL(location)로 요청을 재전송한다.
	response.sendRedirect("Receive12.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&str="+str);
	// ※ 주의 : 공백이 들어가면 안된다!!
	 
	
	
	/* 
	나의 풀이
	//input 에 입력된 정수 값 가져오기 (num)
	String sNum1 = request.getParameter("num1");
	String sNum2 = request.getParameter("num2");
	
	// 추가
	int num1, num2;
	num1=num2=0;
	
	// 셀렉스 박스의 value 값 가져오기
	String op = request.getParameter("calResult");
	
	String str ="";
	
	try
	{
		num1 = Integer.parseInt(sNum1);
		num2 = Integer.parseInt(sNum2);
		
		// ※ 아래 구문은 공백과 + 가 모두 들어가있으므로 이렇게 쓰면 안된다. 
		if(op.equals("1"))
			str = String.format("%d + %d = %d", num1, num2, (num1+num2));
		else if(op.equals("2"))		
			str = String.format("%d - %d = %d", num1, num2, (num1-num2));
		else if(op.equals("3"))		
			str = String.format("%d * %d = %d", num1, num2, (num1*num2));
		else if(op.equals("4"))		
			str = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));
		
		
	}
	catch(Exception e)	
	{
		System.out.println(e.toString());
	}
	
	// 리다이렉트 (num1,num2,op도 주소에 추가해야함) -- 선생님 방식으로 해야 op 의 + 가 연산결과에 출력됨
	//response.sendRedirect("Receive12.jsp?str=" + str);
	//response.sendRedirect("Receive12.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&str="+str);
 	 */
%>
