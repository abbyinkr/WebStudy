<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>
<%
	// JsonTest02_ok.jsp
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	String result = "";
	
	// JSON 데이터(배열)
	// [{"이름1":"값1", "이름2":"값2", "이름3":"값3"}, {"이름4":"값4", "이름5":"값5", "이름6":"값6"}]
	
	// {"num":"1", "name":"조은선1","content":"내용1"}
	// {"num":"2", "name":"조은선2","content":"내용2"}
	// {"num":"3", "name":"조은선3","content":"내용3"}
	// {"num":"4", "name":"조은선4","content":"내용4"}
	// {"num":"5", "name":"조은선5","content":"내용5"}
	
	// {"num":"1", "name":"조은선1","content":"내용1"},
	// {"num":"2", "name":"조은선2","content":"내용2"},
	// {"num":"3", "name":"조은선3","content":"내용3"},
	// {"num":"4", "name":"조은선4","content":"내용4"},
	// {"num":"5", "name":"조은선5","content":"내용5"},
	
	// {"num":"1", "name":"조은선1","content":"내용1"},
	// {"num":"2", "name":"조은선2","content":"내용2"},
	// {"num":"3", "name":"조은선3","content":"내용3"},
	// {"num":"4", "name":"조은선4","content":"내용4"},
	// {"num":"5", "name":"조은선5","content":"내용5"}

	// [{"num":"1", "name":"조은선1","content":"내용1"}
	// , {"num":"2", "name":"조은선2","content":"내용2"}
	// , {"num":"3", "name":"조은선3","content":"내용3"}
	// , {"num":"4", "name":"조은선4","content":"내용4"}
	// , {"num":"5", "name":"조은선5","content":"내용5"}]
	
			
	for(int n=1; n<=5; n++) // 1 ~ 5 
	{
		StringBuffer sb = new StringBuffer();
		sb.append("{\"num\":\"" + n + "\"");
		sb.append(",\"name\":\"" + name + n + "\"");
		sb.append(",\"content\":\"" + content + n + "\"},"); // 『,』 check~!!
		
		result += sb.toString();
	
	}
	
	// 마지막 배열에 쉼표(,)를 뺀다. 
	result = result.substring(0, result.length()-1);
	
	// 배열 형태로 만들기 위해 양 끝에 브라켓([]) 을 씌운다.
	result = "[" + result + "]";
	
	out.println(result);
	

%>
