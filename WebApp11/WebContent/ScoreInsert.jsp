<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// ScoreInsert.jsp
	
	// 데이터 입력
	
	// 한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");	
	
	// 이전페이지에서 데이터 받아오기(이름, 국어점수, 영어점수, 수학점수)
	String userName = request.getParameter("userName");
	String scoreKor = request.getParameter("scoreKor");
	String scoreEng = request.getParameter("scoreEng");
	String scoreMat = request.getParameter("scoreMat");
	
	//ScoreDAO 선언
	ScoreDAO dao = null;
	
	int result = 0;
	
	try
	{
		dao = new ScoreDAO();
		
		ScoreDTO dto = new ScoreDTO();
		
		dto.setName(userName);
		dto.setKor(scoreKor);
		dto.setEng(scoreEng);
		dto.setMat(scoreMat);
		
		result = dao.add(dto);
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		dao.close();
	}
	
	if(result > 0)
		response.sendRedirect("ScoreList.jsp");

%>
