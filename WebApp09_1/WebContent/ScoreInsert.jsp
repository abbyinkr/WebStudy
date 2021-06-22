<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	
	// 한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");

	// 데이터 수신 (ScoreList 로부터...)
	String name = request.getParameter("userName");
	String kor = request.getParameter("userKor");
	String eng = request.getParameter("userEng");
	String mat = request.getParameter("userMat");
	int result = 0;
	
	// 쿼리문 준비
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
			+ "VALUES(SCORESEQ.NEXTVAL, '%s', %s, %s, %s)", name, kor, eng, mat);
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 작업객체 생성
	Statement stmt = conn.createStatement();
	
	// 쿼리문 수행
	result = stmt.executeUpdate(sql);
	
	// 연결 종료
	stmt.close();
	DBConn.close();
	
	// int 처리 (수행결과 확인 <1 일 경우 db업뎃 실패)
	if(result < 1) // 에러페이지 발생
		response.sendRedirect("Error02.jsp");
	else	// 다시 돌아가라
		response.sendRedirect("ScoreList.jsp");
	

%>
