<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");

 	String cp = request.getContextPath();
 	
%>

<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<!-- 
위의 구문은 BoardDTO 인스턴스 생성과 같다.
 -->
<jsp:setProperty property="*" name="dto"/>
<!-- 
넘겨받은 데이터와 이름이 같은 dto의 모든 프로퍼티에 이전 페이지에서 넘겨받은 값을 담는다. (ip 제외)
 -->

<%

	// Created_ok.jsp
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 게시물 현재 상태의 최대값 얻어오기
	int maxNum = dao.getMaxNum();
	
	// 게시물 번호최대값에 1을더해서 set 하기 -- 게시물 등록시 게시물 번호 최대값 1 증가
	dto.setNum(maxNum+1);
	
	// ipaddress set 하기 -- 클라이언트에게 넘겨받지 못한 값이므로 request.getRemoteAdrr()를 이용한다.
	dto.setIpAddr(request.getRemoteAddr());
	
	// 데이터베이스 액션 처리 
	dao.insertData(dto);
	
	// 데이터베이스 종료
	DBConn.close();
	
	// List.jsp 요청할 수 있도록 안내하기
	response.sendRedirect("List.jsp");

%>
